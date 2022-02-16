#original dataset with all the mental health issues
mental_health <- read.csv("data/prevalence-by-mental-and-substance-use-disorder.csv")
View(mental_health)
library(dplyr)
library(tidyverse)
library(stringr)
colnames(mental_health)

##cleaning up `mental_health` data frame
mental_health <- mental_health %>%
  rename(Scizophrenia=Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disroders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.
         )%>%
  group_by(Entity)%>%
  filter(Year >= 1991)%>%
  filter(Year <= 2012)
View(mental_health)

#Unemployment dataset
unemployment <- read.csv("data/unemployment-rate.csv")
View(unemployment)
colnames(unemployment)

##cleaning up data set
unemployment <- unemployment %>%
  rename("Unempployment Total Labor Force %" = Unemployment..total....of.total.labor.force...modeled.ILO.estimate.)%>%
  group_by(Entity)%>%
  filter(Year <= 2012)
View(unemployment)


#government dataset
government <- read_csv("data/Government.csv")
View(government)
colnames(government)
government <- government %>%
  rename(Year= year, Code= scode, Entity= country, Regime = regime_nr)%>%
  group_by(Entity)%>%
  filter(Year > 1990) %>%
  select(Entity, Code, Year, Regime)
View(government)


# aggregated table
aggregate_table <- mental_health %>%
  left_join(government, by= c("Entity", "Year"))%>%
  left_join(unemployment, by=c("Entity", "Year"))
  
View(aggregate_table)
?left_join
?n_distinct
?merge

