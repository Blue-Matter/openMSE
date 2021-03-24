---
date: "2021-03-23T11:35:01+06:00"
title: Reference
weight: 7
---

The Reference section includes various biological reference points and other values that are by management procedures.

The example cobia dataset does not have any values for the Reference section, as no estimates of current depletion, abundance, or biological reference points exist for this fishery.

<img src="/Figures/reference.PNG" alt="" width="300"/>

Click the image to enlarge.

The *Reference* section in the Data Documentation file is indicated with "## Reference". Enter any relevant supporting information for the information in the Reference section of the input file here. 

Ideally a short paragraph or two with supporting information for data entered in the Data Input file in the Reference section.

Use in-text citations where possible and include references under the "## Reference List" section.

Do not delete or modify the "## Reference" heading.

### Current stock depletion and CV
Numeric entries. 

An estimate of the current stock depletion (current spawning biomass divided by average unfished spawning biomass) and associated CV.

Usually obtained from a quantitative stock assessment.

Leave blank if no estimate is available.

### Current stock abundance and CV
Numeric entries. 

An estimate of the current absolute stock abundance (total biomass) and associated CV.

Usually obtained from a quantitative stock assessment.

Leave blank if no estimate is available.

### Current spawning abundance and CV
Numeric entries. 

An estimate of the current absolute spawning stock abundance (total biomass) and associated CV.

Usually obtained from a quantitative stock assessment.

Leave blank if no estimate is available.

### Biological Reference Points and CV
Numeric entries. 

The biological reference points: 

* "FMSY/M" - the ratio of fishing mortality corresponding to maximum sustainable yield $\left(F_\text{MSY}\right)$ to the natural mortality rate $(M)$ 

* "BMSY/B0" - the ratio of biomass  corresponding to maximum sustainable yield $\left(B_\text{MSY}\right)$ to the average unfished biomass $(B_0)$ are typically obtained from a quantitative stock assessment, or a yield-per-recruit analysis that accounts for the impact of reduced spawning biomass on the expected recruitment.

Leave blank if no estimates are available.

### Catch Reference and CV
Numeric entries. 

A catch level (in the same units as [Catch](#catches)), and associated CV, that is used by management procedures as a target level for catch.

### Index Reference and CV
Numeric entries. 

An index level (in the same units as [Abundance Index](#abundance-index), and associated CV, that is used by management procedures as a target level for the abundance index.

### Duration t
Numeric entry.

In some cases, data are only used for a particular period of the fishery. For example, mean catches and depletion from the early years of a fishery when there was no management may be used. 

The value in "Duration t" corresponds to the first *t* years of the history of the fishery that are used in the following two entries.  

### Average Catch over time t 
Numeric entry.

The average catch over time *t* (and associated CV).


### Depletion over time t
Numeric entry.

The estimated depletion at time *t* (and associated CV).

### Reference OFL 
Numeric entry.

A reference over-fishing limit (e.g., a catch limit). Leave blank if none exists.

### Reference OFL type
Text entry.

A short description of the type of reference management elve (e.g., 2009 catch limit).
