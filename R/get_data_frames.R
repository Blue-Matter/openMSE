
# Meta-data ----
#' Extract the meta-data from a `Hist` or `MSE` object
#'
#' @template x-parameter
#'
#' @details If `x` is a list of objects, each object must
#' have identical structure, i.e., same number of simulations,
#' same number of age-classes, historical and projection years,
#' management procedures, etc
#' @return A named list with elements:\tabular{ll}{
#'   \code{nsim} \tab The number of simulations \cr
#'   \code{nage} \tab The number of age classes \cr
#'   \code{Ages} \tab The age classes \cr
#'   \code{nyear} \tab The number of historical years \cr
#'   \code{Hist.Years} \tab A data.frame with the historical years in the `Year` column \cr
#'   \code{proyears} \tab The number of projection years \cr
#'   \code{Pro.Years} \tab A data.frame with the projection years in the `Year` column \cr
#'   \code{All.Years} \tab A data.frame with the historical and the projection years in the `Year` column \cr
#'   \code{nMPs} \tab The number of MPs (if `x` is an object of class `MSE`) \cr
#'   \code{MPs} \tab The MPs (if `x` is an object of class `MSE`) \cr
#' }
#' @export
#'
get_Metadata <- function(x) {
  UseMethod("get_Metadata")
}

#' @export
#' @rdname get_Metadata
get_Metadata.Hist <- function(x) {
  years <- get_Years(x)
  dd <- dim(x@AtAge$Select)
  nsim <- dd[1]
  nage <- dd[2]
  nyear <- dd[3]
  Ages <- 0:(nage-1)

  out <- list()
  out$nsim <- nsim
  out$nage <- nage
  out$Ages <- Ages
  out$nyear <- nyear
  hist.years <- years %>% filter(Period=='Historical')
  out$Hist.Years <- hist.years
  pro.years <- years %>% filter(Period=='Projection')
  out$proyears <- length(pro.years$Year)
  out$Pro.Years <- pro.years
  out$All.Years <- years
  out
}


#' @export
#' @rdname get_Metadata
get_Metadata.MSE <- function(x) {
  years <- get_Years(x)
  out <- list()
  out$nsim <- x@nsim
  dd <- dim(x@Hist@AtAge$Select)
  out$nage <- dd[2]
  Ages <- 0:(out$nage-1)
  out$Ages <- Ages
  hist.years <- years %>% filter(Period=='Historical')
  out$Hist.Years <- hist.years
  out$nyear <- length(hist.years)
  pro.years <- years %>% filter(Period!='Historical')
  out$proyears <- length(pro.years$Year)
  out$Pro.Years <- pro.years
  out$All.Years <- years
  out$nMPs <- x@nMPs
  out$MPs <- x@MPs
  out
}

#' @export
#' @rdname get_Metadata
get_Metadata.list <- function(x) {
  list <- purrr::map(x,  get_Metadata)
  identicalValue <- function(x,y) if (identical(x,y)) x else FALSE
  out <- Reduce(identicalValue,list)
  if (inherits(out, 'logical'))
    stop('Objects in list `x` do not have identical structure. Are `nsim`, `MPs` etc the same for all objects?')
  out
}

#' @export
#' @rdname get_Metadata
get_Metadata.MMSE <- function(x) {
  if (!inherits(x@multiHist, 'multiHist')) {
    stop('MMSE object must include multiHist slot. Add `multiHist` object  to `MMSE@multiHist`')
  }
  get_Metadata(x@multiHist)
}





#' Create a data.frame with Historical and Projection years
#'
#' @template x-parameter
#'
#' @return A data.frame with years and period (Historical or Projection)
#' @export
get_Years <- function(x) {
  UseMethod("get_Years")
}


#' @export
#' @rdname get_Years
get_Years.MSE <- function(x) {
  MSE <- x
  hist.yrs <- (MSE@OM$CurrentYr[1] - MSE@nyears + 1):MSE@OM$CurrentYr[1]
  proj.yrs <- (MSE@OM$CurrentYr[1]+1):(MSE@OM$CurrentYr[1]+MSE@proyears)
  data.frame(Year=c(hist.yrs, proj.yrs), Period=c(rep('Historical', MSE@nyears),
                                                  rep('Projection', MSE@proyears)))
}

