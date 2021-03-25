---
date: "2021-02-10T11:35:01+06:00"
title: Data-limited cases 
weight: 3
---

By default, the function estimates selectivity when age or length compositions are provided. If the selectivity is assumed to be dome-shaped, then the descending limb can either be fixed values sampled from slot `OM@Vmaxlen` or estimated in the SRA. If no composition data are provided, then all selectivity parameters are fixed. The `selectivity` argument is used to determine whether the selectivity is dome-shaped (`OM@Vmaxlen` is used) or logistic. Selectivity must be fixed when only mean lengths are available.

If the model is conditioned on effort (with no catch data), then unfished recruitment `R0` is fixed to the value in `OM@R0` (predicted catches are conditional on the value of `R0`). With catch data are also available while conditioning on effort (incomplete catch time series are permissible), the `R0` can be scaled the population to generate the observed catches. The scalar is a multiplicative factor that minimizes the sum of squared differences between observed and predicted catches.
