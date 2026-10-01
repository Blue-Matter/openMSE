## `openMSE` 2.0.0
Requires R 4.4.0 and `MSEtool` 4.0.0 or later. Added quick-reference cheatsheets at https://openmse.openmse.com/.

Removed the unit conversion and scaling functions (`lb2kg()`, `kg2lb()`, `inch2mm()`, `mm2inch()`, etc.);
use the equivalents in `MSEtool`. `cm2inch()`, `inch2cm()`, `multiply_*()`, and `divide_*()` have been removed
without replacement.

The plotting functions (`plot_TS()`, `plot_SSB()`, `plot_at_Age()`, etc.) and data-frame functions
(`get_ts()`, `get_SSB()`, `get_at_Age()`, etc.) are deprecated. They work only with legacy `Hist` and `MSE`
objects; use the `Plot*()` functions and time-series extractors (`SBiomass()`, `Landings()`, etc.) in
`MSEtool` for `hist` and `mse` objects.

## `openMSE` 1.0.1
Added functions for generating dataframes from `Hist` and `MSE` objects, and plotting time series such as 
biomass, landings, removals, etc. See https://openmse.openmse.com/ for details.

## `openMSE` 1.0.0
`openMSE` has been released on CRAN!