#' @export
#' @rdname get_Years
get_Years.MMSE <- function(x) {
  MSE <- x
  CurrentYr <- MSE@Fleets[[1]][[1]]@CurrentYr
  nyears <- MSE@nyears
  proyears <- MSE@proyears

  hist.yrs <- (CurrentYr - nyears + 1):CurrentYr
  proj.yrs <- (CurrentYr+1):(CurrentYr[1]+proyears)
  data.frame(Year=c(hist.yrs, proj.yrs), Period=c(rep('Historical', nyears),
                                                  rep('Projection', proyears)))
}

#' @export
#' @rdname get_Years
get_Years.Hist <- function(x) {
  Hist <- x
  if (length(Hist@OM@CurrentYr)>0) {
    hist.yrs <- (Hist@OM@CurrentYr -  Hist@OM@nyears + 1):Hist@OM@CurrentYr
    proj.yrs <- (Hist@OM@CurrentYr[1]+1):(Hist@OM@CurrentYr[1]+Hist@OM@proyears)
    out <- data.frame(Year=c(hist.yrs, proj.yrs), Period=c(rep('Historical', Hist@OM@nyears),
                                                           rep('Projection', Hist@OM@proyears)))
  } else {
    hist.yrs <- x@Data@Year
    CurrentYr <- max(hist.yrs)
    if (is.na(CurrentYr))
      CurrentYr <- x@OMPars$CurrentYr[1]


    if (all(is.na(hist.yrs))) {
      nyears <- ncol(x@SampPars$Fleet$Find)
      hist.yrs <- rev(seq(CurrentYr, by=-1, length.out=nyears))
    }

    nyears <- length(hist.yrs)
    proyears <- x@Misc$MOM@proyears
    proj.yrs <- (CurrentYr+1):(CurrentYr[1]+proyears)
    out <- data.frame(Year=c(hist.yrs, proj.yrs), Period=c(rep('Historical', nyears),
                                                           rep('Projection', proyears)))
  }
  out
}

#' @export
#' @rdname get_Years
get_Years.multiHist <- function(x) {
  multiHist <- x

  hist.yrs <- multiHist[[1]][[1]]@Data@Year
  CurrentYr <- max(hist.yrs)
  nyears <- length(hist.yrs)
  proyears <- multiHist[[1]][[1]]@Misc$MOM@proyears
  proj.yrs <- (CurrentYr+1):(CurrentYr[1]+proyears)
  data.frame(Year=c(hist.yrs, proj.yrs), Period=c(rep('Historical', nyears),
                                                  rep('Projection', proyears)))
}


# Assessment Estimates ----

#' Create a data.frame with estimated values from a `SAMtool` assessment method
#' used in an MSE
#'
#' @param x An object of class `MSE` or a list of `MSE` objects, where
#' `MSE` includes management procedures that use `SAMtool` stock assessment
#' functions that return estimated values in `MSE@PPD`.
#' @template model-parameter
#'
#' @return A data.frame with columns:\tabular{ll}{
#'   \code{Year_assess} \tab The year the assessment was run in the MSE \cr
#'   \code{Year_est} \tab The year corresponding with the estimated value \cr
#'   \code{Variable} \tab The estimated variable \cr
#'   \code{Value} \tab The estimated value \cr
#'   \code{MP} \tab The name of the management procedure \cr
#'   \code{Simulation} \tab The simulation number \cr
#'   \code{Model} \tab The name of model \cr
#' }
#'
#' @export
#'
get_Assess_Estimates <- function(x, model='Model 1') {
  UseMethod('get_Assess_Estimates')
}

get_Assess_Estimates.MSE.MP <- function(mp, MSE, model='Model 1') {
  lapply(1:MSE@nsim, function(x) {
    if (!is.null(MSE@PPD[[mp]]@Misc[[x]]$Assessment_report)) {
      MSE@PPD[[mp]]@Misc[[x]]$Assessment_report %>%
        mutate(MP = MSE@MPs[mp], Simulation = x, Model=model) %>%
        rename(Variable=variable, Value=value)
    }
  })
}

#' @export
#' @rdname get_Assess_Estimates
get_Assess_Estimates.MSE <- function(x, model='Model 1') {
  lapply(1:x@nMPs, get_Assess_Estimates.MSE.MP, MSE=x, model=model) %>%
    bind_rows()
}

