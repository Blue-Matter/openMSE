---
date: "2021-01-19T11:35:01+06:00"
description: Fleet and survey selectivity
icon: far fa-fish
title: Configuring selectivity for the RCM
type: tutorials
weight: 3
---

There are a multitude of options available in how selectivity for fleets and surveys is parameterized in the model. This vignette is designed to be a step-by-step guide for setup of selectivity. It is best to first think about fleet selectivity followed by survey selectivity. Familiarity with the more general [`RCM` documentation](/features-RCM) and the `RCM` function [help page](https://samtool.openmse.com/reference/RCM.html) will be helpful.

This article is designed to provide step-by-step information on possible model configurations, but of course it is up to the user to decide whether those configurations are appropriate for the operating model conditioning.

The general function call for `RCM` is:

```{r eval = FALSE}
output <- RCM(OM, data, ...)
```

where the `output` is of class RCModel, `OM` is a class OM object, `data` is a list, and `...` are additional function arguments explained below. 
