## code to prepare `TS_Variables` dataset goes here

TS_Variables <- read.csv('data-raw/TS_Variables.csv')

usethis::use_data(TS_Variables, overwrite = TRUE)



At_Age_TS_Variables <- read.csv('data-raw/At_Age_TS_Variables.csv')

usethis::use_data(At_Age_TS_Variables, overwrite = TRUE)
