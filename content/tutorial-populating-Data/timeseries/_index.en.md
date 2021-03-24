---
date: "2021-03-23T11:35:01+06:00"
title: Timeseries
weight: 4
---

The time-series section includes data sources such as annual catches, annual abundance indices, and other annual indices such as recruitment, and mean length.  

The *Time-Series* section in the Data Documentation file is indicated with "## Time-Series". Enter any relevant supporting information for the information in the Time-Series section of the input file here. 

Ideally a short paragraph or two with supporting information for data entered in the Data Input file for the Time-Series data.

Use in-text citations where possible and include references under the "## Reference List" section.

Do not delete or modify the "## Time-Series" heading.

Figure 1:
<img src="/Figures/timeseries1.PNG" alt="" width="600"/>


Figure 2:
<img src="/Figures/timeseries2.PNG" alt="" width="600"/>

Click the images to enlarge.

Time-series data should be entered for all historical years of the fishery; that is, the first year the fishery began to the current year of data (see two example figures). Years where no data are available should either be left empty or populated with an 'NA' (no quotations).

### Year
Numeric entry. The calendar years the fishery has been operating. The years should begin in the first year of the fishery and sequentially increase to the last year where time-series data is available. This is usually the same as the Last Historical Year, unless more data has been collected since an MSE was conducted in the Last Historical Year.

In the cobia example, the fishery began in 1950 and time-series data exists until 2011 .

### Annual Catch and CV {#catches}
Numeric entries.

Total catch records for each year (NA for missing years) in the same units as Units and Previous TAC. 

CVs for each catch record should be included in the *CV Catch* row.

In the cobia example, we have catch records for every year, but no information on the CVs associated with these catches.

### Annual Effort and CV
Numeric entries.

Data on the annual total fishing effort and associated annual CVs. Effort can either be in absolute units (e.g., days at sea) or a relative trend in effort (e.g., ranging from 0 to 1). However, the effort data should be in the same units as [Previous TAE] (if available).

Leave blank or use NA for missing years. 

There is no information on fishing effort for our cobia example.


### Abundance Index and CV {#abundance-index}
Numeric entries.

Relative or absolute annual index of total abundance and associated CVs. Leave blank if no data exists or use NA for years where data is missing.

The abundance index for the cobia example data set begins in 1981. All years before this are NA. There is no information on CV of the abundance index for the cobia example (see figures above).

### Spawning Abundance Index and CV {#spabundance-index}
Numeric entries.

Relative or absolute annual index of spawning abundance and associated CVs. Leave blank if no data exists or use NA for years where data is missing.

### Vulernable Abundance Index and CV {#vabundance-index}
Numeric entries.

Relative or absolute annual index of vulnerable abundance and associated CVs. Leave blank if no data exists or use NA for years where data is missing.


### Additional Indices
Numeric entries.

The additional indices are optional, and are used in cases where multiple indices of abundance exist and are used either in combination or separately by management procedures. 

There is no limit to the number of additional indices that can be added. The Data Input template has space for two additional indices (shaded in grey to indicate they are optional; see figures above). 

Additional indices can be added by inserting 3 new rows for each additional index, with names in Column A following the form (ensure there are no spaces before or after the text):

1. Index #
1. CV Index #
1. Vuln Index #

where # is a sequentially increasing integer for each additional index.

The data for the additional indices follows the same form as Abundance Index and CV. The only additional piece of information is the new row for the vulnerability schedule associated with the new index. 

The vulnerability schedule for each index (e.g., *Vuln Index 1*) must be of length Maximum age + 1 (i.e., all age-classes including age-0) and contain the vulnerability-at-age schedule associated with each index; i.e., values ranging from 0 to 1 indicating the vulnerability of each age-class that is represented in the additional index.

There are no additional indices for the example cobia dataset. 

### Recruitment Index and CV
Numeric entries.

Estimates of annual age-0 recruitment and associated CVs. 

Leave blank if no data exists, or use NA to indicate years where data are missing.
Must be the same length as Year.

There is no data on annual recruitment for the example cobia dataset.
### Mean Length
Numeric entry.

Annual estimates of mean length of the vulnerable population (or catch). 

Leave blank if no data exists, or use NA to indicate years where data are missing.
Must be the same length as Year.

There is no data on annual mean length for the example cobia dataset.

### Modal Length (LC)
Numeric entry.

Annual estimates of modal length of the vulnerable population (or catch). This is often used to assume the first length class 
of full selection.

Leave blank if no data exists, or use NA to indicate years where data are missing.
Must be the same length as Year.

There is no data on annual modal length for the example cobia dataset.

### Mean Length above Lc
Numeric entry.

Annual estimates of mean length *above the modal length (Lc)* of the vulnerable population (or catch). 

Leave blank if no data exists, or use NA to indicate years where data are missing.
Must be the same length as Year.

There is no data on annual mean length above Lc for the example cobia dataset.
