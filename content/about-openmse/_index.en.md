---
date: "2020-12-16T15:18:01+06:00"
description: Everything you want to know about openMSE
icon: ti-info-alt
title: About openMSE
type: welcome
weight: 1
keywords: 
- openMSE
- MSEtool
- SAMtool
- DLMtool
---

`openMSE` is an umbrella R package for building operating models, analyzing fishery data, and conducting Management Strategy Evaluation (MSE) for a wide range of fisheries.

`openMSE` uses an age-structured spatial population dynamics model to simulate fishery dynamics. Full details of the population dynamics model are available in a [paper](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.13081) published in *Methods in Ecology and Evolution*.

The `openMSE` package is available on [CRAN](#cran-openMSE) can be installed with `install.packages("openMSE")`. Installing the `openMSE` package and loading with `library("openMSE")` will load the following core packages:

1. [MSEtool](#MSEtool) - the Management Strategy Evaluation toolkit is the core package in the openMSE collection. It contains the core functions for constructing operating models, simulating fishery dynamics, and evaluating the effectiveness of alternative management strategies using closed-loop simulation testing. 

2.  [DLMtool](#DLMtool) - the Data-Limited Methods toolkit is a collection of data-limited management procedures that can be evaluated using MSE. `DLMtool` requires the `MSEtool` package as a dependency, and all `MSEtool` functions will be available when `DLMtool` is loaded into an R session. 

3.  [SAMtool](#SAMtool) - the Stock Assessment Methods toolkit is a collection of assessment methods and management procedures that have been developed for more data-intensive applications. This package includes the [Rapid Conditioning Model](#RCM) for conditioning operating models in data-moderate and data-rich fisheries. `SAMtool` requires the `MSEtool` package as a dependency, and all `MSEtool` functions will be available when `SAMtool` is loaded into an R session.

You can learn more about the specifics of the `openMSE` packages [here](the-r-packages).

#### About this Site
This site contains help documentation for the key features of the `openMSE` universe. For help documentation for specific R functions, see the individual component [package](the-r-packages) documentation sites.

Please see the [Frequently Asked Questions](/faq) for a list of the most commonly asked questions.


#### Getting Started
For first time users of `openMSE`, we recommend reading through the following sub-sections, and then taking the [Quick Tour](/a-quick-tour/) of `openMSE`.



