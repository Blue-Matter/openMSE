remotes::install_github("Blue-Matter/SAMtool") # version 1.5.1 or later
remotes::install_github("Blue-Matter/MSEtool") # v3.7.0 or later


# Create some Hist and MSE objects for development
library(MSEtool)
library(SAMtool)

om <- MSEtool::testOM
om@nsim <- 3
OM1 <- OM2 <- OM3 <- OM4 <- om
OM2@M <- OM1@M / 1.25
OM3@M <- OM1@M * 1.25
OM4@h <- OM1@h / 1.25

OM1@CurrentYr <- 2023
OM2@CurrentYr <- 2023
OM3@CurrentYr <- 2023
OM4@CurrentYr <- 2023

Hist1 <- MSEtool::Simulate(OM1)
Hist2 <- MSEtool::Simulate(OM2)
Hist3 <- MSEtool::Simulate(OM3)
Hist4 <- MSEtool::Simulate(OM4)

SCA_40_10 <- make_MP(SCA, HCR40_10, diagnostic = "full")
SCA_60_20 <- make_MP(SCA, HCR60_20, diagnostic = "full")

MPs <- c('FMSYref', 'FMSYref50', 'SCA_40_10', 'SCA_60_20' )

MSE1 <- MSEtool::Project(Hist1, MPs=MPs)
MSE2 <- MSEtool::Project(Hist2, MPs=MPs)
MSE3 <- MSEtool::Project(Hist3, MPs=MPs)
MSE4 <- MSEtool::Project(Hist4, MPs=MPs)

HistList <- list(Base_Case=Hist1, Lower_M=Hist2, Higher_M=Hist3, Lower_h=Hist4)
MSEList <- list(Base_Case=MSE1, Lower_M=MSE2, Higher_M=MSE3, Lower_h=MSE4)

usethis::use_data(Hist1, overwrite = TRUE)
usethis::use_data(Hist2, overwrite = TRUE)
usethis::use_data(Hist3, overwrite = TRUE)
usethis::use_data(Hist4, overwrite = TRUE)

usethis::use_data(MSE1, overwrite = TRUE)
usethis::use_data(MSE2, overwrite = TRUE)
usethis::use_data(MSE3, overwrite = TRUE)
usethis::use_data(MSE4, overwrite = TRUE)

usethis::use_data(HistList, overwrite = TRUE)
usethis::use_data(MSEList, overwrite = TRUE)
