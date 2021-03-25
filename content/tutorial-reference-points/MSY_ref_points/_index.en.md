---
date: "2021-03-24T11:35:01+06:00"
title: MSY Reference Points
weight: 3
---

The calculation of maximum sustainable yield (MSY) and related reference points are also impacted by inter-annual variability in life-history and fishing parameters (i.e., selectivity pattern). For example, if there is large inter-annual variability in natural mortality or growth, MSY and $\text{SB}_{\text{MSY}}$ may vary significantly between years. 

We calculate MSY and related metrics (e.g., $B_{\text{MSY}}$) for each time-step in the model based on the life-history and fishing parameters in that year. The MSY reference points are used in both the simulated `Data` object, and to evaluate the performance of the management procedures. 

For the simulated `Data` object, we calculate MSY reference points following a similar procedure to that described above for $B_0$. We use $A_{50}$ as an approximation of generation time, and average the annual MSY values over $A_{50}$ years around the last historical year. For example, if `OM@nyears` = 50 and $A_{50}=5$, $SB_{\text{MSY}}$ is calculated as:

$$
SB_{\text{MSY}} = \sum_{y=48}^{52}{SB_y^{\text{MSY}}}
$$
where $SB_y^{\text{MSY}}$ is the spawning biomass corresponding with maximum sustainable yield in year $y$. The logic behind this is, if estimates of MSY, $\text{SB}_\text{MSY}$, etc are available, they are likely calculated based on current life-history information, which would be estimated from data spanning several age classes. 

The MSY reference points in the `Data` object are not updated in the future projection years. The MSY reference points and MSY values by year are returned in `MSE@Misc$MSYRefs`. 

>**Note**
>
> The MSY metrics are always calculated by year. The slot `MSE@SB_SBMSY` returns the spawning biomass in the projections divided by $SB_\text{MSY}$ in each year of the projections. For alternative methods to calculate $\text{SB}/\text{SB}_{\text{MSY}}$, such as relative to the constant $\text{SB}_\text{MSY}$ described above, use `MSE@SSB` or `MSE@B` and the data stored in `MSE@RefPoint`.