#' @export
#' @rdname get_Assess_Estimates
get_Assess_Estimates.list <- function(x, model=NULL) {
  x <- check_names(x)
  purrr::map2(x, names(x), get_Assess_Estimates.MSE) %>%
    purrr::list_rbind()
}

# At-Age Schedules ----

#' Create a data.frame with at-age schedules by simulation and year
#'
#' Note that the Selectivity and Retention curves in these plots are from the operating model. If an MP changes the
#' selectivity/retention, this is not shown in these plots.
#'
#' @template x-parameter
#' @template model-parameter
#' @param ... additional arguments
#' @return A data.frame
#' @export
#'
get_at_Age <- function(x, model='Model 1', ...) {
  UseMethod("get_at_Age")
}

#' @export
#' @rdname get_at_Age
get_at_Age.Hist <- function(x, model='Model 1', ...) {

  Vars <- c('Length', 'Weight', 'Select', 'Retention', 'Maturity', 'N.Mortality')
  metadata <- get_Metadata(x)
  years <- metadata$All.Years
  nsim <- metadata$nsim
  nage <- metadata$nage
  Ages <- metadata$Ages
  df_out <- data.frame(Year=rep(years$Year, each=nsim*nage),
                       Sim=1:nsim,
                       Age=rep(Ages, each=nsim),
                       Period=rep(years$Period, each=nsim*nage),
                       Model=model)

  for (i in seq_along(Vars)) {
    var <- Vars[i]
    value <- as.vector(x@AtAge[[var]])
    df_out[[var]] <- value
  }

  Vars2 <- Vars[Vars %in% names(df_out)]

  df_out %>% tidyr::pivot_longer(., cols=all_of(Vars2),
                                           names_to='Variable',
                                           values_to='Value')


}

#' @export
#' @rdname get_at_Age
get_at_Age.MSE <- function(x, model='Model 1', ...) {

  Vars <- c('Length', 'Weight', 'Select', 'Retention', 'Maturity', 'N.Mortality')
  metadata <- get_Metadata(x)
  years <- metadata$All.Years
  nsim <- metadata$nsim
  nage <- metadata$nage
  Ages <- metadata$Ages
  df_out <- data.frame(Year=rep(years$Year, each=nsim*nage),
                       Sim=1:nsim,
                       Age=rep(Ages, each=nsim),
                       Period=rep(years$Period, each=nsim*nage),
                       Model=model)

  x <- x@Hist
  for (i in seq_along(Vars)) {
    var <- Vars[i]
    value <- as.vector(x@AtAge[[var]])
    if (!is.null(scale) & inherits(scale, 'function')) {
      value <- scale(value)
    }
    df_out[[var]] <- value
  }
  df_out %>% tidyr::pivot_longer(., cols=all_of(Vars),
                                 names_to='Variable',
                                 values_to='Value')

}

#' @export
#' @rdname get_at_Age
get_at_Age.multiHist <- function(x, model='Model 1', ...) {

  n_stocks <- length(x)
  stock_names <- names(x)
  n_fleets <- length(x[[1]])
  fleet_names <- names(x[[1]])

  stock_list <- list()
  for (st in 1:n_stocks) {
    stock_list[[st]] <- list()
    for (fl in 1:n_fleets) {
      df_out <- get_at_Age.Hist(x[[st]][[fl]])
      df_out$Stock <- stock_names[st]
      df_out$Fleet <- fleet_names[fl]
      stock_list[[st]][[fl]] <- df_out
    }
    stock_list[[st]] <- purrr::list_rbind(stock_list[[st]])
  }
  do.call('rbind',stock_list)
}

# At-Length Schedules ----

#' Create a data.frame with at-length selectivity and retention schedules by simulation and year
#'
#' Note that the Selectivity and Retention curves in these plots are from the operating model. If an MP changes the
#' selectivity/retention, this is not shown in these plots.
#'
#' @template x-parameter
#' @template model-parameter
#' @param ... additional arguments
#' @return A data.frame
#' @export
get_at_Length <- function(x, model='Model 1', ...) {
  UseMethod("get_at_Length")
}

