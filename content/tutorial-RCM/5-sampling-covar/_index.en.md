---
date: "2021-02-10T11:35:01+06:00"
title: RCM for conditioning operating models
weight: 5
---

The procedure above describes conditioning in which we accommodate life history uncertainty within an OM. Alternatively, we may wish to consider incorporate uncertainty with the SRA model fit conditional on a single set of life history values. To do so, we have an OM in which we ensure that all the necessary SRA input parameters, e.g., growth, maturity, M, steepness, etc., are identical among `nsim` replicates. Then we call `RCM` with the `resample` argument:

```{r, eval = FALSE}
output <- RCM(OM, data, resample = TRUE)
plot(output)
```

When `resample = TRUE`, the function will generate a single model fit, placed in `output@mean_fit`, and then sample the covariance matrix to populate the recruitment, fishing mortality, selectivity slots in the updated OM. If the model has difficulty estimating the stock size, then there should be a high variance in the `R0` estimate. A wide range of historical biomass among simulations should then be seen in the conditioned OM. The markdown report contains separate panels for evaluating the conditioned OM as well as the single model fit.

Uncertainty in life history parameters would be accommodated by generating a set of OMs that vary in parameter values such as M and repeating the sampling step for each OM. 
