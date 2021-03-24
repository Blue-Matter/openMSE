---
date: "2021-01-19T11:35:01+06:00"
description: Populating and Documenting the Data Object
icon: far fa-file-import
title: Populating the Data Object
type: tutorials
weight: 1
---


This section describes how to enter data in the [Data Excel Input file]((/object-data/creating/)) and document the data in the [Data Documentation file](/object-data/creating/).

The Fishery Data can be combined with the Data Documentation file to generate a [report of the Data object](/object-data/plotting/#data-report). 

### Templates
Templates for the Data Input and Data Documentation files can be downloaded from an online repository.

- [Data Input Excel File](https://raw.githubusercontent.com/Blue-Matter/MSEtool/master/inst/Data.xlsx) 
(or [Data Input CSV File](https://raw.githubusercontent.com/Blue-Matter/MSEtool/master/inst/Data.csv))

- [Data Documentation File](https://raw.githubusercontent.com/Blue-Matter/MSEtool/master/inst/Rmd/Data/Data.md) 

Note that the links to the Data Input CSV File and Data Documentation File will open in the web browser. Save these files to your machine (usually by right-clicking in the browser) will file extensions '.csv' and '.md' respectively.

Alternatively, the template files can be generated in your working directory with:

```{r, eval=FALSE}
DataInit("MyData")
```

This will create two files in your current working directory: ‘MyData.xlsx’ and ‘MyData.md’.

See the [Creating Data Input files](/object-data/creating/) section for more details.


**Important Note 1:** In most cases, the data input file allows only one entry for each data type. For example, multiple catch-at-age data sets may be available (e.g., from a commercial fishery and from a fishery-independent survey). However, to be used in stock assessment or analysis, the two data sets must be combined in some way (or one data set ignored if it is not considered representative or reliable). 
Consequently, the data included in the Data Input file must represent the best available data. That is, the data sets must be combined in some manner (ideally described in the Data Documentation File) and the single data set entered into the data input file so it can be used in assessment or by management procedures.

This same principle applies to other data entered into the data input file. The only exception is for indices of abundance where multiple indices are allowed. This is explained in more detail in later sections. 

**Important Note 2:** It is important that the text in the first column of the Excel input file (column A) is not modified at all. These names are used to import the data file into the correct format in R.

**Important Note 3:** The data input file requires both character string (i.e., text) and numeric inputs. The data format for each entry is described below. It is important that no text is entered into the entries that require numeric inputs. For example, "Previous TAC" is a numeric input. A value of '1000' (without the quotations) is acceptable, while an input of 'about 1000' is not. 

**Important Note 4:** Do not use any thousands separators. For example 1 000 000 and 1,000,000 may introduce errors during the data import. Entries like 1000000 are preferable. 

The fishery data are grouped into 7 categories:

1. Metadata
1. Biological parameters
1. Selectivity parameters
1. Time-series information
1. Catch-at-age data
1. Catch-at-length data
1. Reference points and other metrics

The Data Documentation file has seven headings (indicated with the ## symbols) that correspond to these 7 categories. Do not delete or modify these headings. Enter all documentation under the relevant section in the Data Documentation file.

The first three lines of the Data Documentation file ask for information on the *title*, *author*, and *date*. Replace all text after the ":" symbol with the relevant information. Do not delete or modify the text  *title*, *author*, and *date*.

The following sub-sections describe the data inputs for each of data category. 
