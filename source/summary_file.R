# Summary file
setwd("~/Documents/Info201Code/Project/final-project-starter-athenaleh/source")

source("p02.R")

# libraries
library(ggplot2)
library(dplyr)
library(reshape2)

# Which continent/region has the most mental health problems by the most recent date? -----
# (This is where mental health has to be most prioritized)
highest_region <- aggregate_list%>%
  filter(Year==max(Year))%>%
  group_by(Year)%>%
  filter(`Avg Mental Health Percentage`== max(`Avg Mental Health Percentage`))%>%
  pull(Entity.x)
  
highest_region

# What is the most prevalent mental health problem currently?-----
# (We have identified this as the most widespread issue that needs to be addressed globally)
most_prevelant_problem <- mental_health %>%
  filter(Year == max(Year))%>%
  group_by(Year)%>%
  summarize(schizophrenia_avg = mean(Schizophrenia), 
            bipolar_avg = mean(`Bipolar Disorders`), 
            anxiety_avg = mean(`Anxiety Disroders`), 
            drug_avg = mean(`Drug Use Disorders`), 
            depressive_avg = mean(`Depressive Disorders`), 
            alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
  select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg) %>%
  melt(id.vars=c()) %>%
  rename(rate = value, disorders = variable) %>%
  filter(rate == max(rate)) %>%
  pull(disorders)

 most_prevelant_problem # anxiety_avg

 # Which country has the lowest amount of mental health issues?
 least_prevelant_problem <- mental_health %>%
   filter(Year == max(Year))%>%
   group_by(Year)%>%
   summarize(schizophrenia_avg = mean(Schizophrenia), 
             bipolar_avg = mean(`Bipolar Disorders`), 
             anxiety_avg = mean(`Anxiety Disroders`), 
             drug_avg = mean(`Drug Use Disorders`), 
             depressive_avg = mean(`Depressive Disorders`), 
             alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
   select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg) %>%
   melt(id.vars=c()) %>%
   rename(rate = value, disorders = variable) %>%
   filter(rate == min(rate)) %>%
   pull(disorders)
 
 least_prevelant_problem # schizophrenia
 
 # What is the most prevalent mental health problem in the first recorded time?-----
 most_prevelant_problem_early <- mental_health %>%
   filter(Year == min(Year)) %>%
   group_by(Year)%>%
   summarize(schizophrenia_avg = mean(Schizophrenia), 
             bipolar_avg = mean(`Bipolar Disorders`), 
             anxiety_avg = mean(`Anxiety Disroders`), 
             drug_avg = mean(`Drug Use Disorders`), 
             depressive_avg = mean(`Depressive Disorders`), 
             alcohol_avg = mean(`Alcohol Use Disorders`)) %>%
   select(schizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg) %>%
   melt(id.vars=c()) %>%
   rename(rate = value, disorders = variable) %>%
   filter(rate == max(rate)) %>%
   pull(disorders)
 
 most_prevelant_problem_early # anxiety_avg

 # Which country has the lowest amount of mental health issues on average? ----
# ("may be skewed/ biased (see below). If we delve into this country specifically, we can 
# extrapolate lessons on how governments can minimize mental illnesses to better serve their citizens)
country_lowest<- aggregate_list%>%
  filter(Year==max(Year))%>%
  group_by(Year)%>%
  filter(`Avg Mental Health Percentage`== min(`Avg Mental Health Percentage`))%>%
  pull(Entity.x)
country_lowest
  
# What type of government produces the lowest prevalence of mental illnesses?-----
# (in the summary paragraph, point out that: "this may data be skewed because authoritative
# countries may have under reported values, or there may be going on that we cannot see")
lowest_prevalence <- mental_health_gov %>%
  filter(`Regime Mental Health Avg` == min(`Regime Mental Health Avg`))%>%
  pull(Regime)
lowest_prevalence

# What is the correlation between unemployment rates and the prevalence of mental illnesses in 2019?
# (calculate a correlation coefficient - like a Pearson's R or p-value)
source("p02.R")
source("chart_1.R")

mh_correlation_filter <- mental_health %>%
  filter(Year == max(Year)) %>%
  group_by(Code, Entity) %>%
  distinct(Entity, .keep_all=T) %>% 
  filter(Code != "") %>%
  rename(Schizophrenia=Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disorders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.
  ) %>%
  summarize(schizophrenia_avg = mean(Schizophrenia), 
            bipolar_avg = mean(`Bipolar Disorders`), 
            anxiety_avg = mean(`Anxiety Disorders`), 
            drug_avg = mean(`Drug Use Disorders`), 
            depressive_avg = mean(`Depressive Disorders`), 
            alcohol_avg = mean(`Alcohol Use Disorders`)) 
View(mh_correlation_filter)

unemployment_cor_filter <- unemployment_filtered %>%
  select("Code", "Entity", "value") %>%
  rename(Unemployment_rate = value)

schizo_avg_filter <- mh_correlation_filter %>%
  select(Code, Entity, schizophrenia_avg)

merge_schizo_unemployment <- merge(schizo_avg_filter, unemployment_cor_filter, by = "Code") %>%
  select("Entity.x", "schizophrenia_avg", "Unemployment_rate")


summarize("Avg_Percentage" = sum(Scizophrenia, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`, na.rm=T)/7)%>%
  left_join(government, by= c("Entity", "Year"))%>%
  filter(Code != "")%>%
  group_by(Regime)%>%
  summarize("Regime Mental Health Avg"= mean(Avg_Percentage))



