
summary_df <- function(x, quantiles=c(0.025, 0.975), func=get_SSB, scale=NULL, years=NULL) {


  df <- func(x, scale=scale)
  df$Model <- factor(df$Model, ordered = TRUE, levels=unique(df$Model))
  if (!is.null(df[["Fleet"]]))
    df$Fleet <- factor(df$Fleet, ordered = TRUE, levels=unique(df$Fleet))

  if (!is.null(df[["Stock"]]))
    df$Stock <- factor(df$Stock, ordered = TRUE, levels=unique(df$Stock))

  # filter years
  All.Years <- df %>% distinct(Year, Period)
  if (is.null(years)) {
    # if age-schedules
    if (!is.null(df[['Age']])) {
      fst.yr <- All.Years %>% filter(Period=='Historical') %>% head(1)
      lst.hist.yr <- All.Years %>% filter(Period=='Historical') %>% tail(1)
      lst.yr <- All.Years$Year %>% max()
      years <- c(fst.yr$Year, lst.hist.yr$Year, lst.yr)
    } else {
      years <- All.Years$Year
    }
  } else {
    ind <- years %in% All.Years$Year
    if (any(!ind)) {
      stop('`years` argument invalid. Valid years are in the range: ', paste(range(All.Years$Year), collapse='-'))
    }
  }
  df <- df %>% filter(Year %in% years)
  df$Year <- factor(df$Year)

  if (!is.null(df[['MP']])) {
    if (!is.null(df[['Age']])) {
      df <- df %>%  group_by(Year, Age, MP,Variable, Period, Model)
    } else {
      df <- df %>%  group_by(Year, MP,Variable, Period, Model)
    }

  } else {
    if (!is.null(df[['Fleet']])) {
      if (!is.null(df[['Age']])) {
        df <- df %>%  group_by(Year,Age, Variable, Period, Model, Stock, Fleet)
      } else {
        df <- df %>%  group_by(Year,Variable, Period, Model, Stock, Fleet)
      }

    } else {
      if (!is.null(df[['Age']])) {
        df <- df %>%  group_by(Year,Age, Variable, Period, Model)
      } else {
        df <- df %>%  group_by(Year,Variable, Period, Model)
      }
    }

  }
  if (length(quantiles)==1) {
    if(quantiles==0.5) {
      quantiles <- c(0.5,0.5)
    } else {
      stop('`quantiles` must be length 2 or 0.5')
    }
  }
  df %>%
    summarize(Lower=quantile(Value, quantiles[1]),
              Median=median(Value),
              Upper=quantile(Value, quantiles[2]),
              .groups='drop')
}

plot_ts_quants <- function(df,
                           xlab='Year',
                           ylab=NULL,
                           title='',
                           alpha=0.1,
                           lwd=1,
                           use_theme=NULL,
                           colpalette='Dark2',
                           facet=TRUE,
                           inc.Legend=!facet,
                           inc.Hist=FALSE,
                           print=TRUE) {

  nmodel <- df$Model %>% unique() %>% length()
  multi_model <- ifelse(nmodel>1, TRUE, FALSE)
  hist_only <- all(df$Period == 'Historical')

  # Hist
  # no facet, no legend
  if (!multi_model & hist_only)
    p <- plot_ts_hist(df, xlab, ylab, title, alpha, lwd, colpalette) +
    guides(color='none', fill='none')

  # HistList (multi-model)
  if (multi_model & hist_only) {
    if (!facet) {
      p <- plot_ts_hist(df, xlab, ylab, title, alpha, lwd, colpalette)
    } else {
      p <- plot_ts_hist(df, xlab, ylab, title, alpha, lwd, colpalette)
      if (!is.null(df[['Fleet']])) {
        p <- p + facet_grid(Model~Fleet, scales='free_y')
      } else {
        p <- p + facet_wrap(~Model)
      }

    }
  }
  # MSE
  if (!multi_model & !hist_only) {
    p <- plot_ts_proj(df, xlab, ylab, title, alpha, lwd, inc.Hist, colpalette)

    if (facet) {
      p <- p + facet_wrap(~MP)
    }
  }
  # MSElist (multi-model)
  if (multi_model & !hist_only) {
    if (!facet) {
      p <- plot_ts_proj(df, xlab, ylab, title, alpha, lwd, inc.Hist, colpalette) +
        facet_wrap(~Model)
    } else {
      p <- plot_ts_proj(df, xlab, ylab, title, alpha, lwd, inc.Hist, colpalette) +
        facet_grid(MP~Model)
    }
  }

  if (is.null(use_theme)) {
    p <- p + theme_default()
  } else {
    p <- p + use_theme()
  }

  if (!inc.Legend)
    p <- p + guides(color='none', fill='none')

  p <- p + scale_x_discrete(breaks=set_breaks)

  if (print)
    print(p)
  invisible(list(plot=p, df=df))
}


