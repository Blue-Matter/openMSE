---
date: "2021-01-21T11:35:01+06:00"
title: Survey selectivity
weight: 2
---

Next we can move on to survey selectivity. Unlike fleet selectivity, selectivity is unique to each survey and no dummy fleets are used.

### Is survey selectivity already defined elsewhere?

The vector `s_selectivity` defines where the survey selectivity is defined (the terms index and survey are used interchangeably). Survey selectivity may be identical to fleet selectivity, i.e., vulnerable biomass, total biomass, or spawning biomass. If we have 4 surveys with:

```{r}
s_selectivity <- c("SSB", "B", 1, 2)
```

The first survey is a survey of spawning biomass as denoted by "SSB" (maturity is configured in the `OM`), the second survey indexes total biomass as denoted by "B" (selectivity = 1 for all ages), and the third and fourth surveys have the selectivity of the first and second fleets, respectively. Note that the integers for fleets refer to the true fleet and not to selectivity blocks/dummy fleets. 

No further consideration of survey selectivity is needed when selectivity is defined elsewhere, the function call can look like this:

```{r eval = FALSE}
output <- RCM(OM, data, selectivity = selectivity, s_selectivity = s_selectivity, ...)
```

### Survey selectivity is independent of anything else in the model

On the other hand, if survey selectivity needs to be explicitly defined, then the `s_selectivity` vector can indicate the functional form, using one of `logistic`, `dome`, `dome`. Let's look at another situation with 5 surveys:

```{r}
s_selectivity <- c(2, "SSB", "B", "dome", "free")
```

For the fourth and fifth surveys, the selectivity functions are dome-shaped and free parameters, respectively. Next we need to consider what the parameters defining this functions are, either as starting values to be estimated or fixed values in the model.

### Selectivity parameters

Just as in the fleet parameters, the survey selectivity parameters by default use `OM@LFS`, `OM@L5`, and `OM@Vmaxlen` for start values when `s_selectivity = "logistic"` or `"dome"`, and custom start values needed when selectivity uses free parameters. 

Custom start values are passed to the RCM in the `s_vul_par` matrix with the same layout as that for the fleet blocks:

```{r echo = FALSE}
s_vul_par <- matrix(c(rep(0, 18), 55, 40, 0.5, rep(0, 3), 1, rep(0, 5)), 6, 5)
```
```{r}
OM@maxage <- 6
s_selectivity <- c(2, "SSB", "B", "dome", "free")
s_vul_par
```

Parameter slots for surveys 1 - 3 are ignored. Again they're placeholders for internal organization. The first three rows in column four are the start values for the three parameters of the dome function (to be estimated), and the fifth survey only selects age-1 animals, i.e., a survey of recruits.

Finally, to remove parameters from estimation either because they're just placeholders (surveys 1-4) or they should be fixed in the model (survey 5), we provide the map argument for `s_vul_par` with `map_s_vul_par`:

```{r echo = FALSE}
map_s_vul_par <- matrix(NA, 6, 5)
map_s_vul_par[1:3, 4] <- 1:3
```
```{r}
map_s_vul_par
```

A function call utilizing this custom set-up for survey selectivity would be:

```{r eval = FALSE}
output <- RCM(OM, data, selectivity = selectivity, s_selectivity = s_selectivity, s_vul_par = s_vul_par, map_s_vul_par = map_s_vul_par, ...)
```

