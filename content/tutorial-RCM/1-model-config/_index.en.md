---
date: "2021-02-10T11:35:01+06:00"
title: Model configuration of the RCM
weight: 1
---

### Data

The first order of business with set-up of the RCM is to decide whether to condition the model on catch or effort. If the model is conditioned on catch, then the RCM can generate predicted catches that match the observed, similar to an SRA approach, or estimate fishing mortality as parameters with a likelihood for catches, similar to many SCA (statistical catch-at-age) approaches. If conditioned on effort, the estimated fishing mortality in the model will be proportional to the observed effort. A full time series of the conditioning variable is needed, and length of the historical period `OM@nyears` will be the length of the conditioned time series.

Ideally, the time series begins at unfished conditions. If catch or effort data are unavailable going back to unfished conditions, then the data could be extrapolated back in time using reconstruction. Examples of catch reconstruction methods for the purposes of a stock assessment can be found in [Porch et al. (2004)](http://sedarweb.org/docs/wpapers/SEDAR7-AW-22.pdf) and Appendix A of [Starr and Haigh (2017)](http://www.dfo-mpo.gc.ca/csas-sccs/Publications/ResDocs-DocRech/2017/2017_015-eng.html).

Alternatively, one could pass the assumed equilibrium catch or equilibrium effort prior to the first year of data to `RCM`. The model will then attempt to estimate the initial depletion in the first year of the historical period. Initial depletion can also be estimated with deviations from the equilibrium age distribution for the cohorts comprising the first year of the model. Initial depletion may be difficult to estimate with precision. Consider what data are informative to estimate initial depletion, perhaps an age or length sample from that first year that shows the truncation of the composition data relative to unfished conditions.

In addition to the conditioning variable, additional data types can be used:

- Catch (if conditioned on effort)
- Indices of abundance (either as surveyed biomass/abundance or fishery-dependent catch-per-unit time series)
- Age compositions
- Length compositions
- Mean size (this option is generally for very sparse data scenarios when mean length or mean weight data are available but not the composition data)
- Mean size (either mean length or mean weight)
- Index age or length compositions

For information on the format and dimensions of these data, as well as corresponding covariates, e.g., multinomial sample sizes, index standard errors, see the documentation for the [RCMdata](https://samtool.openmse.com/reference/RCMdata-class.html) class.

One of these several data types in addition to catch or effort is generally needed to obtain depletion estimates. Availability of these data can be quite sparse over time, yet still informative. For example, an age composition sample from a single recent year that shows a very truncated age structure can be sufficient to imply a heavily depleted stock.

Multiple surveys and fleets can be accommodated with `RCM`.

### OM parameters

Here are the required pre-specified OM parameters needed for the RCM:

- Growth (length-at-age) using slots `OM@Linf, OM@K, OM@t0` (or alternatively, `OM@cpars$Len_age`)
- Variability in length-at-age `OM@LenCV` or `OM@cpars$LatASD` if length data are used
- Length-weight conversion factors using slots `OM@a` and `OM@b` (or alternatively, `OM@cpars$Wt_age`)
- Natural mortality using slots `OM@M`, `OM@cpars$Marray`, or `OM@cpars$M_ageArray`
- Maturity using slots `OM@L50, OM@L50_95` or `OM@cpars$Mat_age`
- Standard deviation of recruitment deviations using slot `OM@Perr` or `OM@cpars$Perr`
- Stock-recruit relationship with `OM@SRrel`
- Steepness in `OM@h` or `OM@cpars$h`

These are potentially required parameters:
- Selectivity parameters with `OM@L5`, `OM@LFS`, and `OM@Vmaxlen`. If there are no age or length compositions, then fishery selectivity in the model is fixed to these values. Otherwise, these are used as starting values.
- Unfished recruitment `OM@R0` as the starting value.

The operating model can be stochastic (with Monte Carlo sampling) with respect to these parameters. For example, steepness is highly uncertain, then one could specify a range of values, for example, between 0.6 and 0.9 with a uniform distribution, in an operating model:

```{r, eval = FALSE}
OM@h <- c(0.6, 0.9)
```

Following this approach, the RCM will fit to each sampled value as well. If one wishes to run 250 simulations in the closed-loop simulation, then the `RCM` will sample 250 steepness values from this distribution and then fit the SRA model 250 times. The RCM output from `i-th` fit will be conditioned on the `i-th` sampled value of steepness. The sampled values of steepness (as well as all input parameters to the RCM) are saved in the updated OM object to ensure consistency.

One can manually provide values in the `cpars` section of the operating model (see the [Custom Parameters](/features-custom-parameters) section for details on `cpars`):

```{r, eval = FALSE}
# Sample from a beta distribution and transform the random variable
h_samp <- rbeta(250, 13.3, 4.4)
OM@cpars$h <- 0.8 * h_samp + 0.2 # Mean = 0.8 with SD = 0.08
```

If growth, natural mortality, or maturity are time-varying in the historical period, then the SRA will implement time-varying life history in the estimation model as well. For example, if we're setting up an operating model where the length of the historical period is 50 years, and we believe that natural mortality has doubled from 0.2 to 0.4 since Year 30 and will remain so into the future, this code can be used to set up this scenario:

```{r, eval = FALSE}
OM@nyears <- 50
OM@proyears <- 30

# Default M = 0.4
M_ageArray <- array(0.4, c(OM@nsim, OM@maxage, OM@nyears + OM@proyears))
M_ageArray[, , 1:30] <- 0.2 # M = 0.2 in the first 30 years of the simulation
OM@cpars$M_ageArray <- M_ageArray
```

The RCM will pick up this change in the model as well.

The easiest way to turn off time-varying growth and M is to set:

```{r, eval = FALSE}
OM@Linfsd <- OM@Ksd <- OM@Msd <- c(0, 0)
```

Information about the slots in the OM object is available in the [OM Object section](/object-OM) and the [OM object help file](https://msetool.openmse.com/reference/OM-class.html).

If passing custom objects to the operating model that override default inputs (e.g., for time-varying parameters), then `MSEtool::validcpars()` will be helpful for setting up and indexing the dimensions of the custom objects. See the [Custom Parameters](/features-custom-parameters) section for details on `cpars`.