set_breaks <- function(limits) {
  limits <- as.numeric(limits)
  nyrs <- length(limits)
  if (nyrs<=10) {
    by <- 1
  } else {
    by <- 5
  }
  seq(min(limits), by=by, to=max(limits))
}


plot_ts_hist <- function(df, xlab, ylab, title, alpha, lwd, colpalette) {
  # no facet and no legend
  if (is.null(ylab))
    ylab <- unique(df$Variable)
  p <- ggplot(df, aes(x=Year, y=Median, ymin=Lower, ymax=Upper, group=Model))+
    geom_ribbon(alpha=alpha, aes(fill=Model)) +
    geom_line(linewidth=lwd, aes(color=Model)) +
    labs(x = xlab, y = ylab, title= title) +
    scale_fill_brewer(palette=colpalette) +
    scale_color_brewer(palette=colpalette) +
    expand_limits(y=0)
  p
}


plot_ts_proj <- function(df, xlab, ylab, title, alpha, lwd, inc.Hist, colpalette) {
  if (is.null(ylab))
    ylab <- unique(df$Variable)

  if (inc.Hist) {
    MPs <- df$MP %>% unique()
    MPs <- MPs[!is.na(MPs)]
    nMPs <- length(MPs)
    df_hist <- df %>% filter(Period=='Historical')
    hist_list <- replicate(nMPs, df_hist, FALSE)
    for (i in 1:nMPs) {
      hist_list[[i]]$MP=MPs[i]
    }
    df_hist <- do.call('rbind', hist_list)
    df_proj <- df %>% filter(Period!='Historical')
    df <- dplyr::bind_rows(df_hist, df_proj)
    df$MP <- factor(df$MP, ordered = TRUE, levels=MPs)
  } else {
    df <- df %>% filter(Period!='Historical')
    MPs <- df$MP %>% unique()
    MPs <- MPs[!is.na(MPs)]
    df$MP <- factor(df$MP, ordered = TRUE, levels=MPs)
  }
  p <- ggplot(df, aes(x=Year, y=Median, ymin=Lower, ymax=Upper, group=MP)) +
    geom_ribbon(alpha=alpha, aes(fill=MP)) +
    geom_line(linewidth=lwd, aes(color=MP)) +
    labs(x = xlab, y = ylab, title= title) +
    scale_fill_brewer(palette=colpalette) +
    scale_color_brewer(palette=colpalette) +
    expand_limits(y=0)

  if (inc.Hist) {
    lastYr <- as.numeric(df_hist$Year) %>% max()
    p <- p + geom_vline(xintercept = lastYr, lty=3)
  }

  p
}


check_class <- function(x) {
  ok <- FALSE
  if (inherits(x, 'MSE') | inherits(x, 'Hist') |  inherits(x, 'multiHist')) {
    ok <- TRUE
  }
  if (inherits(x, 'list') ) {
    classes <- lapply(x, class) %>% unlist() %>% unique()
    if (length(classes)>1)
      stop('Objects in `x` list are not all the same class')
    if (classes %in% c('Hist', 'MSE'))
      ok <- TRUE
  }
  if (!ok)
    stop('Argument `x` is not valid. Must be class `Hist`, `MSE`, or a list of these objects')

}


