---
date: "2021-01-21T11:35:01+06:00"
title: Fleet selectivity
weight: 1
---


### Time blocks for selectivity

Fleet selectivity can be vary in time blocks. Let's say we have 2 fleets, a 10-year time series, and the first fleet selectivity changes in year 6. Thus, we have 3 selectivity blocks, a.k.a. dummy fleets each with their own selectivity. For each 'true' fleet and year in the model, we will assign the selectivity to one of the three dummy fleets. To do so, we create a 10 by 2 integer matrix:

```{r echo = FALSE}
data$nsel_block <- 3 # There are three dummy fleets
data$sel_block <- matrix(c(rep(1, 5), rep(2, 5), rep(3, 10)), 10, 2)
```

```{r}
data$sel_block
```
Thus, for the first fleet (first column), we assign the selectivity of dummy fleet #1 to years 1-5 and that of dummy fleet #2 to years 6-10. The second fleet is assigned to dummy fleet #3 for all years.

By default, a unique block is assigned to each fleet, indicating no time-varying selectivity, and the above code chunk is not needed. In other words, there's no distinction between dummy fleets and the true fleets.

## Selectivity of each dummy fleet

We specify the selectivity as a character vector with each entry corresponding to dummy fleet:

```{r}
selectivity <- c("logistic", "dome", "free")
```

Thus, the selectivity of the first dummy fleet is logistic, the second is dome, and the third is free, i.e., independent parameters for selectivity-at-age.

These functions are described in <a href="RCM_eq.html">Vignette #2a</a>.

### Starting values of selectivity parameters

For logistic and dome selectivity, the default behavior is to generate starting values from `OM@LFS`, `OM@L5`, and `OM@Vmaxlen`. Custom start values are needed when selectivity uses free parameters.

Custom starting values are passed to the model with the `vul_par` matrix (the terms selectivity and vulnerability are used interchangeably). If only logistic or dome options are used, then `vul_par` is a matrix of 3 rows (corresponding to LFS, L5, and Vmaxlen) and `data$nsel_block` columns:

```{r echo = FALSE}
vul_par <- vul_par_easy
```
```{r}
selectivity <- c("logistic", "dome", "dome")
vul_par
```

Note that `Vmaxlen` is ultimately not used when the selectivity is logistic and the value in the third row, first column is merely an unused placeholder. If `vul_par` is provided, another step is needed to turn off this parameter (see next subsection).

If we have selectivity as free parameters (independent parameters for each age), `vul_par` has `OM@maxage` rows with each row giving the selectivity value to the corresponding age (first row = age-1, etc.):

```{r echo = FALSE}
vul_par <- vul_par_free
```
```{r}
OM@maxage <- 6
selectivity <- c("logistic", "dome", "free")
vul_par
```

Rows 4 to maxage for logistic and dome selectivity are unused placeholders.

### Fixing and sharing parameters

Selectivity parameters may be fixed or shared. For TMB, this is accomplished by the `map` argument, which can be provided in `RCM` via the `map_vul_par` matrix which is of identical dimension to `vul_par`. `map_vul_par` tells TMB what to do to the parameter of the corresponding row and column in `vul_par`. Shared parameters are assigned a unique integer amongst themselves while fixed/unused parameters are assigned `NA`. Let's look at the first `vul_par` example again:

```{r echo = FALSE}
vul_par <- vul_par_easy
```
```{r}
selectivity <- c("logistic", "dome", "dome")
vul_par
```

We want:

- LFS and L5 for the first two dummy fleets to be identical
- Vmaxlen in the third dummy fleet to be fixed
- The parameter reserved for Vmaxlen for the first dummy fleet to be turned off since it's merely a placeholder
- All other parameters are estimated unique parameters 

The matrix `map_vul_par` that accomplishes these tasks will look like this:

```{r echo = FALSE}
map_vul_par <- matrix(c(1, 2, NA, 1, 2, 3, 4, 5, NA), 3, 3)
 
```
```{r}
map_vul_par
```

For the second `vul_par` example, we want:

- Selectivity of dummy fleet #3 to be estimated only for ages 1 and 2
- The parameter reserved for Vmaxlen for the first block to be turned off since it's a placeholder
- Rows 4-6 for the first two blocks to be turned off (they're placeholders and undefined in the model)

The matrix `map_vul_par` that accomplishes these tasks will look like this:

```{r echo = FALSE}
map_vul_par <- matrix(c(1, 2, rep(NA, 4), 3, 4, 5, rep(NA, 3), 6, 7, rep(NA, 4)), 6, 3)
 
```
```{r}
selectivity <- c("logistic", "dome", "free")
map_vul_par
```

Finally the function call looks like this:

```{r eval = FALSE}
output <- RCM(OM, data, selectivity = selectivity, vul_par = vul_par, map_vul_par = map_vul_par, ...)
```