#' @export
#' @rdname get_at_Length
get_at_Length.multiHist <- function(x, model='Model 1', ...) {

  n_stocks <- length(x)
  stock_names <- names(x)
  n_fleets <- length(x[[1]])
  fleet_names <- names(x[[1]])

  stock_list <- list()
  Years <- get_Years(x)

  for (st in 1:n_stocks) {
    Lengths <- x[[st]][[1]]@SampPars$Stock$CAL_binsmid
    nbins <- length(Lengths)
    Stock <- names(x)[st]
    stock_list[[st]] <- list()


    for (fl in 1:n_fleets) {
      fl.code <- names(x[[st]])[fl]

      df_out <- data.frame(Year=rep(Years$Year, each=nbins),
                           Period=rep(Years$Period, each=nbins),
                           Length=Lengths, Fleet=fl.code,Stock=Stock,
                           Model=model)

      df_out$Select <- as.vector(x[[st]][[fl]]@SampPars$Fleet$SLarray[1,,])
      df_out$Retain <- as.vector(x[[st]][[fl]]@SampPars$Fleet$retL[1,,])
      stock_list[[st]][[fl]] <- df_out
    }
    stock_list[[st]] <- purrr::list_rbind(stock_list[[st]])
  }
  do.call('rbind',stock_list)
}


# Time-Series ----

#' Create a data.frame with time-series information by simulation and year
#'
#' @template x-parameter
#' @param variable A character string with a valid name for a time-series variable.
#' Use `valid_ts_variables()` for valid variable names.
#' @template model-parameter
#' @template scale-parameter
#' @param ... named arguments passed to `get_ts`
#'
#' @export
get_ts <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  UseMethod("get_ts")
}

#' @rdname get_ts
#' @export
valid_ts_variables <- function() {
  unique(TS_Variables$Variable)
}

match_ts_variable <- function(variable='Spawning Biomass', class='Hist') {
  if (!variable %in%  TS_Variables$Variable)
    stop('Not a valid time-series variable. See `valid_ts_variables()`')
  out <- TS_Variables %>% filter(Variable %in% variable, Class==class)
  out$Slot
}

#' @rdname get_ts
#' @export
valid_at_age_ts_variables <- function() {
  unique(At_Age_TS_Variables$Variable)
}

match_at_age_ts_variable <- function(variable='Spawning Biomass', class='Hist') {
  if (!variable %in%  At_Age_TS_Variables$Variable)
    stop('Not a valid time-series variable. See `valid_at_age_ts_variables()`')
  out <- At_Age_TS_Variables %>% filter(Variable %in% variable, Class==class)
  out$Slot
}


#' @export
#' @rdname get_ts
get_ts.Hist <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  slot <- match_ts_variable(variable, 'Hist')
  if (grepl('\\()', slot)) {
    fn <- gsub('\\()','', slot)
    value <- get(fn)(x)
  } else {
    value <- as.vector(apply(x@TSdata[[slot]], 1:2, sum))
  }
  if (!is.null(scale) & inherits(scale, 'function')) {
    value <- scale(value)
  }

  metadata <- get_Metadata(x)
  years <- get_Years(x) %>% filter(Period=='Historical')
  dd <- dim(x@TSdata$Number)
  nsim <- dd[1]
  data.frame(Year=rep(years$Year, each=nsim),
             Sim=1:nsim,
             Value=value,
             Variable=variable,
             Period=years$Period,
             Model=model)
}


#' @export
#' @rdname get_ts
get_ts.MSE <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {

  metadata <- get_Metadata(x)
  nsim <- x@nsim
  nMPs <- x@nMPs
  MPs <- x@MPs

  # Historical
  do_hist <- TRUE
  x@Hist@OM@nyears <- x@nyears
  x@Hist@OM@proyears <- x@proyears
  x@Hist@OM@CurrentYr <-  x@OM$CurrentYr[1]

  chk <- is.null(nrow(x@Hist@TSdata$Number))
  if (chk) {
    do_hist <- FALSE
  }
  if (do_hist)
    hist_df <- get_ts(x@Hist, variable=variable, model=model, scale=scale)

  # Projection
  slot <- match_ts_variable(variable, 'MSE')
  if (grepl('\\()', slot)) {
    fn <- gsub('\\()','', slot)
    value <- get(fn)(x)
  } else {
    value <- as.vector(slot(x, slot))
  }

  proj.years <- metadata$Pro.Years
  pyears <- metadata$proyears

  if (!is.null(scale) & inherits(scale, 'function')) {
    value <- scale(value)
  }

  proj_df <- data.frame(Year=rep(proj.years$Year, each=nsim*nMPs),
                        Sim=1:nsim,
                        MP=rep(MPs,each=nsim),
                        Value=value,
                        Period=proj.years$Period,
                        Model=model,
                        Variable=variable)

  if (do_hist) {
    out <- bind_rows(hist_df, proj_df)
  } else {
    message('Not including values from Historical period. Add `Hist` object to `MSE@Hist` or upgrade to more recent version of MSEtool to always include `MSE@Hist`')
    out <- proj_df
  }
  out
}

