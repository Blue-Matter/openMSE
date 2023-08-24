# ---- Development Script ----

# authors: AH, RF

# # https://github.com/robynforrest/FSERP-herring - RF plotting functions
# hist_hMSEs <- readRDS("C:/Users/User/Documents/GitHub/FSERP-herring/MSEs/hist_hMSEs.rda")
# MSEs <- readRDS("C:/Users/User/Documents/GitHub/FSERP-herring/MSEs/HG/hMSEs_NF.rda")

# Functions:
# get_ - return data.frames with time-series information
# plot_ - plot the data.frames


# Giving error messages (all associated with code below)
# done 1. All plot calls with `facet=FALSE` -- Aesthetics can not vary along a ribbon
# done  2. get_at_Age(HistList) -- method not available for list
# done 3. get_Recruits(MSE1) -- You already noted that this isn't working yet
# done 4. plot_SSB(MSE1, inc.Hist=TRUE)  -- ‘max’ not meaningful for factors
# done 5. get_LifeHistory isn't working for the MSE object
# 6. box plots of OM life history parameters vs MSE assessment estimates # todo
# done 7. add OM fishing mortality to the time series plots


remotes::install_github('blue-matter/openMSE')
packageVersion('openMSE')

# 1.1.0
library(openMSE)
library(dplyr)

# Create Testing Objects ----
# > test objects too large to include in github repo <
# > build locally:
# source('data-raw/make_example_objects.R')

# Load Testing Objects ----
Hist1 <- readRDS('test_objects/Hist1.rda')
Hist2 <- readRDS('test_objects/Hist2.rda')
Hist3 <- readRDS('test_objects/Hist3.rda')
Hist4 <- readRDS('test_objects/Hist4.rda')

MSE1 <- readRDS('test_objects/MSE1.rda')
MSE2 <- readRDS('test_objects/MSE2.rda')
MSE3 <- readRDS('test_objects/MSE3.rda')
MSE4 <- readRDS('test_objects/MSE4.rda')

HistList <- readRDS('test_objects/HistList.rda')
MSEList <- readRDS('test_objects/MSEList.rda')

multiHist <- readRDS('test_objects/multiHist.rda')
MMSE <- readRDS('test_objects/MMSE.rda')
MMSE@multiHist <- multiHist # add multihist back in
.
# New versions of MSEtool will not drop multiHist slot by default



# Get information from objects ----

## Meta-data ----
get_Years(Hist1) %>% head()
get_Years(MSE1) %>% head()

get_Metadata(Hist1) %>% names()
get_Metadata(HistList) %>% names()

get_Metadata(MSE1) %>% names()
get_Metadata(MSEList) %>% names()

get_Metadata(multiHist) %>% names()
get_Metadata(MMSE) %>% names()

## Assessment Estimates ----
# for MSE objects that have SAMtool assessment MPs
# requires SAMtool v1.5.1 or later
get_Assess_Estimates(MSE1) %>% head()
get_Assess_Estimates(MSE1) %>% tail()

get_Assess_Estimates(MSEList) %>% head()
get_Assess_Estimates(MSEList) %>% tail()

assess_estimates <- get_Assess_Estimates(MSE1)
# estimated variables returned by SAMtool MPs in `PPD@Misc`
assess_estimates$Variable %>% unique()

get_Assess_Estimates(MMSE) %>% head()
get_Assess_Estimates(MMSE) %>% tail()

get_Assess_Estimates(MMSE) %>% filter(Sim==15, MP=="SCA_40_10",
                                      Year_est==1, Year_assess==50)


# Time-Series ----
# Dimensions: Year, Sim, Value, Variable, Period, Model
get_Biomass(Hist1) %>% head()

get_Biomass(HistList) %>% head()
et_Biomass(HistList) %>% tail()

# Dimensions: Year, Sim, Value, Variable, Period, Model Stock
get_Biomass(multiHist) %>% head()
get_Biomass(multiHist) %>% tail()

# Dimensions: Year, Sim, Value, Variable, Period, Model Stock MP
get_Biomass(MMSE) %>% head()
get_Biomass(MMSE) %>% tail()

# Dimensions: Year, Sim, Value, Variable, Period, Model
get_Biomass(MSE1) %>% head()
get_Biomass(MSE1) %>% tail()


## At-Age Schedules by Year ----
get_at_Age(Hist1)
get_at_Age(HistList)
get_at_Age(HistList) %>% tail()

get_at_Age(MSE1)
get_at_Age(MSEList)
get_at_Age(MSEList) %>% tail()

get_at_Age(multiHist)
get_at_Age(multiHist) %>% tail()

get_at_Age(MMSE) %>% head()
get_at_Age(MMSE) %>% tail()

## Time-Series ----

### Total Biomass ----
get_Biomass(Hist1) %>% head()
get_Biomass(MSE1) %>% head()
get_Biomass(MSE1) %>% tail()

# use a custom function to scale Value
get_Biomass(MSE1) %>% head()
get_Biomass(MSE1, scale=divide_1000) %>% head()

get_Biomass(HistList) %>% head()
get_Biomass(MSEList) %>% head()

get_Biomass(multiHist) %>% head()
get_Biomass(MMSE) %>% head()

### Spawning Biomass ----
get_SSB(Hist1) %>% head()
get_SSB(MSE1) %>% head()
get_SSB(HistList) %>% head()
get_SSB(MSEList) %>% head()

