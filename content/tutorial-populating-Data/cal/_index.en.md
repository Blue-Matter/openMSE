---
date: "2021-03-23T11:35:01+06:00"
title: Catch-at-Length
weight: 6
---

The catch-at-length section includes annual catch-at-length data.

If no catch-at-length data exists, leave this section blank.

Otherwise a row should be populated for each year that catch-at-length (in units of **numbers**) exists.

Figure 1:
<img src="/Figures/cal1.PNG" alt="" width="600"/>

Figure 2:
<img src="/Figures/cal2.PNG" alt="" width="600"/>
Click the images to enlarge.


The *Catch-at-Length* section in the Data Documentation file is indicated with "## Catch-at-Length". Enter any relevant supporting information for the information in the Catch-at-Length section of the input file here. 

Ideally a short paragraph or two with supporting information for data entered in the Data Input file for Catch-at-Length data.

Use in-text citations where possible and include references under the "## Reference List" section.

Do not delete or modify the "## Catch-at-Length" heading.

### Vuln CAL
Numeric entry. Optional.

The default assumption is that the catch-at-length data is from the fishing fleet (i.e., the catch-at-length data reflects the aggregate vulnerability-at-length schedule from all fishing fleets).

If the catch-at-length data comes from a survey or a fleet with a different selectivity schedule, the vulnerability-at-length associated with the catch-at-length data should be entered here. The length of the *Vuln CAL* data should match the length of [CAL_mids], or be one less than the length of CAL_bins.

No alternative vulnerability schedule has been specified for the example cobia dataset. 

### CAL_bins
Numeric entry. 
Optional, but either *CAL_bins* or *CAL_mids* must be populated if catch-at-length data is entered.

The vertices of the length classes for the catch-at-length data. Must increase sequentially.

The cobia example has length classes beginning at 170 mm and extending to 1490 mm.
 
### CAL_mids
Numeric entry. 

Optional, but either *CAL_bins* or *CAL_mids* must be populated if catch-at-length data is entered.

The mid-points of the length classes for the catch-at-length data. 

If both CAL_bins and CAL_mids are entered, they must correspond correctly; that is, CAL_mids is the mid-points of the vertices specified in CAL_bins, and length CAL_mids is one shorter than length CAL_bins.

As the CAL_bins data has been entered, the CAL_mids row has been left blank for the cobia example.

### CAL
Numeric entries.

A row should be entered for each calendar year of catch-at-length data that exists. Text entries in the first column for each new row should be of the from "CAL YEAR", e.g. "CAL 1980", "CAL 1981", etc.

Catch-at-length (in numbers) should be entered for each length-class. That is, each row of CAL data should be the same length as CAL_mids or one less than the length of CAL_bins. 

The years in the catch-at-length data must be included in the years entered in the Year row. For example, "CAL 2019" is not valid if the years in Year only extend to 2015. In this case, increase the years in Year to 2019.

Years where catch-at-length data are missing can be left out, or entered with all values set to NA.

The cobia example has catch-at-length data from 1984 - 2011.
