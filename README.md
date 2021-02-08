
<!-- README.md is generated from README.Rmd. Please edit that file -->

# openMSE <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/openMSE)](https://CRAN.R-project.org/package=openMSE)
[![R build
status](https://github.com/Blue-Matter/openMSE/workflows/R-CMD-check/badge.svg)](https://github.com/Blue-Matter/openMSE/actions)
[![](https://img.shields.io/badge/devel%20version-1.0.0-blue.svg)](https://github.com/blue-matter/openMSE)

<!-- badges: end -->

openMSE is an umbrella R package for building operating models,
analyzing fishery data, and conducting Management Strategy Evaluation
(MSE) for a wide range of fisheries.

Installing the openMSE package and loading with `library("openMSE")`
will load the following core packages:

[MSEtool](https://MSEtool.openMSE.com) - the Management Strategy
Evaluation toolkit is the core package in the openMSE collection. It
contains the core functions for constructing operating models,
simulating fishery dynamics, and evaluating the effectiveness of
alternative management strategies using closed-loop simulation testing.

[DLMtool](https://DLMtool.openMSE.com) - the Data-Limited Methods
toolkit is a collection of data-limited management procedures that can
be evaluated using MSE. DLMtool requires the MSEtool package as a
dependency, and all MSEtool functions will be available when DLMtool is
loaded into an R session.

[SAMtool](https://SAMtool.openMSE.com) - the Stock Assessment Methods
toolkit is a collection of assessment methods and management procedures
that have been developed for more data-intensive applications. This
package includes the Rapid Conditioning Model for conditioning operating
models in data-moderate and data-rich fisheries. SAMtool requires the
MSEtool package as a dependency, and all MSEtool functions will be
available when SAMtool is loaded into an R session.

You can learn more about the openMSE packages at the [openMSE
documentation site](https://openMSE.com).

## Installation

You can install the released version of openMSE from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("openMSE")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Blue-Matter/openMSE")
```

## Example

The `demo` function runs an example MSE using three data-limited
management procedures from `DLMtool` and one stock assessment model from
`SAMtool`, and demonstrates some example plotting output:

``` r
library(openMSE)
#> Loading required package: MSEtool
#> Loading required package: snowfall
#> Loading required package: snow
#> Loading required package: DLMtool
#> Loading required package: SAMtool
#> 
#> Attaching package: 'openMSE'
#> The following object is masked from 'package:SAMtool':
#> 
#>     userguide
#> The following object is masked from 'package:utils':
#> 
#>     demo
demo()
#> Running an example MSE with 10 simulations
#> Using four example management procedures:
#> 1. AvC - TAC set at the average catch (see ?DLMtool::AvC)
#> 2. matlenlim - Size limit set at the length of maturity (see 
#> ?DLMtool::matlenlim)
#> 3. Itarget1 - TAC set using an Index Target method (see 
#> ?DLMtool::Itarget1)
#> 4. DDSS_MSY - TAC set using a state-space delay difference model with a 
#> TAC recommendation based on fishing at FMSY (see ?SAMtool::DDSS_MSY)
#> Checking MPs
#> Loading operating model
#> Optimizing for user-specified movement
#> Optimizing for user-specified depletion in last historical year
#> Calculating historical stock and fishing dynamics
#> Calculating MSY reference points for each year
#> Calculating B-low reference points
#> Calculating reference yield - best fixed F strategy
#> Simulating observed data
#> Running forward projections
#> 1 / 4 Running MSE for AvC
#> ..................................................
#> 2 / 4 Running MSE for matlenlim
#> ..................................................
#> 3 / 4 Running MSE for Itarget1
#> ..................................................
#> 4 / 4 Running MSE for DDSS_MSY
#> ..................................................
#> 6 years had TAC = NA for some simulations ( 5 % of total simulations)
#> Used TAC_y = TAC_y-1
#> MSE Complete
#> Plotting Results using example Performance Metrics:
#> Trade-Off Plot
#> Projection Plot
#> Kobe Plot
```

<img src="man/figures/README-example-1.png" width="100%" /><img src="man/figures/README-example-2.png" width="100%" /><img src="man/figures/README-example-3.png" width="100%" />
