---
date: "2021-09-20T11:35:01+06:00"
title: Initial Depletion 
weight: 2
---

As noted in the previous section, the operating model initializes the population in an unfished dynamic state.

It is possible specify depletion in the first historical year by using `OM@cpars$initD`. When this feature is used, the population is initialized in a dynamic state with spawning biomass equal to $\text{initD} * SB_0$; that is, initial spawning biomass in Year 1 is relative to the unfished spawning biomass in Year 1. 

Analysts need to be aware that if there are large time-varying trends in life-history parameters, the $SB_0$ in Year 1, which is no longer the first year that the fishery commenced, may be different to the $SB_0$ from the (not modeled) period before fishing.
