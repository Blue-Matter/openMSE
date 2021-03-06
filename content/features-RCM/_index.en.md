---
date: "2021-02-10T11:35:01+06:00"
description: Fast and robust Operating Model conditioning
icon: far fa-fast-forward
title: Rapid Conditioning Model
type: features
weight: 2
---

The default settings for openMSE allows for conditioning operating models (OMs) for stocks if no data were available. Ranges of biological and selectivity parameters are specified to incorporate uncertainty in the OM. For historical reconstruction of the stock, historical effort trajectories can be sketched, which, along with a fixed assumption on current depletion, can be used to calculate the implied historical fishing mortality and catches. 

In contrast to more data-rich situations, biological studies can be used to inform life history parameters such as growth and maturity, while other parameters such as historical depletion, selectivity, and fishing mortality have typically been informed by an assessment model. In such situations, operating models may be generated from fitting assessment models. In between the data-rich and the no-data situations are the so-called data-limited or data-moderate settings with data collected on the stock but the potential lack of an accepted stock assessment. 

The [Rapid Conditioning Model](https://samtool.openmse.com/reference/RCM.html) (`RCM`) in the `SAMtool` package is designed to help condition OMs for data-limited and data-rich situations. From a fitted model, historical depletion and F could be obtained via a more objective method, as opposed to intuition or a simple guess for these key parameters. The RCM is sufficiently flexible to be parameterized as full stock assessment model with various data weighting schemes and some time-varying dynamics explored, although that is not the intent of the software to used for stock assessment. 

Instead, the `RCM` is intended to guide exploration of a set of operating models (conditioned on data) that encapsulates a range of views on the productivity and historical exploitation. In this context, we don't look at point estimates, but rather try to reduce the range of plausible parameters. [Walters et al. (2006)](https://www.researchgate.net/publication/238730731_A_stochastic_approach_to_stock_reduction_analysis) used the term "stock reduction analysis" to describe an approach with age-structured models to address a broader question: what combinations of historical fishing mortality and recruitment could have generated the observed data? 

The stock reduction analysis (SRA) paradigm can be highly valuable for conditioning operating models in the absence of stock assessments. In any assessment, point estimates of depletion and unfished recruitment may not be credible if there is high uncertainty of input values to the model such as natural mortality, recruitment compensation (i.e., steepness). We would exclude parameters that would otherwise generate unlikely scenarios in the historical reconstruction of the stock. Consider two extreme scenarios. If the productivity or unfished stock size is too low, then the modeled population would crash while trying to explain the observed catches over time. On the other hand, if the productivity or unfished stock size is too high, then the observed catches are tiny in relation to the population, and implies still unfished conditions despite the observed fishing history. Finding a suitable range of parameters is akin to "threading the needle" in order to avoid these two extreme scenarios.