#' @export
#' @rdname get_ts
get_ts.list <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  if (inherits(x,'multiHist')) {
    return(get_ts.multiHist(x, variable=variable, model=model, scale=scale))
  }

  x <- check_names(x)
  purrr::map2(x, names(x), get_ts, variable=variable, scale=scale) %>%
    purrr::list_rbind()
}

#' @export
#' @rdname get_ts
get_ts.multiHist <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  n_stocks <- length(x)
  stock_names <- names(x)
  n_fleets <- length(x[[1]])
  fleet_names <- names(x[[1]])

  if (variable %in% c('Spawning Biomass', 'Biomass', 'Recruits')) {
    by_stock <- TRUE
    by_fleet <- FALSE
  }
  if (variable %in% c('Landings', 'Removals', "Apical Fishing Mortality")) {
    by_stock <- TRUE
    by_fleet <- TRUE
  }

  years <- get_Years(x) %>% filter(Period=='Historical')
  nsim <- x[[1]][[1]]@Misc$MOM@nsim

  slot <- match_ts_variable(variable, 'Hist')

  stock_list <- list()
  if (!by_fleet) {
    for (st in 1:n_stocks) {
      value <- as.vector(apply(x[[st]][[1]]@TSdata[[slot]], 1:2, sum))
      if (inherits(scale, 'list')) {
        if (!is.null(scale[[st]]) & inherits(scale[[st]], 'function')) {
          value <- scale[[st]](value)
        }
      } else {
        if (!is.null(scale) & inherits(scale, 'function')) {
          value <- scale(value)
        }
      }

      stock_list[[st]] <- data.frame(Year=rep(years$Year, each=nsim),
                                     Sim=1:nsim,
                                     Value=value,
                                     Variable=variable,
                                     Period=years$Period,
                                     Model=model,
                                     Stock=stock_names[st])
    }
    out <- do.call('rbind', stock_list)
  } else {
    for (st in 1:n_stocks) {
      stock_list[[st]] <- list()
      for (fl in 1:n_fleets) {
        value <- as.vector(apply(x[[st]][[fl]]@TSdata[[slot]], 1:2, sum))

        if (inherits(scale, 'list')) {
          if (!is.null(scale[[st]]) & inherits(scale[[st]], 'function')) {
            value <- scale[[st]](value)
          }
        } else {
          if (!is.null(scale) & inherits(scale, 'function')) {
            value <- scale(value)
          }
        }

        stock_list[[st]][[fl]] <- data.frame(Year=rep(years$Year, each=nsim),
                                             Sim=1:nsim,
                                             Value=value,
                                             Variable=variable,
                                             Period=years$Period,
                                             Model=model,
                                             Stock=stock_names[st],
                                             Fleet=fleet_names[fl])
      }
      stock_list[[st]] <- do.call('rbind', stock_list[[st]])
    }
    out <- do.call('rbind', stock_list)

  }
  out
}


