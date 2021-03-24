---
date: "2021-03-23T11:35:01+06:00"
title: Catch-at-Age
weight: 5
---

The catch-at-age section includes annual catch-at-age data.

If no catch-at-age data exists, leave this section blank.

Otherwise a row should be populated for each year that catch-at-age (in units of **numbers**) exists.

<img src="/Figures/CAA.PNG" alt="" width="600"/>

Click the image to enlarge.


The *Catch-at-Age* section in the Data Documentation file is indicated with "## Catch-at-Age". Enter any relevant supporting information for the information in the Catch-at-Age section of the input file here. 

Ideally a short paragraph or two with supporting information for data entered in the Data Input file for Catch-at-Age data.

Use in-text citations where possible and include references under the "## Reference List" section.

Do not delete or modify the "## Catch-at-Age" heading.


### Vuln CAA 
Numeric entry. Optional.

The default assumption is that the catch-at-age data is from the fishing fleet (i.e., the catch-at-age data reflects the aggregate vulnerability-at-age schedule from all fishing fleets).

If the catch-at-age data comes from a survey or a fleet with a different selectivity schedule, the vulnerability-at-age associated with the catch-at-age data should be entered here. The length of the *Vuln CAA* data should be one longer than the value entered in Maximum age (i.e., all age classes including age-0).

No alternative vulnerability schedule has been specified for the example cobia dataset. 

### CAA 
Numeric entries.

A row should be entered for each calendar year of catch-at-age data that exists. Text entries in the first column for each new row should be of the from "CAA YEAR", e.g. "CAA 1980", "CAA 1981", etc.

Catch-at-age (in numbers) should be entered for each age-class, from 0 to the maximum age specified in Maximum Age. 

The years in the catch-at-age data must be included in the years entered in the [Year] row. For example, "CAA 2019" is not valid if the years in Year only extend to 2015. In this case, increase the years in Year to 2019.

Years where catch-at-age data are missing can be left out, or entered with all values set to NA.

The cobia example has catch-at-age data from 1984 - 2011.
