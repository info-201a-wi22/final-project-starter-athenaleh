# clear working environment
rm(list=ls())

# libraries
library(ggplot2)
library(dplyr)
library(reshape2)
library(tidyverse)

# source https://r-charts.com/correlation/scatter-plot-group-ggplot2/

# set working directory
setwd("~/Documents/Info201Code/Project/final-project-starter-athenaleh/source")

# data access
source("data_access.R")

# use the data
mental_health <- read_mental_health_dataset()
unemployment_rate <- read_unemployment_rate_dataset()

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
  ) %>% # rename using the code from P02.R
  filter(Year == "2019") %>%
  melt(id.vars=c("Year", "Entity", "Code")) %>% # change columns and rows to create a graph
  rename(disorders = variable) %>%
  filter(Code != "") # remove empty columns of Code because they're not countries

View(mental_health_filtered)

# unemployment rate
unemployment_filtered <- unemployment_rate %>%
  rename(Unemployment=Unemployment..total....of.total.labor.force...modeled.ILO.estimate.) %>%
  filter(Year == "2019") %>%
  melt(id.vars=c("Year", "Entity", "Code"))%>%  # to change the column and row 
  distinct(Entity, .keep_all=T) %>% # remove duplicates
  filter(Code != "") 

View(unemployment_filtered)

# countries chosen: USA (democracy), Brazil (military), Pakistan (multiparty), 
# Morocco (monarchy), Vietnam (single party)

# x unemployment rate 
# y rates of disorders of each country
# each graph shows each disorder


# Schizophrenia 
# merge unemployment and schizophrenia datasets together using code

merged_data <- merge(mental_health_filtered, unemployment_filtered, by= "Code") 


unemployment <- unemployment_filtered %>%
  select("Entity", "value")

schizophrenia <- mental_health_filtered %>%
  filter(disorders == "Schizophrenia") %>%
  select("Entity", "value", "disorders ") 
  
# data frame
data <- data.frame(unemployment, schizophrenia, group = "Entity")

# scatter plot by group 
ggplot(data, aes(x = x, y = x, color = disorders)) +
  geom_point() 

# change look of points: geom_point(shape = number, size = number)

# change shape per group 
# ggplot(data, aes(x = x, y = y, color = group, shape = group))

# legend customization
# guides(color = guide_legend(title = "Title"))
# custom key labels -- scale_color_discrete(labels = c("G1", "G2", "G3"))