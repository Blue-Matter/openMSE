---
date: "2021-09-20T11:35:01+06:00"
title: Averaged MSY Reference Points
weight: 4
---

From the calculation of annual maximum sustainable yield (MSY) reference points, an average value is taken and reported in the simulated `Data` object. Following a similar procedure to that described in the first section for $SB_0$, we use $A_{50}$ as an approximation of generation time, and average the annual MSY values over $A_{50}$ years around the last historical year. For example, if `OM@nyears` = 50 and $A_{50}=5$, $SB_{\text{MSY}}$ is calculated as:

$$
SB_{\text{MSY}} = \dfrac{\sum_{y=48}^{52}{SB_y^{\text{MSY}}}}{A_{50}}
$$
where $SB_y^{\text{MSY}}$ is the spawning biomass corresponding with maximum sustainable yield in year $y$. The logic behind this is, if estimates of MSY, $\text{SB}_\text{MSY}$, etc are available, they are likely calculated based on current life-history information, which would be estimated from data spanning several age classes. 

The averaged MSY reference points in the `Data` object, i.e., in `Data@OM` and `Hist@Ref$ReferencePoints`, are not updated in the future projection years. The averaged MSY reference points and annual MSY values by year are returned in `MSE@RefPoint` and `MSE@RefPoint$ByYear`, respectively. 

>**Note**
>
> The MSY metrics in the MSE object are always calculated using annual values. The slot `MSE@SB_SBMSY` returns the spawning biomass in the projections divided by $SB_\text{MSY}$ in each year of the projections. For alternative methods to calculate $\text{SB}/\text{SB}_{\text{MSY}}$, such as relative to the constant $\text{SB}_\text{MSY}$ described above, use `MSE@SSB` or `MSE@B` and the data stored in `MSE@RefPoint`.

