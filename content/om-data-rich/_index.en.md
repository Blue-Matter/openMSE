---
date: "2021-01-19T11:35:01+06:00"
description: Import an Operating Model from a Stock Assessment
icon: ti-download
title: Data-Rich
type: use-cases
weight: 3
---

Data-rich [Operating Models](/object-operating-model/) can be constructed by importing directly from the output of common stock assessment frameworks.

The [Custom Parameters](/features-custom-parameters/) slot (`OM@cpars`) is populated with the fisheries dynamics estimated by the stock assessment model and the `openMSE` simulation model reproduces these dynamics when simulating the [historical spool-up period](/tutorial-simulation-dynamics/spool-up/).

### Import a Stock Synthesis 3 assessment

There are several functions associated with importing from a [Stock Synthesis 3](https://vlab.ncep.noaa.gov/web/stock-synthesis) stock assessment model:

1. `SS2OM`: import a [Stock Synthesis 3](https://vlab.ncep.noaa.gov/web/stock-synthesis) stock assessment model.
1. `SS2Data`: import a [Data Object](/object-data) from a directory with SS3 input and output files.
1. `plot_SS2OM`: generates a markdown (HTML) report to compare the OM and SS3 output. 
1. `SS2MOM`: import a multi-stock/multi-fleet operating model (MOM) from SS3 output. 
1. `plot_SS2MOM`: generates a markdown (HTML) report to compare the MOM and SS3 output. 

See  [Importing from SS3](/features-importing-ss3/) for more information on importing OM, MOM, and Data objects from Stock Synthesis 3 output. 


### Import a iSCAM assessment
There are two functions associated with importing from a [iSCAM](https://github.com/smartell/iSCAM) stock assessment model:

1. `iSCAM2OM`: import a fitted iSCAM model
1. `iSCAM2Data`: import a [Data Object](/object-data) from a fitted iSCAM model.

See `?iSCAM2OM` or the [relevant `MSEtool` documentation page](https://msetool.openmse.com/reference/iSCAM2OM.html) for more information. 

### Import a VPA assessment
The `VPA2OM` function reads bootstrap estimates from a VPA stock assessment and imports into an operating model. See `?VPA2OM` or the [relevant `MSEtool` documentation page](https://msetool.openmse.com/reference/VPA2OM.html) for more information. 
