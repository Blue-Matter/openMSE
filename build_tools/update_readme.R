library(usethis)

usethis::use_readme_rmd()
usethis::use_logo("../openMSE/build_site/logo/openMSE.png")
usethis::use_cran_badge()

devtools::build_readme()
