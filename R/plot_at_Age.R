
#' Plot at-Age schedules
#'
#' Plots Length, Weight, Maturity, Natural-Mortality, Selectivity, and Retention-at-Age
#' schedules.
#'
#' Note that the Selectivity and Retention curves in these plots are from the operating model. If an MP changes the
#' selectivity/retention, this is not shown in these plots.
#'
#' @template x-parameter
#' @param quantiles Lower and upper quantiles to calculate. Numeric vector of length 2.
#' @template scale-parameter
#' @param variable String. One of 'Length', 'Weight', 'N.Mortality','Maturity', 'Select', 'Retention'
#' @param xlab X-axis label (default 'Age (Year)')
#' @param ylab Y-axes label
#' @param title Optional title
#' @param years Optional numeric vector specifying the years to plot. Default is the first and last historical year, and the last projection year
#' @param alpha Transparency parameter
#' @param lwd Line width
#' @param use_theme Optional ggplot theme
#' @param colpalette Color palette from `RColorBrewer`
#' @param print Logical. Print the plot?
#' @param ... Named arguments passed to `plot_at_Age`
#' @return A named list with:\tabular{ll}{
#'   \code{p} \tab The `ggplot` object \cr
#'   \code{df} \tab Data.frame with the summary statistics (median and quantiles) \cr
#' }
#' @export
plot_at_Age <- function(x,
                        quantiles=c(0.025, 0.975),
                        scale=NULL,
                        variable='Length',
                        xlab='Age (Year)',
                        ylab=NULL,
                        title='',
                        years=NULL,
                        alpha=0.1,
                        lwd=1,
                        use_theme=NULL,
                        colpalette='Dark2',
                        print=TRUE) {
  check_class(x)

  df <- summary_df(x, quantiles=quantiles, get_at_Age, scale=scale, years=years) %>%
    filter(Variable %in% variable)

  if (is.null(ylab)) {
    ylab <- unique(df$Variable)
    ylab[ylab=='Select'] <- 'Selectivity'
    ylab[ylab=='N.Mortality'] <- 'Natural Mortality (M)'
  }

  multi.variable <- ifelse(length(ylab)>1, TRUE, FALSE)
  if (multi.variable)
    ylab <- 'Probability'

  n.models <- df$Model %>% unique() %>% length()

  multi.model <- ifelse(n.models>1, TRUE, FALSE)

  if (multi.model) {
    p <- ggplot(df, aes(x=Age, y=Median, ymin=Lower, ymax=Upper, linetype=Variable)) +
      facet_grid(Year~Model) +
      geom_ribbon(alpha=alpha, aes(fill=Model)) +
      geom_line(linewidth=lwd, aes(color=Model)) +
      labs(x = xlab, y = ylab, title= title) +
      scale_fill_brewer(palette=colpalette) +
      scale_color_brewer(palette=colpalette) +
      expand_limits(y=0)

  } else {
    p <- ggplot(df, aes(x=Age, y=Median, ymin=Lower, ymax=Upper, linetype=Variable)) +
      facet_wrap(~Year) +
      geom_ribbon(alpha=alpha) +
      geom_line(linewidth=lwd) +
      labs(x = xlab, y = ylab, title= title) +
      scale_fill_brewer(palette=colpalette) +
      scale_color_brewer(palette=colpalette) +
      expand_limits(y=0)
  }
  p <- p +guides(fill='none', color='none')

  if(!multi.variable)
    p <- p +guides(linetype='none')

  if (is.null(use_theme)) {
    p <- p + theme_default()
  } else {
    p <- p + use_theme()
  }

  if (print)
    print(p)
  invisible(list(plot=p, df=df))

}


#' @export
#' @describeIn plot_at_Age Plot Length-at-Age
plot_Length <- function(x, ...) {
  plot_at_Age(x, variable='Length', ...)
}

#' @export
#' @describeIn plot_at_Age Plot Weight-at-Age
plot_Weight <- function(x, ...) {
  plot_at_Age(x, variable='Weight', ...)
}

#' @export
#' @describeIn plot_at_Age Plot Maturity-at-Age
plot_Maturity <- function(x, ...) {
  plot_at_Age(x, variable='Maturity', ...)
}

#' @export
#' @describeIn plot_at_Age Plot N.Mortality-at-Age
plot_N.Mortality <- function(x, ...) {
  plot_at_Age(x, variable='N.Mortality', ...)
}


#' @export
#' @describeIn plot_at_Age Plot Selectivity-at-Age
plot_Select <- function(x, ...) {
  plot_at_Age(x, variable='Select', ...)
}

#' @export
#' @describeIn plot_at_Age Plot Retention -at-Age
plot_Retention <- function(x, ...) {
  plot_at_Age(x, variable='Retention', ...)
}

#' @export
#' @describeIn plot_at_Age Plot Selectivity-, Retention-, and Maturity-at-Age
plot_Select_Maturity <- function(x, ...) {
  plot_at_Age(x, variable=c('Select', 'Maturity', 'Retention'), ...)
}


