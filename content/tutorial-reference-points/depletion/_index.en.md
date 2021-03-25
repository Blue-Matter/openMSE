---
date: "2021-03-24T11:35:01+06:00"
title: Depletion and Unfished Reference Points 
weight: 1
---

The Depletion parameter in the Stock Object (`Stock@D`) is used to initialize the historical simulations. Although the term *Depletion* is used frequently in fisheries science, it is rarely clearly defined. In most contexts, *Depletion* is used to mean *the biomass today relative to the average unfished biomass*. This raises two questions: 

1. What do we mean by *biomass*? Is it total biomass (*B*), vulnerable biomass (*VB*), or spawning biomass (*SB*)?
2. What do we mean by *average unfished biomass*? Average over what time-period? Does this refer to the average biomass at some time in history before fishing commenced? Or is the expected biomass today if the stock had not been fished? 

Examples can be found for all three definitions of biomass in the first question. We define *Depletion* with respect to spawning biomass (*SB*). That is, the values specified in `Stock@D` refer to the spawning biomass in the last historical year (i.e. 'today'; $SB_{y=\text{OM@nyears}}$) relative to the average unfished spawning biomass $(SB_0)$.

The answer to the second question is a little more complicated. There are several ways to define $SB_0$ within the simulation model:

1. The unfished spawning biomass at the beginning of the simulations (i.e Year = 1). 
2. The unfished spawning biomass at the end of the historical simulations (i.e Year = `OM@nyears`). 
3. The *average* unfished spawning biomass over the first several years of the simulations. This could be different to 1 due to inter-annual variability in life-history parameters (e.g, `Stock@Linfsd`).
4. The *average* unfished spawning biomass over all historical years (or the last several years). This could be different to 3 due to time-varying trends in parameters (e.g., by using `OM@cpars$Linfarray`). 

In `openMSE` the operating model is specified based on the assumed or estimated spawning biomass today relative to the *average equilibrium* (i.e no process error in recruitment) biomass at the beginning of the fishery; i.e., the change in biomass over the history of the fishery (point 3 above). We use the age of 50% maturity ($A_{50}$ in the first historical year; calculated internally from `Stock@Linf`, `Stock@Linfsd`, `Stock@K`, `Stock@Ksd`, `Stock@t0`, and `Stock@L50`) as an approximation of generation time, and calculate the average unfished spawning biomass $(SB_0)$ over the first $A_{50}$ years in the historical simulations. That is:

$$
SB_0 = \frac{\sum_{y=1}^{A_{50}} SB_y^{\text{unfished}}}{A_{50}}
$$
where $A_{50}$ is rounded up to the nearest integer and $SB_y^{\text{unfished}}$ is the equilibrium unfished spawning biomass in year $y$. The same calculation is used to calculate other unfished reference points (e.g, $B_0$, $VB_0$), as well as the unfished spawning-per-recruit parameters used in the Ricker stock-recruitment relationship.

The unfished reference points and unfished biomass and numbers by year are returned as a list in the MSE and Hist objects; i.e `MSE@RefPoint$Dynamic_Unfished` and `MSE@RefPoint$ByYear` respectively. 



>Note that although Depletion is calculated relative to the *average unfished equilibrium spawning biomass*, the population in the simulation model is initialized under dynamic conditions, that is, with process error in recruitment to all age classes. This means that, depending on the magnitude of recruitment variability, the initial biomass in Year 1 may be quite different to the equilibrium unfished biomass as calculated above. 
