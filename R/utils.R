#' Open the openMSE Documentation website
#'
#' Opens the openMSE Documentation website (requires internet connection)
#'
#' @return Nothing is returned. Opens the 'openMSE.com' in the web browser
#' @export
#' @examples
#' userguide()
userguide <- function() {
  utils::browseURL("https://openmse.com/")
}


#' Run an example MSE
#'
#' Run an example MSE using three data-limited management procedures from
#' `DLMtool` and one stock assessment model from `SAMtool`.
#'
#' The MSE is run and three example performance metrics plots are produced: a
#' trade-off plot, a projection plot, and a Kobe plot.
#'
#' An MSE about is invisibly returned, and can be explored further (e.g., `summary(MSE)`).
#'
#' @return Invisibly returns an MSE object, and produces example plots of performance metrics.
#' @export
#'
#' @examples
#' \donttest{
#' MSE <- demo()
#' }
#' @importFrom MSEtool runMSE Kplot Pplot Tplot
#' @importFrom SAMtool DDSS_MSY
#' @importFrom DLMtool AvC matlenlim Itarget1
demo <- function() {
  time <- 3
  message('Running an example MSE with 10 simulations')

  OM <- MSEtool::testOM
  OM@nsim <- 10
  MPs <- c('AvC', 'matlenlim', 'Itarget1', 'DDSS_MSY')

  message('Using four example management procedures:')
  message('1. AvC - TAC set at the average catch (see ?DLMtool::AvC)')
  message('2. matlenlim - Size limit set at the length of maturity \n(see ?DLMtool::matlenlim)')
  message('3. Itarget1 - TAC set using an Index Target method (see ?DLMtool::Itarget1)')
  message('4. DDSS_MSY - TAC set using a state-space delay difference model with a TAC recommendation based on fishing at FMSY (see ?SAMtool::DDSS_MSY)')

  Sys.sleep(time)
  MSE <- MSEtool::runMSE(OM, MPs)
  message('MSE Complete')
  Sys.sleep(time)

  message('Plotting Results using example Performance Metrics:')
  message('Trade-Off Plot')
  message('Projection Plot')
  message('Kobe Plot')

  t <- Tplot(MSE, Show='plots')
  t <- Pplot(MSE, nam='Projection Plot')
  Kplot(MSE)

  invisible(MSE)

}


# change messages to blue text instead of default red
#' @importFrom crayon blue
message <- function(...) {
  if (requireNamespace("crayon", quietly = TRUE)) {
    x <- paste(...)
    return(base::message(crayon::blue(paste(base::strwrap(x), collapes="\n"))))
  } else {
    return(base::message(...))
  }
}

makeTOC <- function() {
  this_file <- file.path(getwd(), '_index.en.Rmd')
  txt <- readLines(this_file)
  heads <- Filter(function(x) grepl(x, pattern='###'), txt)
  if (length(heads)>0) {
    cat('### Sub-Sections\n')
    for (i in 1:length(heads)) {
      cat(makeLink(heads[i]))
    }
  }

}

makeLink <- function(txt) {
  txt <- gsub('### ', '', txt)
  txt2 <- tolower(txt)
  txt2 <- gsub(' ', '-', txt2)
  out <- paste0('* <a href="#', txt2, '">', txt, '</a><br>\n')
  out
}



