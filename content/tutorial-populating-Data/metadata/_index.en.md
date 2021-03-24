---
date: "2021-03-23T11:35:01+06:00"
title: Metadata
weight: 1
---

The metadata section has 9 entries. All entries must go in the second column (column B if using a spreadsheet program such as MS Excel). 

<img src="/Figures/MetaData.png" alt="" width="450"/>

The *Metadata* section in the Data Documentation file is indicated with "## Metadata". Enter any relevant supporting information for the information in the Metadata section of the input file here. 

Use in-text citations where possible and include references under the "## Reference List" section.

Do not delete or modify the "## Metadata" heading.

### Name
Text entry. A unique name for this data file. 

### Common Name
Text entry. The common name of the species. 

The example data file is for data from a fishery for cobia.

### Species
Text entry. The scientific name of the species. 

The example data file includes the species name for cobia.

### Region
Text entry. The region of the fishery. 

The example data file assumes the fishery is in the Western Atlantic.

### Last Historical Year
Numeric entry. The calendar year of either:

1. when the most recent time-series data was collected, or
2. in cases where an MSE has already been conducted for this species and new data has been collected since,
the last historical year when the MSE was run. For example, if an MSE was conducted for this fishery in 2016 and new data has been collected since then, the last historical year is 2016.

The last historical year was 2011 in the example (Figure \@ref(fig:metadata)).

### Previous TAC
Numeric entry. The most recent total allowable catch (TAC). Leave blank if no TAC exists. 

There was no existing TAC for the example cobia fishery. 

### Units 
Text entry. The units of the TAC and catch data, e.g., 'thousand tonnes'. Leave blank if no TAC or catch data exists.

The catch data in the example fishery is in units of '1000 lbs'.

### Previous TAE
Numeric entry. The most recent total allowable effort limit (TAE). Leave blank if no TAE exists.

There was no existing TAE for the example cobia fishery. 

### nareas 
Numeric entry. The number of spatial areas used in management. Only used for management procedures that set spatial closures.
Leave blank if no spatial management is used or proposed. Don't enter 0 or 1.

The default value is 2 areas, which will be used if no value is entered here. 

There is no spatial management for the example cobia fishery. 
