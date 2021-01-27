## Re-submission
* Replaced directed quotes in Title and Description fields as requested - ie `openMSE` is now 'openMSE'

## Note to CRAN Maintainers
* This is a new release of the `openMSE` package
* The package serves as an umbrella package for our three closely related packages: `MSEtool`, `DLMtool` and `SAMtool`
* Some users will use those packages independently, but most will like to install and load them all simultaneously
* `openMSE` will not need frequent updates


## Test environments
* local - Windows 4.0.3
* Github actions - windows-latest (release)
* Github actions - macOS-latest (release)
* Github actions - ubuntu-20.04 (release)
* Github actions - ubuntu-20.04 (devel)
* RHub 

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE:
  - The Title field should be in title case. 
  
We have not addressed this note, as the suggestion to use `openmse` in the title is not appropriate in this context.

## Downstream dependencies
There are currently no downstream dependencies for this package