#' Plots the median and quantiles of a time-series
#'
#' @template x-parameter
#' @param xlab X-axis label (default 'Year')
#' @param ylab Y-axes label
#' @param title Optional title
#' @param quantiles Lower and upper quantiles to calculate. Numeric vector of length 2.
#' @template scale-parameter
#' @param alpha Transparency parameter
#' @param lwd Line width
#' @param use_theme Optional ggplot theme
#' @param colpalette Color palette from `RColorBrewer`
#' @param facet Logical. Facet the plot?
#' @param inc.Legend Logical. Include legend?
#' @param inc.Hist Logical. For `MSE` results, include the historical period?
#' @param print Logical. Print the plot?
#' @param get_function `get_` function to extract time-series information from `x`
#' @param years Optional numeric vector specifying the years to plot. Default is all years.
#' @param ... Named arguments passed to `plot_TS`
#'
#' @return A named list with:\tabular{ll}{
#'   \code{p} \tab The `ggplot` object \cr
#'   \code{df} \tab Data.frame with the summary statistics (median and quantiles) \cr
#' }
#' @export
plot_TS <- function(x,
                    xlab='Year',
                    ylab='Spawning Biomass',
                    title='',
                    quantiles=c(0.025, 0.975),
                    scale=NULL,
                    alpha=0.1,
                    lwd=1,
                    use_theme=NULL,
                    colpalette='Dark2',
                    facet=TRUE,
                    inc.Legend=!facet,
                    inc.Hist=FALSE,
                    print=TRUE,
                    get_function=get_SSB,
                    years=NULL,
                    ...) {
  check_class(x)
  df <- summary_df(x, quantiles=quantiles, get_function, scale=scale, years=years)

  plot_ts_quants(df, xlab=xlab, ylab=ylab, title=title, alpha,
                 lwd, use_theme, colpalette, facet, inc.Legend, inc.Hist, print)
}

#' @export
#' @describeIn plot_TS Plot the Spawning Biomass
plot_SSB <- function(x, ...) {
  plot_TS(x, get_function=get_SSB, ...)
}

#' @export
#' @describeIn plot_TS Plot the Total Biomass
plot_Biomass <- function(x, ylab='Biomass', ...) {
  plot_TS(x, get_function=get_Biomass, ylab=ylab, ...)
}

#' @export
#' @describeIn plot_TS Plot the Landings (biomass)
plot_Landings <- function(x, ylab='Landings', ...) {
  plot_TS(x, get_function=get_Landings, ylab=ylab, ...)
}


#' @export
#' @describeIn plot_TS Plot the Removals (biomass)
plot_Removals <- function(x, ylab='Removals', ...) {
  plot_TS(x, get_function=get_Removals, ylab=ylab, ...)
}

#' @export
#' @describeIn plot_TS Plot the Recruits (numbers)
plot_Recruits <- function(x, ylab='Recruits', ...) {
  plot_TS(x, get_function=get_Recruits, ylab=ylab, ...)
}

#' @export
#' @describeIn plot_TS Plot the Recruits (numbers)
plot_F <- function(x, ylab='Fishing Mortality (F)', ...) {
  plot_TS(x, get_function=get_F, ylab=ylab, ...)
}


#' @export
#' @describeIn plot_TS Plot the Life-History parameters
plot_LifeHistory <- function(x,
                             xlab='Year',
                             ylab='Median (quantiles)',
                             title='',
                             quantiles=c(0.025, 0.975),
                             scale=NULL,
                             alpha=0.1,
                             lwd=1,
                             use_theme=NULL,
                             colpalette='Dark2',
                             facet=TRUE,
                             inc.Legend=!facet,
                             inc.Hist=FALSE,
                             print=TRUE) {

  df <- summary_df(x, quantiles=quantiles, func=get_LifeHistory, scale=NULL)

  nmodel <- df$Model %>% unique() %>% length()
  multi_model <- ifelse(nmodel>1, TRUE, FALSE)
  df$Year <- as.numeric(df$Year)
  if (multi_model) {
    p <- ggplot(df, aes(x=Year, y=Median, ymin=Lower, ymax=Upper))+
      geom_ribbon(alpha=alpha, aes(fill=Model)) +
      geom_line(linewidth=lwd, aes(color=Model)) +
      facet_grid(Variable~Model, scales='free_y') +
      guides(color='none', fill='none')

  } else {

    p <- ggplot(df, aes(x=Year, y=Median, ymin=Lower, ymax=Upper))+
      geom_ribbon(alpha=alpha, aes(fill=Model)) +
      geom_line(linewidth=lwd, aes(color=Model)) +
      facet_wrap(~Variable, scales='free_y') +
      guides(color='none', fill='none')

  }
  p <- p +  scale_fill_brewer(palette=colpalette) +
    scale_color_brewer(palette=colpalette)

  if (is.null(use_theme)) {
    p <- p + theme_default()
  } else {
    p <- p + use_theme()
  }
  p
}