#' @export
#' @rdname get_ts
get_ts.MMSE <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  metadata <- get_Metadata(x)
  nsim <- x@nsim
  nMPs <- x@nMPs
  MPs <- x@MPs[[1]]
  n_stocks <- x@nstocks
  stock_names <- names(x@multiHist)
  if (is.null(stock_names))
    stock_names <- paste('Stock', 1:n_stocks)
  n_fleets <- length(x@multiHist[[1]])
  fleet_names <- names(x@multiHist[[1]])
  if (is.null(fleet_names))
    fleet_names <- paste('Fleet', 1:n_fleets)


  # Historical
  do_hist <- TRUE
  if (!inherits(x@multiHist, 'multiHist'))
    do_hist <- FALSE

  if (do_hist)
    hist_df <- get_ts(x@multiHist, variable=variable, model=model, scale=scale)

  # Projection
  slot <- match_ts_variable(variable, 'MMSE')
  proj.years <- metadata$Pro.Years
  pyears <- metadata$proyears

  if (variable %in% c('Spawning Biomass', 'Biomass', 'Recruits')) {
    by_stock <- TRUE
    by_fleet <- FALSE
  }
  if (variable %in% c('Landings', 'Removals', "Apical Fishing Mortality")) {
    by_stock <- TRUE
    by_fleet <- TRUE
  }


  stock_list <- list()
  if (!by_fleet) {
    for (st in 1:n_stocks) {
      if (grepl('\\()', slot)) {
        fn <- gsub('\\()','', slot)
        value <- get(fn)(x)
      } else {
        value <- as.vector(slot(x, slot)[,st,,])
      }

      if (!is.null(scale) & inherits(scale, 'function')) {
        value <- scale(value)
      }


      stock_list[[st]] <- data.frame(Year=rep(proj.years$Year, each=nsim*nMPs),
                                     Sim=1:nsim,
                                     MP=rep(MPs,each=nsim),
                                     Value=value,
                                     Variable=variable,
                                     Period=proj.years$Period,
                                     Model=model,
                                     Stock=stock_names[st])
    }
    proj_df <- do.call('rbind', stock_list)
  } else {
    for (st in 1:n_stocks) {
      stock_list[[st]] <- list()
      for (fl in 1:n_fleets) {
        if (grepl('\\()', slot)) {
          fn <- gsub('\\()','', slot)
          value <- get(fn)(x)
        } else {
          value <- as.vector(slot(x, slot)[,st,fl,,])
        }
        if (!is.null(scale) & inherits(scale, 'function')) {
          value <- scale(value)
        }
        stock_list[[st]][[fl]] <- data.frame(Year=rep(proj.years$Year, each=nsim*nMPs),
                                       Sim=1:nsim,
                                       MP=rep(MPs,each=nsim),
                                       Value=value,
                                       Variable=variable,
                                       Period=proj.years$Period,
                                       Model=model,
                                       Stock=stock_names[st],
                                       Fleet=fleet_names[fl])

      }
      stock_list[[st]] <- do.call('rbind', stock_list[[st]])
    }
    proj_df <- do.call('rbind', stock_list)
  }


  if (do_hist) {
    out <- bind_rows(hist_df, proj_df)
  } else {
    message('Not including values from Historical period. Add `Hist` object to `MSE@Hist` or upgrade to more recent version of MSEtool to always include `MSE@Hist`')
    out <- proj_df
  }
  out
}


#' @export
#' @rdname get_ts
get_Biomass <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Biomass', model=model, ...)
}


#' @export
#' @rdname get_ts
get_Landings <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Landings', model=model, ...)
}

#' @export
#' @rdname get_ts
get_Removals <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Removals', model=model, ...)
}

#' @export
#' @rdname get_ts
get_Recruits <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Recruits', model=model, ...)
}


#' @export
#' @rdname get_ts
get_SSB <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Spawning Biomass', model=model, ...)
}

#' @export
#' @rdname get_ts
get_SB_SBMSY <- function(x, model='Model 1', ...) {
  get_ts(x, variable='SB_SBMSY', model=model, ...)
}


#' @export
#' @rdname get_ts
get_F <- function(x, model='Model 1', ...) {
  get_ts(x, variable='Apical Fishing Mortality', model=model, ...)
}

hist.recruits <- function(x) {
  as.vector(apply(x@AtAge$Number[,1,,], 1:2, sum))
}

mse.recruits <- function(x) {
  dd <- dim(x@N)
  if (length(dd)==3) {
    if (length(x@Misc$extended)<1)
      stop('Need to use `extended=TRUE` argument for `runMSE`, or update to a more recent version of `MSEtool` and run `runMSE` again')
  }
}



















check_names <- function(x) {
  if (is.null(names(x))) {
    message("List elements are not named. Using numeric values")
    names(x) <- 1:length(x)
  }
  x
}






