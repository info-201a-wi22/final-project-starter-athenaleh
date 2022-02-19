# clear working environment
rm(list=ls())

# libraries
library(ggplot2)
library(dplyr)
library(reshape2)



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

# x unemployment rate 
# y rates of disorders of each country
# each graph shows each disorder

# Schizophrenia 
schizophrenia <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Schizophrenia") 

# merge unemployment and schizophrenia data sets together using code
merged_schizophrenia <- merge(schizophrenia, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(Schizophrenia = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# source used https://r-charts.com/correlation/scatter-plot-group-ggplot2/ to
# create scatter plot 
# scatter plot by Schizophrenia
ggplot(merged_schizophrenia, aes(x = Unemployment, y = Schizophrenia)) +
  geom_point() 

# Bipolar Disorders
bipolar_disorders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Bipolar Disorders") 

# merge unemployment and bipolar disorder data sets together using code
merged_bd <- merge(bipolar_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(Bipolar_disorders_rates = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by bipolar disorders
ggplot(merged_bd, aes(x = Unemployment, y = Bipolar_disorders_rates)) +
  geom_point() 

# Eating Disorders
eating_disorders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Eating Disorders") 

merged_ed <- merge(eating_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(eating_disorders_rates = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by eating disorders
ggplot(merged_ed, aes(x = Unemployment, y = eating_disorders_rates)) +
  geom_point() 

# Anxiety Disorders
anxiety_disroders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Anxiety Disorders") 

merged_anxiety_disorders <- merge(eating_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(anxiety_disorders_rates = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by eating disorders
ggplot(merged_anxiety_disorders, aes(x = Unemployment, y = anxiety_disorders_rates)) +
  geom_point() 

# Drug Use Disorders
drug_use_disorders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Drug Use Disorders") 

merged_drug_use <- merge(drug_use_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(drug_use_disorders_rates = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by eating disorders
ggplot(merged_drug_use, aes(x = Unemployment, y = drug_use_disorders_rates)) +
  geom_point() 

# Depressive Disorders
depressive_disorders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Depressive Disorders") 

merged_depressive_disorders <- merge(eating_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(depressive_disorders_rates = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by eating disorders
ggplot(merged_depressive_disorders, aes(x = Unemployment, y = depressive_disorders_rates)) +
  geom_point() 

# Alcohol Use Disorders
alcohol_use_disorders <- mental_health_filtered %>% # filter it to only have Schizophrenia
  filter(disorders == "Alcohol Use Disorders") 

merged_alcohol_use <- merge(alcohol_use_disorders, unemployment_filtered, by= "Code") %>%
  select("Entity.x", "disorders", "value.x", "variable", "value.y") %>%
  rename(alcohol_use_disorders = value.x, 
         Unemployment = value.y,
         Countries = Entity.x)

# scatter plot by alcohol use disorders
ggplot(merged_alcohol_use, aes(x = Unemployment, y = alcohol_use_disorders, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none") 

# SCATTER PLOTS - finalized w/ designs
alcohol_use <- ggplot(merged_alcohol_use, aes(x = Unemployment, y = alcohol_use_disorders, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

depressive_disorders <- ggplot(merged_depressive_disorders, aes(x = Unemployment, y = depressive_disorders_rates, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

drug_use <- ggplot(merged_drug_use, aes(x = Unemployment, y = drug_use_disorders_rates, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

bd <- ggplot(merged_bd, aes(x = Unemployment, y = Bipolar_disorders_rates, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

schizophrenia <- ggplot(merged_schizophrenia, aes(x = Unemployment, y = Schizophrenia, color = Countries)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

anxiety<- ggplot(merged_anxiety_disorders, aes(x = Unemployment, y = anxiety_disorders_rates)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

ed <- ggplot(merged_ed, aes(x = Unemployment, y = eating_disorders_rates)) +
  geom_point() +
  theme_linedraw() +
  theme(legend.position = "none")

# change look of points: geom_point(shape = number, size = number)
# change shape per group 
# ggplot(data, aes(x = x, y = y, color = group, shape = group))

# legend customization
# guides(color = guide_legend(title = "Title"))
# get rid of legend by theme(legend.position = "none")
# custom key labels -- scale_color_discrete(labels = c("G1", "G2", "G3"))