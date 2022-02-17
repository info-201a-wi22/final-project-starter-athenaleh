# libraries
library(ggplot2)
library(dplyr)
library(reshape2)

# source https://r-charts.com/correlation/scatter-plot-group-ggplot2/

# set working directory
setwd("~/Documents/Info201Code/Project/final-project-starter-athenaleh/source")

# clear working environment
rm(list=ls())

# data access
source("data_access.R")

# use the data
mental_health <- read_mental_health_dataset()
unemployment_rate <- read_unemployment_rate_dataset()
government_type <- read_government_dataset()

# clean up data
# mental health
mental_health_filtered <- mental_health %>%
  rename(Schizophrenia=Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disroders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.
  ) %>%
  filter(Year == "2019", 
         Entity ==  "America" | Entity == "Pakistan" | Entity == "Brazil" | Entity == "Morocco" | Entity == "Vietnam") %>%
  melt(id.vars=c("Year", "Entity", "Code"))

View(mental_health_filtered)

# unemployment rate
unemployment_filtered <- colnames(unemployment_rate) %>%
  rename(Unemployment = Unemployment..total....of.total.labor.force...modeled.ILO.estimate.) %>%
filter(Year == "2019", 
       Entity ==  "America" | Entity == "Pakistan" | Entity == "Brazil" | Entity == "Morocco" | Entity == "Vietnam") %>%
  melt(id.vars=c("Year", "Entity", "Code"))

View(unemployment_rate)

# government
View(government_type)
colnames(government_type)
government_type <- government_type %>%
  rename(Year = year, 
         Code= scode, 
         Entity= country, 
         Regime = regime_nr) %>%
  filter(Year >= 1990) %>%
  select(Entity, Code, Year, Regime)%>%
  group_by(Entity) %>%
  arrange(Year)

View(government)

# countries chosen: USA (democracy), Brazil (military), Pakistan (multiparty), 
# Morocco (monarchy), Vietnam (single party)

# percentages of rates per country
# unemployment rate per country 

# specifics for mental health and unemployment rate dataframe
# year == 2019
# countries == "USA" | "Pakistan" | "Brazil" | "Morocco" | "Vietnam"

# USA 2019



# x unemployment rate 
# y rates of different disorders  
x <- 
y <- 

# data frame
data <- data.frame(x, y, group = disorders)

# scatter plot by group 
ggplot(data, aes(x = x, y = x, color = disorders)) +
  geom_point() 

# change look of points: geom_point(shape = number, size = number)

# change shape per group 
# ggplot(data, aes(x = x, y = y, color = group, shape = group))

# legend customization
# guides(color = guide_legend(title = "Title"))
# custom key labels -- scale_color_discrete(labels = c("G1", "G2", "G3"))