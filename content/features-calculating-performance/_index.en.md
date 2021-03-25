---
date: "2021-02-22T11:35:01+06:00"
description: Examining the MSE results
icon: fas fa-calculator-alt
title: Calculating Performance
type: features
weight: 7
---

A key use of the `openMSE` packages is to evaluate the trade-offs in the performance of different potential [Management Procedures](/features-management-procedures) and to assist in the decision-making process as to which MP is most likely to satisfy the various management objectives under realistic range of uncertainty and variability in the system. 

### The Need for Performance Metrics
In order to evaluate the relative effectiveness of different  [Management Procedures](/features-management-procedures), it is important that decision-makers have clearly-defined management objectives.  These management objectives can be incorporated into the MSE process in the form of performance metrics, which provide the yardstick with which to compare the relative performance of different management strategies.  

Fisheries managers are confronted with the difficult task of maximizing yield and ensuring the sustainability of the resource and the overall health of the marine environment.  The principal objectives of fisheries management could be described as ensuring sustainable harvests and viable fishing communities, while maintaining healthy ecosystems.  However, this simplistic view overlooks the fact that there are often conflicts in different management objectives and that there is rarely an optimal management approach that fully satisfies all management objectives [Punt, 2017](https://academic.oup.com/icesjms/article/74/2/499/2907904).  [Walters and Martell (2004)](https://books.google.ca/books/about/Fisheries_Ecology_and_Management.html?id=Oi7LzSZTDG8C&redir_esc=y) explain that the task of modern fisheries management is to identify the various trade-offs among conflicting objectives and decide how to balance them in a satisfactory way.

### Inevitable Trade-Offs
A typical trade-off is the abundance of the target species versus the catch.  Assuming no significant system-wide natural perturbations, a fish stock may be exploited sustainability if catches are set at low levels.  However, such economic under-utilization of the resource is often seen as undesirable.  Alternatively, high catches may produce immediate short-term benefits, but may result in long-term degradation, or perhaps collapse, of the stock.  

Additionally, there is often a trade-off between stock size and fishing effort, which results in lower catch rates (and lower profit) for individual fishers when a large number of fishers are active in the fishery.  Other common trade-offs include the age and size at first capture, either delaying harvest until individuals are fewer in number (due to natural mortality) but larger in size, or capturing a large number of small sized fish.  

When multiple objectives are considered, there is usually not a single optimum solution, and fisheries managers are faced with the difficult task of determining the most appropriate management action that satisfies the numerous management objectives and stakeholder interests.

#### Operational Management Objectives 
A key strength of the MSE approach is that decision-makers are required to specify clear objectives, which can be classified as either “conceptual” or “operational”.  Conceptual objectives are typically high-level policy goals that may be broadly defined.  

However, in order to be included in an MSE, conceptual objectives must be translated into operational objectives (i.e., expressed as values for performance metrics).  Such operational objectives, or performance metrics, may consist of both a reference point (e.g., biomass some fraction of equilibrium unfished level) as well as a measure of the acceptable associated risk (e.g., less than 10% chance that biomass declines below this reference level).

It is not unusual that some of the management objectives are in conflict.  A key benefit of the MSE approach is to highlight these trade-offs among the different management objectives to guide the decision-making process.  However, in order for these trade-offs to be quantified, it is critically important that the performance metrics are quantifiable and thus able to be incorporated into the MSE framework. 

### Commonly used Performance Metrics 
Management strategy evaluation is a simulation exercise where the model can track the specific performance with perfect information, so it is possible to state performance objectives in specific terms that are consistent with the typical objectives of fisheries policies, such as: 

*	Biomass relative to unfished biomass $\left(B_0\right)$ or biomass at maximum sustainable yield $\left(B_{MSY}\right)$.
*	Fishing mortality rate relative to fishing at maximum sustainable yield $\left(F_{MSY}\right)$.
*	Yield (short-term or long-term) of a particular management strategy relative to the yield if the fishery were being exploited at $F_{MSY}$.
*	Inter-annual variability in yield or effort (e.g., fluctuations in yield from year to year).  

Because the management strategy evaluation runs many simulations of the fisheries performance under each management strategy being tested, the performance can be stated probabilistically, such as the specific probability of biomass being above or below a specific biomass threshold or target. 

#### Fishing Mortality
For example, the management strategies can be ranked by the likelihood of overfishing to occur, where the probability of overfishing is measured by the proportion of simulation runs where the fishing mortality rate (*F*) under a specific management strategy is higher than the *F* that is expected to produce the maximum sustainable yield.  
Management strategies that have a lower probability of overfishing occurring are typically preferable to those that frequently cause excessive fishing mortality rates.  If there are 1,000 simulation runs for each management strategy over a 50-year projection period, then the probability of overfishing could be based on the proportion where *F* is greater than (or less than) $F_{MSY}$ over all years or any subset of years (e.g., probability of overfishing in years 41-50 of the 50-year projection period). 

#### Stock Biomass
Another common performance metric is the probability that the stock biomass is above or below some biological reference point.  For example, a minimum performance limit may be half the biomass at maximum sustainable yield (0.5 BMSY), and the performance of the management strategies can be ranked by the probability of the stock remaining above this level.  

Management strategies that fail to maintain biomass above this limit with a high priority may be considered too risky and therefore excluded from further examination.  

#### Additional Performance Metrics
There may be other performance metrics that are of interest to fishery managers and stakeholders.  Stakeholder participation is critical when developing performance metrics to evaluate different biological scenarios or management strategies in a MSE.  Furthermore, it is important that the performance metrics, together with any acceptable risk thresholds are identified and agreed upon before the MSE is conducted.
