% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data_frames.R
\name{get_Assess_Estimates}
\alias{get_Assess_Estimates}
\alias{get_Assess_Estimates.MSE}
\alias{get_Assess_Estimates.list}
\alias{get_Assess_Estimates.MMSE}
\title{Create a data.frame with estimated values from a \code{SAMtool} assessment method
used in an MSE}
\usage{
get_Assess_Estimates(x, model = "Model 1")

\method{get_Assess_Estimates}{MSE}(x, model = "Model 1")

\method{get_Assess_Estimates}{list}(x, model = NULL)

\method{get_Assess_Estimates}{MMSE}(x, model = NULL)
}
\arguments{
\item{x}{An object of class \code{MSE} or a list of \code{MSE} objects, where
\code{MSE} includes management procedures that use \code{SAMtool} stock assessment
functions that return estimated values in \code{MSE@PPD}.}

\item{model}{An optional name for the model.
If \code{x} is a list of objects, \code{model} will be taken from \code{names(x)}.
If \code{names(x)} is \code{NULL}, \code{model} will be given sequential numerical values (e.g., \verb{Model 1}, \verb{Model 2}, ...)}
}
\value{
A data.frame with columns:\tabular{ll}{
\code{Year_assess} \tab The year the assessment was run in the MSE \cr
\code{Year_est} \tab The year corresponding with the estimated value \cr
\code{Variable} \tab The estimated variable \cr
\code{Value} \tab The estimated value \cr
\code{MP} \tab The name of the management procedure \cr
\code{Simulation} \tab The simulation number \cr
\code{Model} \tab The name of model \cr
}
}
\description{
Create a data.frame with estimated values from a \code{SAMtool} assessment method
used in an MSE
}
