# Summary file

source("../source/aggregate_file.R")

# libraries
library(ggplot2)
library(dplyr)
library(reshape2)
library(tidyr)
# Which country/region has the most mental health problems by the most recent date? -----

highest_region <-  mental_health_df%>%
  filter(Year==max(Year))%>%
  group_by(Entity)%>%
  filter(Entity != "")%>%
  summarize(Avg_Mental_Health_Percentage = sum(Schizophrenia, `Bipolar Disorders`, 
                                               `Eating Disorders`, `Anxiety Disroders`, 
                                               `Drug Use Disorders`, `Depressive Disorders`, 
                                               `Alcohol Use Disorders`, na.rm=T)/7)%>%
  filter(Avg_Mental_Health_Percentage == max(Avg_Mental_Health_Percentage, na.rm=T))%>%
  pull(Entity)
highest_region

highest_amount <- mental_health_df%>%
  filter(Year==max(Year))%>%
  group_by(Entity)%>%
  filter(Entity != "")%>%
  summarize(Avg_Mental_Health_Percentage = sum(Schizophrenia, `Bipolar Disorders`, 
                                               `Eating Disorders`, `Anxiety Disroders`, 
                                               `Drug Use Disorders`, `Depressive Disorders`, 
                                               `Alcohol Use Disorders`, na.rm=T)/7)%>%
  filter(Avg_Mental_Health_Percentage == max(Avg_Mental_Health_Percentage, na.rm=T))%>%
  pull(Avg_Mental_Health_Percentage)
highest_amount 

# What is the most prevalent mental health problem currently?-----
library(reshape2)
most_prevelant_problem <- mental_health_df%>%
  filter(Year == max(Year))%>%
  group_by(Year)%>%
  summarize(schizophrenia = mean(Schizophrenia), 
            eating = mean(`Eating Disorders`),
            bipolar = mean(`Bipolar Disorders`), 
            anxiety = mean(`Anxiety Disroders`), 
            drug = mean(`Drug Use Disorders`), 
            depressive = mean(`Depressive Disorders`), 
            alcohol = mean(`Alcohol Use Disorders`)) %>%
  select(schizophrenia, bipolar, anxiety, drug, depressive, alcohol, eating) %>%
  pivot_longer("schizophrenia":"eating", names_to = "disorders", values_to = "rate") %>%
  filter(rate == max(rate)) %>%
  pull(disorders)
most_prevelant_problem # anxiety_avg
 
colnames(mental_health_df)
  # Which country has the lowest amount of mental health issues currently? ----
 lowest_region <- mental_health_df%>%
   filter(Year==max(Year))%>%
   group_by(Entity)%>%
   filter(Entity != "")%>%
   summarize(Avg_Mental_Health_Percentage = sum(Schizophrenia, `Bipolar Disorders`, 
                                                `Eating Disorders`, `Anxiety Disroders`, 
                                                `Drug Use Disorders`, `Depressive Disorders`, 
                                                `Alcohol Use Disorders`, na.rm=T)/7)%>%
   filter(Avg_Mental_Health_Percentage == min(Avg_Mental_Health_Percentage, na.rm=T))%>%
   pull(Entity)
 lowest_region 
 
 # What is the most prevalent mental health problem in the first recorded time?-----
 most_prevelant_problem_early <- mental_health_df %>%
   filter(Year == min(Year))%>%
   group_by(Year)%>%
   summarize(schizophrenia = mean(Schizophrenia), 
             eating = mean(`Eating Disorders`),
             bipolar = mean(`Bipolar Disorders`), 
             anxiety = mean(`Anxiety Disroders`), 
             drug = mean(`Drug Use Disorders`), 
             depressive = mean(`Depressive Disorders`), 
             alcohol = mean(`Alcohol Use Disorders`)) %>%
   select(schizophrenia, bipolar, anxiety, drug, depressive, alcohol, eating) %>%
   pivot_longer("schizophrenia":"eating", names_to = "disorders", values_to = "rate") %>%
   filter(rate == max(rate)) %>%
   pull(disorders)
 most_prevelant_problem_early # anxiety_avg

# What type of government produces the lowest prevalence of mental illnesses?-----
lowest_prevalence <- mental_health_gov %>%
   filter(Avg==min(Avg))%>%
   pull(Regime)
lowest_prevalence



