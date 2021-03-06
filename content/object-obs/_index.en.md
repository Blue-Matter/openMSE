---
date: "2021-01-19T11:35:01+06:00"
description: Observation error of fishery data
icon: far fa-binoculars
title: Obs Object
type: objects
weight: 3
---

Objects of class `Obs` are a sub-component of the [Operating Model Object](/operating-model-object/).  

The `Obs` object contains the observation error parameters associated with existing or possible data collection activities for the fishery. Users can specify the amount of observation error and directional bias associated with each type of simulated sampling in order to mimic assumptions about the reliability of real world sampling. In the MSE the [Fishery Data object](/object-data) is populated with data that is generated by the simulation model. Here the ‘true’ values recorded by the model are filtered through the observation parameters to generate typical fisheries data, which are recorded in the Data Object during each [management interval](/object-operating-model/1-omslots/#interval). 


Note that in a data poor situation with limited sampling users may not have information on the estimated error associated with every kind of sampling. However, it is only necessary to specify observation error associated with the data streams that will be utilized by the MPs that you are considering for use in management (feasible MPs). 

There are two different functions to assist with determining which data streams are utilized by each MP. The `Uses` function identifies the MPs that use a particular data slot, while the `Required` function returns the data requirements for MPs of interest so you can determine which observation error parameters are relevant to the MPs you intend to test. 

<!-- link to Uses and Required docs -->


