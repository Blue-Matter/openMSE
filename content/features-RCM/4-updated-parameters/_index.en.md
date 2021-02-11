---
date: "2021-02-10T11:35:01+06:00"
title: Updated parameters and evaluation of the RCM
weight: 4
---

Historical OM parameters that are updated by the RCM include:

- Unfished recruitment `OM@R0`, only if catch is provided.
- Depletion `OM@D`
- Annual fishing effort in `OM@EffYears`, `OM@EffLower`, `OM@EffUpper`, and `OM@cpars$Find`. The effort is equal to the apical fishing mortality when paired with the depletion values.
- Recruitment autocorrelation `OM@AC` which is estimated post-hoc from the recruitment deviation estimates.
- Annual recruitment deviations `OM@cpars$Perr_y`. Historical recruitment are those estimated from the model, while future recruitment will be sampled with autocorrelation.
- Selectivity parameters `OM@L5, OM@LFS, and OM@Vmaxlen`. If multiple fleets are modeled, then the F-at-age matrix is used to derive the effective aggregate selectivity and placed in `OM@cpars$V`. By default, the projection period selectivity is equal to that in the last historical year.

If initial depletion is estimated, then the recruitment deviations `OM@cpars$Perr_y` for the operating model are adjusted in order to produce the estimated abundance-at-age in the first year of the SRA model. 

The RCM model will estimate and return `R0` when conditioned on catch. When conditioning on effort, the model is generally scale-independent; with no catches, there can be information to inform depletion but not the stock size. The exception occurs when the SRA is conditioned on effort from multiple-fleets, in which case, catch data from all fleets (incomplete series are acceptable) are needed to inform the relative F's among fleets. In this scenario, R0 is estimated.

Additionally, if multiple fleets are used for conditioning, then the annual selectivity can change based on the relative F among fleets. In this case, the annual selectivity is passed from the OM output in the `OM@cpars$V` slot. The default assumption in the projection period of the closed-loop simulation is that the selectivity and relative F among fleets are identical to those in the last historical year. Fleet allocation in management procedures can be explored in `multiMSE` capabilities of MSEtool.

Life history parameters used in the RCM will be also passed to `OM@cpars` to ensure reproducibility. Time-varying parameters affect calculation of reference points, mostly importantly unfished depletion. Depletion is the ratio of the spawning biomass in the terminal year and the unfished spawning biomass in the first year of the model. In this sense, depletion used to describe changes in the stock since fishing began. If life-history parameter are time-varying, then this definition may not necessarily reflect a management target.

The relative effort `OM@EffLower` and `OM@EffUpper` provided in the output is the apical F from the RCM. When running in closed-loop simulation, the apical F may be re-scaled to ensure that specified depletion has been reached at the beginning and end of the historical period. For simple operating models, i.e. those with conditions identical to the RCM, the apical F's in the MSE should be identical to those from the SRA. To confirm that this is the case, one can run the `plot` function on output returned by `RCM`:

```{r, eval = FALSE}
output <- RCM(...)
plot(output)
```

This function returns a markdown report with:

- Histograms of updated parameters in the OM object
- Fits of the SRA model to the provided data
- Output from the SRA model, e.g. predicted recruitment
- Fits to an additional run of the SRA model to mean life history values among simulations (only when `RCM(..., mean_fit = TRUE)` is run)
- Comparisons of the historical period of the updated OM to the estimated RCM output

Currently, it is possible to create a more complex operating model than the SRA model itself. For example, discard mortality, movement, and spatial targeting are currently not modeled in the SRA. It is assumed that the catch in the SRA are all known sources of removal, i.e. landings plus discards. The RCM is a single area model, whereas MSEtool uses a multiple-area model. However, a simple well mixed 2-area operating model can replicate the single-area model. In short, the following configurations would replicate the removals and movement (or rather lack thereof) dynamics in the RCM:

```{r, eval = FALSE}
OM@DR <- c(0, 0) # All discards are accounted for
# A well-mixed stock in 2 areas of equal sizes
OM@Size_area_1 <- OM@Frac_area_1 <- OM@Prob_staying <- c(0.5, 0.5)
```

It may be desirable to compare the RCM to a simple operating model before incorporating more complex dynamics in the operating model.
