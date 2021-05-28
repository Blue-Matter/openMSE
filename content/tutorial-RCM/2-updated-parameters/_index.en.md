---
date: "2021-02-10T11:35:01+06:00"
title: Updated OM parameters and evaluation of the RCM
weight: 2
---

Historical OM parameters that are updated by the RCM include:

- Unfished recruitment `OM@R0`, only if catch is provided.
- Depletion `OM@D`
- Annual fishing effort in `OM@EffYears`, `OM@EffLower`, `OM@EffUpper`, and `OM@cpars$Find`. The effort is equal to the apical fishing mortality when paired with the depletion values.
- Recruitment autocorrelation `OM@AC` which is estimated post-hoc from the recruitment deviation estimates.
- Annual recruitment deviations `OM@cpars$Perr_y`. Historical recruitment are those estimated from the model, while future recruitment will be sampled with autocorrelation.
- Selectivity parameters `OM@L5, OM@LFS, and OM@Vmaxlen`. If multiple fleets are modeled, then the F-at-age matrix is used to derive the effective aggregate selectivity and placed in `OM@cpars$V`. By default, the projection period selectivity is equal to that in the last historical year.

By default, the function estimates selectivity when age or length compositions are provided. If the selectivity is assumed to be dome-shaped, then the descending limb can either be fixed values sampled from slot `OM@Vmaxlen` or estimated in the SRA. If no composition data are provided, then all selectivity parameters are fixed. The `selectivity` argument is used to determine whether the selectivity is dome-shaped (`OM@Vmaxlen` is used) or logistic. Selectivity must be fixed when only mean size is available.

The RCM model will estimate and return `R0` when catch data are available. When conditioning on effort with no catches, the model is generally scale-independent; there can be information to inform depletion but not the stock size. Unfished recruitment `R0` is fixed to the value in `OM@R0` (predicted catches are conditional on the value of `R0`).

If initial depletion is estimated, then the recruitment deviations `OM@cpars$Perr_y` for the operating model are adjusted in order to produce the estimated abundance-at-age in the first year of the SRA model. 

If multiple fleets are used for conditioning, then the aggregate selectivity can change annually depending on the relative F among fleets. In this case, the annual selectivity is passed from the OM output in the `OM@cpars$V` slot. The default assumption in the projection period of the closed-loop simulation is that the selectivity, and therefore the relative F among fleets, is identical to those in the last historical year. Fleet allocation in management procedures can be explored in `multiMSE` capabilities of MSEtool.

Life history parameters used in the `RCM` will be also passed to `OM@cpars` to ensure reproducibility. Time-varying parameters affect calculation of reference points, mostly importantly unfished depletion. Depletion is the ratio of the spawning biomass in the terminal year and the unfished spawners biomass in the first year of the model. In this sense, depletion used to describe changes in the stock since fishing began. If life-history parameter are time-varying, then this definition may not necessarily reflect a management target.

The relative effort `OM@EffLower` and `OM@EffUpper` provided in the output is the apical F from the RCM. When running in closed-loop simulation, the apical F may be re-scaled to ensure that specified depletion has been reached at the beginning and end of the historical period. For simple operating models, i.e. those with conditions identical to the RCM, the apical F's in the MSE should be identical to those from the SRA. To confirm that this is the case, one can run the `plot` function on output returned by `RCM`:

An additional argument `OM@cpars$qs` is set to 1 so that the operating model recognizes that the relative effort `OM@EffLower`, `OM@EffUpper`, and `OM@cpars$Find` provided in the output OM is the apical F. For OMs configured identically to the RCM, the apical F's in the OM should be identical to those in the RCM and the historical reconstruction will be closely identical to each other. 

### RCM reporting

For OMs configured identically to the RCM, the historical reconstruction should be nearly identical to each other. 
To confirm, one can run the `plot` function to compare:

```{r, eval = FALSE}
output <- RCM(...)
plot(output, compare = TRUE)
```

This function returns a markdown report with:

- Histograms of updated parameters in the OM object
- Fits of the RCM to the provided data
- Output from the RCM, e.g. predicted recruitment
- Fits to an additional run of the RCM model to mean life history values among simulations (only when `RCM(..., mean_fit = TRUE)` is run)
- Comparisons of the historical period of the updated OM to the estimated RCM output

Currently, it is possible to create a more complex operating model than the RCM model itself. For example, discard mortality, movement, and spatial targeting are currently not modeled in the RCM. It is assumed that the catch in the RCM incorporate all known sources of removals, i.e. landings plus discards. The RCM is a single area model, whereas MSEtool can generate a multiple-area OM. However, a simple, well-mixed 2-area operating model can replicate the single-area model. In short, the following configurations would replicate the removals and movement (or rather lack thereof) dynamics in the RCM:

```{r, eval = FALSE}
OM@DR <- c(0, 0) # All discards are accounted for
# A well-mixed stock in 2 areas of equal sizes
OM@Spat_targ <- c(1, 1)
OM@Size_area_1 <- OM@Frac_area_1 <- OM@Prob_staying <- c(0.5, 0.5)
```

It may be desirable to compare the RCM to a simple operating model before incorporating more complex dynamics in the operating model.

### Sampling the covariance matrix

The procedure above describes OM conditioning in which we accommodate life history uncertainty among simulations. Alternatively, we may wish to consider incorporate uncertainty of the RCM model fit conditional on a single set of life history values. To do so, we have an OM in which we ensure that all the necessary input parameters, e.g., growth, maturity, M, steepness, etc., are identical among `nsim` replicates. Then we call `RCM` with the `resample` argument:

```{r, eval = FALSE}
output <- RCM(OM, RCMdata, resample = TRUE)
plot(output)
```

When `resample = TRUE`, the function will generate a single model fit, placed in `output@mean_fit`, and then sample the covariance matrix to populate the recruitment, fishing mortality, selectivity slots in the updated OM. If the model has difficulty estimating the stock size, then there should be a high variance in the `R0` estimate. A wide range of historical biomass should then be seen in the conditioned OM among simulations. The markdown report contains separate panels for evaluating the conditioned OM as well as the single model fit.

Uncertainty in life history parameters would be accommodated by generating a set of OMs that vary in parameter values such as M and repeating the sampling step for each OM. 
