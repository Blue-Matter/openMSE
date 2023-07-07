multiHist <- readRDS("C:/Users/User/Documents/GitHub/SAFMC-MSE/Hist_Objects/MOM_BaseCase.hist")

library(openMSE)
library(dplyr)

get_Years(multiHist)

SSB <- get_SSB(multiHist) %>% head()

get_Landings(multiHist) %>% head()
