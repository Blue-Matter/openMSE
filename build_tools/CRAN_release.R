devtools::build('../openMSE')

v <- as.character(packageVersion("openMSE"))
nm <- paste0("openMSE_", v, ".tar.gz")

shell(paste0("R CMD check ../", nm))

# Check downstream dependencies
# currently none

# R-hub Checks
# Check on fedora dist
# devtools::install_github('r-hub/rhub')
library(rhub)

validate_email()

cran_prep <- check_for_cran()
cran_prep$cran_summary()


# usethis::use_revdep()
# revdepcheck::revdep_check(num_workers = 4)

tt = devtools::spell_check()

tt

devtools::release()
