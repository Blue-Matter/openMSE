---
date: "2021-02-10T11:35:01+06:00"
title: RCM for conditioning operating models
weight: 1
---

The stock reduction paradigm can be quite useful for informing the historical scenarios in an operating model. Suppose that we are unsure about how to specify certain life history parameters, e.g. steepness. For other life history parameters such as growth, we may be more certain or we prefer to incorporate uncertainty in other parameters. With some data, we can try to fit an age-structured model that estimates historical depletion (spawning biomass in the last year of the historical period relative to that when fishing started), recruitment, and fishing mortality that are consistent with the specified parameter values. 

`RCM()` will be the main function for scoping historical scenarios for an operating model `OM`. From an operating model and a list of data inputs, the RCM returns an object with an updated OM and predicted outputs from the SRA. All model configurations for the SRA will also be specified through arguments passed through `RCM`.

The approach can be stochastic (with Monte Carlo sampling) if the operating model is specified as such. For example, steepness is highly uncertain, then one could specify a range of values, for example, between 0.6 and 0.9 with a uniform distribution, in an operating model:

```{r, eval = FALSE}
OM@h <- c(0.6, 0.9)
```
If one wishes to run 250 simulations in the closed-loop simulation, then `RCM` will sample 250 steepness values from this distribution and then fit the SRA model 250 times. Alternatively, one can manually provide values in the `cpars` section of the operating model (see the [Custom Parameters](/features-custom-parameters) section for details on `cpars`):

```{r, eval = FALSE}
# Sample from a beta distribution and transform the random variable
h_samp <- rbeta(250, 13.3, 4.4)
OM@cpars$h <- 0.8 * h_samp + 0.2 # Mean = 0.8 with SD = 0.08
```

The RCM stock reconstruction from `i-th` fit will be conditioned on the `i-th` sampled value of steepness. The sampled values of steepness (as well as all input parameters to the RCM) are saved in the updated OM object to ensure consistency.