get_Biomass(multiHist) %>% head()
get_Biomass(MMSE) %>% head()

### Landings ----
get_Landings(Hist1) %>% head()
get_Landings(MSE1) %>% head()
get_Landings(HistList) %>% head()
get_Landings(MSEList) %>% head()

get_Biomass(multiHist) %>% head()
get_Biomass(MMSE) %>% head()

### Removals ----
get_Removals(Hist1) %>% head()
get_Removals(MSE1) %>% head()
get_Removals(HistList) %>% head()
get_Removals(MSEList) %>% head()

get_Biomass(multiHist) %>% head()
get_Biomass(MMSE) %>% head()

### Recruits ----
get_Recruits(Hist1) %>% head()
get_Recruits(HistList) %>% head()

get_Recruits(MSE1) %>% head()
get_Recruits(MSEList) %>% head()
get_Recruits(MSEList) %>% tail()

get_Recruits(multiHist) %>% head()
get_Recruits(MMSE) %>% head()

get_Recruits(MMSE) %>% filter(Sim==1, is.na(MP)==TRUE)

get_Recruits(MMSE) %>% filter(Sim==1, MP=='FMSYref' | is.na(MP)==TRUE)
get_Recruits(MMSE) %>% filter(Sim==1, MP=='FMSYref50' | is.na(MP)==TRUE)

## Life-History Parameters by Year ----

get_LifeHistory(Hist1)
get_LifeHistory(HistList)

get_LifeHistory(MSE1)

# this behaviour may change in future versions if we keep all details in MSE@Hist
MSE1_extended <- MSEtool::runMSE(testOM, MPs=c('FMSYref', 'FMSYref50'), extended = TRUE)
MSEList_extended <- list(Model_1=MSE1_extended, Model_2=MSE1_extended)

get_LifeHistory(MSE1_extended)

get_LifeHistory(MSEList_extended) %>% head()
get_LifeHistory(MSEList_extended) %>% tail()

get_LifeHistory(multiHist) %>% head()
get_LifeHistory(MMSE) %>% head()


# Plots ------

# Note: August 2023 - currently plotting functions don't work for MMSE and multiHist objects

## Time-Series Plots ----

# plot functions return list with `plot` and `df`:
p <- plot_SSB(Hist1)

# ggplot object:
p$plot + ggplot2::theme_classic() + ggplot2::labs(title='Test')

# summary data.frame
p$df

plot_SSB(Hist1)
plot_SSB(Hist1, years=1990:2000) # subset the years

plot_SSB(HistList)
plot_SSB(HistList, facet=FALSE)

plot_SSB(MSE1)
plot_SSB(MSE1, facet=FALSE)
plot_SSB(MSE1, inc.Hist=TRUE)
plot_SSB(MSE1, inc.Hist=TRUE, facet=FALSE)

plot_SSB(MSEList)
plot_SSB(MSEList, facet=FALSE)
plot_SSB(MSEList, inc.Hist=TRUE)
plot_SSB(MSEList, inc.Hist=TRUE, facet=FALSE)


# median only
plot_SSB(Hist1, quantiles=0.5)
plot_SSB(MSE1, quantiles=0.5)
plot_SSB(MSEList, quantiles=0.5)
plot_SSB(MSEList, quantiles=0.5, facet=FALSE)

plot_Biomass(Hist1)
plot_Biomass(HistList)
plot_Biomass(MSE1)
plot_Biomass(MSEList)

plot_Landings(Hist1)
plot_Landings(HistList)
plot_Landings(MSE1)
plot_Landings(MSEList)

plot_Removals(Hist1)
plot_Removals(HistList)
plot_Removals(MSE1)
plot_Removals(MSEList)

plot_Recruits(Hist1)
plot_Recruits(MSE1)
plot_Recruits(HistList)
plot_Recruits(MSEList)


plot_F(Hist1)
plot_F(HistList)
plot_F(MSE1)
plot_F(MSEList)

# Life-History parameters
plot_LifeHistory(Hist1)
plot_LifeHistory(HistList)
plot_LifeHistory(MSE1)
plot_LifeHistory(MSE1_extended)
plot_LifeHistory(MSEList_extended)


# ---- Plot At-Age Schedules ----

plot_Length(Hist1)
plot_Length(Hist1, scale=cm2inch, ylab='Length (inch)')

plot_Length(Hist1, years=2000:2010)
plot_Length(HistList)
plot_Length(MSE1)
plot_Length(MSEList)
plot_Length(MSEList, years=2000:2010)

plot_Weight(Hist1)
plot_Weight(MSE1)
plot_Weight(HistList)
plot_Weight(MSEList)

plot_Maturity(Hist1)
plot_Maturity(MSE1)
plot_Maturity(HistList)
plot_Maturity(MSEList)

plot_N.Mortality(Hist1)
plot_N.Mortality(MSE1)
plot_N.Mortality(HistList)
plot_N.Mortality(MSEList)

plot_Select(Hist1)
plot_Select(MSE1)
plot_Select(HistList)
plot_Select(MSEList)

plot_Retention(Hist1)
plot_Retention(MSE1)
plot_Retention(HistList)
plot_Retention(MSEList)

plot_Select_Maturity(Hist1)
plot_Select_Maturity(MSE1)
plot_Select_Maturity(HistList)
plot_Select_Maturity(MSEList)

