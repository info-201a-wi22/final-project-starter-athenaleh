#original dataset with all the mental health issues ---------
mental_health <- read.csv("../data/prevalence-by-mental-and-substance-use-disorder.csv")
View(mental_health)
library(dplyr)
library(tidyverse)
library(stringr)


mental_health <- mental_health %>%
  rename(Schizophrenia=Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disroders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.)%>%
  group_by(Entity)%>%
  filter(Year >= 1991)%>%
  filter(Year <= 2012)
View(mental_health)

#Unemployment dataset----------
unemployment <- read.csv("../data/unemployment-rate.csv")
View(unemployment)
colnames(unemployment)

##cleaning up data set
unemployment <- unemployment %>%
  rename("Unempployment Total Labor Force %" = Unemployment..total....of.total.labor.force...modeled.ILO.estimate.)%>%
  group_by(Entity)%>%
  filter(Year <= 2012)
View(unemployment)


#government dataset --------------
government <- read_csv("../data/Government.xls.csv")

colnames(government)
government <- government %>%
  rename(Year= year, Code= scode, Entity= country, Regime = regime_nr)%>%
  group_by(Entity)%>%
  filter(Year > 1990) %>%
  select(Entity, Code, Year, Regime)
View(government)



table <- mental_health %>%
  left_join(government, by= c("Entity", "Year"))%>%
  left_join(unemployment, by=c("Entity", "Year"))

View(table)


# the average mental health problem percentage through each regime
mental_health_gov <- mental_health %>%
  group_by(Entity, Year)%>%
  summarize("Avg" = sum(Schizophrenia, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`, na.rm=T)/7)%>%
  left_join(government, by= c("Entity", "Year"))%>%
  filter(Code != "")%>%
  group_by(Regime)%>%
  summarize("Avg"= mean(Avg))
View(mental_health_gov)


#AGGREGATE LIST-----

aggregate_list <- mental_health %>%
  group_by(Code, Year)%>%
  filter(Code != "")%>%
  left_join(unemployment, by= c("Code", "Year"))%>%
  left_join(government, by= c("Code", "Year"))

  
View(aggregate_list) 
 
highest_region <- aggregate_list%>%
  filter(Year==max(Year))%>%
  group_by(Entity)%>%
  filter(Entity != "")%>%
  summarize(Avg_Mental_Health_Percentage = sum(Schizophrenia, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`, na.rm=T)/7)%>%
  filter(Avg_Mental_Health_Percentage == max(Avg_Mental_Health_Percentage, na.rm=T))%>%
  pull(Entity)
highest_region 
#United States

# What is the most prevalent mental health problem currently?-----
# (We have identified this as the most widespread issue that needs to be addressed globally)
library(reshape2)
most_prevelant_problem <- mental_health %>%
  filter(Year == max(Year))%>%
  group_by(Year)%>%
  summarize(schizophrenia_avg = mean(Schizophrenia), 
            bipolar_avg = mean(`Bipolar Disorders`), 
            anxiety_avg = mean(`Anxiety Disroders`), 
            drug_avg = mean(`Drug Use Disorders`), 
            eating_avg = mean(`Eating Disorders`),
            depressive_avg = mean(`Depressive Disorders`), 
            alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
  select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg) %>%
  melt(id.vars=c()) %>%
  rename(rate = value, disorders = variable) %>%
  filter(rate == max(rate)) %>%
  pull(disorders)

most_prevelant_problem # anxiety_avg

# Which country has the lowest amount of mental health issues currently? ----
# ("may be skewed/ biased (see below). If we delve into this country specifically, we can 
# extrapolate lessons on how governments can minimize mental illnesses to better serve their citizens)
library(reshape2)
least_prevelant_problem <- mental_health %>%
  filter(Year == max(Year))%>%
  group_by(Year)%>%
  summarize(schizophrenia_avg = mean(Schizophrenia), 
            bipolar_avg = mean(`Bipolar Disorders`), 
            anxiety_avg = mean(`Anxiety Disroders`), 
            drug_avg = mean(`Drug Use Disorders`), 
            eating_avg = mean(`Eating Disorders`),
            depressive_avg = mean(`Depressive Disorders`), 
            alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
  select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, eating_avg, depressive_avg, alcohol_avg) %>%
  melt(id.vars=c()) %>%
  rename(rate = value, disorders = variable) %>%
  filter(rate == min(rate)) %>%
  pull(disorders)

least_prevelant_problem # eating

# What is the most prevalent mental health problem in the first recorded time?-----
most_prevelant_problem_early <- mental_health %>%
  group_by(Year)%>%
  filter(Year == min(Year)) %>%
  summarize(schizophrenia_avg = mean(Schizophrenia), 
            bipolar_avg = mean(`Bipolar Disorders`), 
            anxiety_avg = mean(`Anxiety Disroders`), 
            drug_avg = mean(`Drug Use Disorders`), 
            eating_avg = mean(`Eating Disorders`),
            depressive_avg = mean(`Depressive Disorders`), 
            alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
  select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg) %>%
  melt(id.vars=c()) %>%
  rename(rate = value, disorders = variable) %>%
  filter(rate == max(rate)) %>%
  pull(disorders)

most_prevelant_problem_early # anxiety_avg

# What type of government produces the lowest prevalence of mental illnesses?-----
# (in the summary paragraph, point out that: "this may data be skewed because authoritative
# countries may have under reported values, or there may be going on that we cannot see")
lowest_prevalence <- mental_health_gov %>%
  filter(Avg==min(Avg))%>%
  pull(Regime)
lowest_prevalence
