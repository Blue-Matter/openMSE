# remotes::install_github("Blue-Matter/SAMtool") # version 1.5.1 or later
# remotes::install_github("Blue-Matter/MSEtool") # v3.7.0 or later


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
SCA_60_20 <- make_MP(SCA, HCR60_20)

MPs <- c('FMSYref', 'FMSYref50', 'SCA_40_10', 'SCA_60_20' )

MSE1 <- MSEtool::Project(Hist1, MPs=MPs)
MSE2 <- MSEtool::Project(Hist2, MPs=MPs)
MSE3 <- MSEtool::Project(Hist3, MPs=MPs)
MSE4 <- MSEtool::Project(Hist4, MPs=MPs)

multiHist <- SimulateMOM()
MMSE <- ProjectMOM(multiHist, MPs=MPs)

HistList <- list(Base_Case=Hist1, Lower_M=Hist2, Higher_M=Hist3, Lower_h=Hist4)
MSEList <- list(Base_Case=MSE1, Lower_M=MSE2, Higher_M=MSE3, Lower_h=MSE4)

saveRDS(Hist1, 'test_objects/Hist1.rda')
saveRDS(Hist2, 'test_objects/Hist2.rda')
saveRDS(Hist3, 'test_objects/Hist3.rda')
saveRDS(Hist4, 'test_objects/Hist4.rda')

saveRDS(MSE1, 'test_objects/MSE1.rda')
saveRDS(MSE2, 'test_objects/MSE2.rda')
saveRDS(MSE3, 'test_objects/MSE3.rda')
saveRDS(MSE4, 'test_objects/MSE4.rda')

saveRDS(HistList, 'test_objects/HistList.rda')
saveRDS(MSEList, 'test_objects/MSEList.rda')

saveRDS(multiHist, 'test_objects/multiHist.rda')
saveRDS(MMSE, 'test_objects/MMSE.rda')