#' Get Life History Parameters
#'
#' Extracts the life-history parameters: `Linf`, `K`, `L50`, and `ageM`
#'
#' @template x-parameter
#' @template model-parameter
#'
#' @return A data.frame
#' @export

get_LifeHistory <- function(x, model='Model 1') {
  UseMethod("get_LifeHistory")
}

#' @export
#' @rdname get_LifeHistory
get_LifeHistory.Hist <- function(x, model='Model 1') {

  Vars <- c('Linf', 'K', 'M', 'L50', 'ageM')

  years <- get_Years(x)
  dd <- dim(x@AtAge$Select)
  nsim <- dd[1]
  nage <- dd[2]
  nyear <- dd[3]
  Ages <- 0:(nage-1)

  df_out <- data.frame(Year=rep(years$Year, each=nsim),
                       Sim=1:nsim,
                       Period=years$Period,
                       Model=model)

  for (i in seq_along(Vars)) {
    var <- Vars[i]
    var2 <- paste0(Vars[i], 'array')
    df_out[[var]] <- as.vector(x@SampPars$Stock[[var2]])
  }
  df_out %>% tidyr::pivot_longer(., cols=all_of(Vars),
                                 names_to = 'Variable',
                                 values_to='Value')
}

#' @export
#' @rdname get_LifeHistory
get_LifeHistory.list <- function(x, model='Model 1') {
  x <- check_names(x)
  purrr::map2(x, names(x), get_LifeHistory) %>%
    purrr::list_rbind()
}

#' @export
#' @rdname get_LifeHistory
get_LifeHistory.MSE <- function(x, model='Model 1') {
  x@Hist@OM@nyears <- x@nyears
  x@Hist@OM@proyears <- x@proyears
  x@Hist@OM@CurrentYr <-  x@OM$CurrentYr[1]

  Hist <- x@Hist
  if (length(Hist@SampPars)<1) {
    stop("Currently doesn't work on `MSE` objects unless `runMSE(..., extended=TRUE`)")
  }
  get_LifeHistory(Hist, model=model)
}


# At Age Time-Series ----

#' Create a data.frame with time-series information by simulation and year
#'
#' @template x-parameter
#' @param variable A character string with a valid name for a time-series variable.
#' Use `valid_ts_variables()` for valid variable names.
#' @template model-parameter
#' @template scale-parameter
#'
#' @export
get_at_age_ts <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  UseMethod("get_at_age_ts")
}

get_at_age_ts.multiHist <- function(x, variable='Spawning Biomass', model='Model 1', scale=NULL) {
  n_stocks <- length(x)
  stock_names <- names(x)
  n_fleets <- length(x[[1]])
  fleet_names <- names(x[[1]])
  ages <- get_at_Age(x)$Age %>% unique()
  n_age <- length(ages)

  if (variable %in% c('Spawning Biomass', 'Biomass', 'Number')) {
    by_stock <- TRUE
    by_fleet <- FALSE
  }
  if (variable %in% c('Landings', 'Removals')) {
    by_stock <- TRUE
    by_fleet <- TRUE
  }

  years <- get_Years(x) %>% filter(Period=='Historical')
  nyears <- nrow(years)
  nsim <- x[[1]][[1]]@Misc$MOM@nsim

  slot <- match_at_age_ts_variable(variable, 'Hist')

  stock_list <- list()
  if (!by_fleet) {
    for (st in 1:n_stocks) {
      value <- as.vector(apply(x[[st]][[1]]@AtAge[[slot]], c(1,2,3), sum))
      if (inherits(scale, 'list')) {
        if (!is.null(scale[[st]]) & inherits(scale[[st]], 'function')) {
          value <- scale[[st]](value)
        }
      } else {
        if (!is.null(scale) & inherits(scale, 'function')) {
          value <- scale(value)
        }
      }

      stock_list[[st]] <- data.frame(Year=rep(years$Year, each=nsim*n_age),
                                     Sim=1:nsim,
                                     Age=rep(ages, each=nsim),
                                     Value=value,
                                     Variable=variable,
                                     Period=years$Period,
                                     Model=stock_names[st])
    }
    out <- do.call('rbind', stock_list)
  } else {
    for (st in 1:n_stocks) {
      stock_list[[st]] <- list()
      for (fl in 1:n_fleets) {
        value <- as.vector(apply(x[[st]][[fl]]@AtAge[[slot]], c(1,2,3), sum))

        if (inherits(scale, 'list')) {
          if (!is.null(scale[[st]]) & inherits(scale[[st]], 'function')) {
            value <- scale[[st]](value)
          }
        } else {
          if (!is.null(scale) & inherits(scale, 'function')) {
            value <- scale(value)
          }
        }

        stock_list[[st]][[fl]] <-  data.frame(Year=rep(years$Year, each=nsim*n_age),
                                              Sim=1:nsim,
                                              Age=rep(ages, each=nsim),
                                              Value=value,
                                              Variable=variable,
                                              Period=years$Period,
                                              Model=stock_names[st],
                                              Fleet=fleet_names[fl])
      }
      stock_list[[st]] <- do.call('rbind', stock_list[[st]])
    }
    out <- do.call('rbind', stock_list)

  }
  out
}

