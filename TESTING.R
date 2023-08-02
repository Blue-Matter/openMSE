# ---- Development Script ----

devtools::load_all()

MMSE <- x <- readRDS("C:\\Users\\User\\AppData\\Local\\Temp\\RtmpyEwGrr\\file57e444696802")

df <- get_SB_SBMSY(MMSE)

fs <- get_F(MMSE)



# Load Objects
Hist1 <- readRDS('test_objects/Hist1.rda')
Hist2 <- readRDS('test_objects/Hist2.rda')
Hist3 <- readRDS('test_objects/Hist3.rda')
Hist4 <- readRDS('test_objects/Hist4.rda')

MSE1 <- readRDS('test_objects/MSE1.rda')
MSE2 <- readRDS('test_objects/MSE2.rda')
MSE3 <- readRDS('test_objects/MSE3.rda')
MSE4 <- readRDS('test_objects/MSE4.rda')

HistList <- readRDS('test_objects/HistList.rda')
MSElist <- readRDS('test_objects/MSEList.rda')

multiHist <- readRDS('test_objects/multiHist.rda')
MMSE <- readRDS('test_objects/MMSE.rda')
MMSE@multiHist <- multiHist


# Meta-Data ----
get_Years(Hist1) %>% head()
get_Years(MSE1) %>% head()
get_Years(multiHist) %>% head()
get_Years(MMSE) %>% head()

get_Metadata(Hist1) %>% names()
get_Metadata(MSE1) %>% names()
get_Metadata(multiHist) %>% names()
get_Metadata(MMSE) %>% names()

# Time-Series ----
# Dimensions: Year, Sim, Value, Variable, Period, Model
get_Biomass(Hist1) %>% head()
get_Biomass(Hist1) %>% tail()

get_Biomass(HistList) %>% head()
get_Biomass(HistList) %>% tail()

# Dimensions: Year, Sim, Value, Variable, Period, Model
get_Biomass(multiHist) %>% head()
get_Biomass(multiHist) %>% tail()


get_Biomass(MMSE) %>% head()
get_Biomass(MMSE) %>% tail()



get_Biomass(MSE1) %>% head()
get_Biomass(MSE1) %>% tail()




## Assessment Estimates ----
# for MSE objects that have SAMtool assessment MPs
# requires SAMtool v1.5.1 or later
get_Assess_Estimates(MSE1) %>% head()
get_Assess_Estimates(MSE1) %>% tail()

names(MSElist)
get_Assess_Estimates(MSElist) %>% head()
get_Assess_Estimates(MSElist) %>% tail()

get_Assess_Estimates(MMSE) %>% head()








assess_estimates <- get_Assess_Estimates(MSE1)



get_Metadata()
get_Years(HistList) %>% head()
get_Years(MSElist) %>% head()
