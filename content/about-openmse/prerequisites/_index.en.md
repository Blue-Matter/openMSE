---
date: "2021-01-19T11:35:01+06:00"
title: Prerequisites
weight: 2
keywords:
  - DLMtool
  - MSEtool
  - SAMtool
  - openMSE
  - R
  - CRAN
  - RStudio
---

To use `openMSE` or any of its component packages you must have:

1. A recent version of the R software installed on your machine;
2. While not essential, we highly recommend using an integrated development environment (IDE) such as RStudio;
3. The latest version of `openMSE` or the individual component packages installed.

#### Installing R
The R statistical language and environment can be freely downloaded from the [CRAN website](https://cran.r-project.org/) and is available for all operating systems.  Updated versions of R are released frequently, and it is recommended that you have the latest version installed. 

If you are using Windows OS, you can uses the `installr` package and the `installr::updateR()` function to update and install the latest version.  Alternatively, head to the [CRAN website](https://cran.r-project.org/) to download the latest version of R. 

You can check your version of R by typing `version` into the R console.

#### RStudio  
[RStudio](https://www.rstudio.com/products/RStudio/) is a freely available integrated development environment (IDE) for R.  It is not essential that you use RStudio, but it can make things a lot easier, especially if you are new to R. We assume throughout the `openMSE` documentation that you are using RStudio.  

It is important to be aware that RStudio and R are two different pieces of software that must be installed separately.  We recommend installing the R software before downloading and installing RStudio. 

#### Installing the Packages
##### Installing `openMSE`

All component packages in the `openMSE` collection can be installed with:

```{r}
install.packages('openMSE')
```

and loaded into the R session with:

```{r}
library('openMSE')
````

This will load the `openMSE` package, and make all functions in `MSEtool`, `DLMtool`, and  `SAMtool` available.


##### Installing the component packages

To install only the core MSE functions, install and load the Management Strategy Evaluation toolkit with: `install.packages('MSEtool')` and `library('MSEtool')`.

To install and load the Data-Limited Methods toolkit use: `install.packages('DLMtool')` and `library('DLMtool')`. Note that this will also install and load the dependency `MSEtool`.

To install and load the Stock Assessment Methods toolkit use: `install.packages('SAMtool')` and `library('SAMtool')`. Note that this will also install and load the dependency `MSEtool`.


#### Assumed Knowledge

The `openMSE` packages have been designed to be accessible for all users and do not assume a high level of knowledge of R.  The functions and help documentation material have been constructed in such a way that a user with little experience with R should be able to run the MSE and apply the methods to their data.

No programming experience is required to use the package. However, users of the `openMSE` packages should have some familiarity with R, and be comfortable with using the command line. The help documentation attempts to explain the use of the `openMSE` functions and features in easy to follow steps, but familiarity with the most common R functions is assumed. 

The package is fully extensible, and more experienced R users are able to design their own management procedures, develop new plotting functions, and other customizations. 