get_at_age_ts.MMSE <- function(x, variable='Biomass', model='Model 1', scale=NULL) {

  metadata <- get_Metadata(x)

  MPs <- x@MPs[[1]]
  nMPs <- length(MPs)

  # Historical
  Hist_df <- get_at_age_ts(x@multiHist, variable='Number')

  # add MPs to historical (for plotting)
  HistList <- list()
  for (i in 1:nMPs) {
    HistList[[i]] <- Hist_df
    HistList[[i]]$MP <- MPs[i]
  }
  Hist_df <- do.call('rbind', HistList)

  # Projection
  n_stocks <- x@nstocks
  stock_names <- x@Snames
  if (is.null(stock_names))
    stock_names <- paste('Stock', 1:n_stocks)
  names(stock_names) <- NULL

  n_fleets <- x@nfleets
  fleet_names <- unique(x@Fnames)[1:n_fleets]
  if (is.null(fleet_names))
    fleet_names <- paste('Fleet', 1:n_fleets)

  ages <- Hist_df$Age %>% unique()
  n_age <- length(ages)

  if (variable %in% c('Spawning Biomass', 'Biomass', 'Number')) {
    by_stock <- TRUE
    by_fleet <- FALSE
  }
  if (variable %in% c('Landings', 'Removals')) {
    by_stock <- TRUE
    by_fleet <- TRUE
  }

  years <- get_Years(x) %>% filter(Period=='Projection')
  nyears <- nrow(years)
  nsim <- x@nsim

  # Get number-at-age
  stock_list <- list()
  if (!by_fleet) {
    value <- as.vector(apply(x@N, c(1,2,3,4,5), sum))
    if (inherits(scale, 'list')) {
      if (!is.null(scale[[st]]) & inherits(scale[[st]], 'function')) {
        value <- scale[[st]](value)
      }
    }

    stock_list <- data.frame(Year=rep(years$Year, each=nsim*n_age*nMPs*n_stocks),
                             Sim=1:nsim,
                             Model=rep(stock_names, each=nsim),
                             Age=rep(ages, each=nsim*n_stocks),
                             MP=rep(MPs, each=nsim*n_stocks*n_age),
                             Value=value,
                             Variable='Number',
                             Period=rep(years$Period, each=nsim*n_age*n_stocks*nMPs)
    )

  } else {
    stop('Not supported yet')
  }

  # add historical
  stock_list <- bind_rows(Hist_df, stock_list)


  W_at_age <- get_at_Age(x@multiHist) %>% filter(Variable=='Weight') %>%
    select(Year, Sim, Age, Weight=Value, Model=Stock)

  DF <- left_join(stock_list, W_at_age)
  DF$Biomass <- DF$Value * DF$Weight
  DF
}

#' @export
#' @rdname get_ts
get_Biomass_at_Age <- function(x, model='Model 1', ...) {
  get_at_age_ts(x, variable='Biomass', model=model, ...)
}

#' @export
#' @rdname get_ts
get_Number_at_Age <- function(x, model='Model 1', ...) {
  get_at_age_ts(x, variable='Number', model=model, ...)
}

#' @export
#' @rdname get_ts
get_SSB_at_Age <- function(x, model='Model 1', ...) {
  get_at_age_ts(x, variable='Spawning Biomass', model=model, ...)
}


