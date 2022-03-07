# Nooha
# Stacked (different illness prevalence) bar (for each regime type) chart

library(dplyr)
library(ggplot2)

# data access
source("../source/aggregate_file.R")

# use the data
mental_health <- read_mental_health_dataset()
government_type <- read_government_dataset()

# cleaning up `mental_health` data frame
mental_health_df <- mental_health %>%
  mutate(Schizophrenia= Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disroders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.
  )%>%
  select(Entity, Year, Schizophrenia, "Eating Disorders", "Anxiety Disroders", "Bipolar Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders")%>%
  group_by(Entity)%>%
  filter(Year >= 1991)%>%
  filter(Year <= 2012)
View(mental_health_df)

# government
government_type <- government %>%
  mutate(Year= year, Code= scode, Entity= country, Regime = regime_nr)%>%
  select(Entity, Year, Regime)%>%
  group_by(Entity)%>%
  filter(Year > 1990) %>%
  select(Entity, Year, Regime)
View(government_type)



# aggregated data frame ------------------
mental_health_gov <- mental_health_df %>%
  group_by(Entity, Year)%>%
  right_join(government_type, by= c("Entity", "Year")) %>%
  group_by(Regime) %>%
  select(Regime, `Schizophrenia`, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`)
View(mental_health_gov)

# turning columns into rows
library(tidyr)
mental_health_gov_long <- pivot_longer(mental_health_gov, "Schizophrenia":"Alcohol Use Disorders", names_to = "disorder", values_to = "prevalence")%>%
  group_by(Regime, disorder)%>%
  summarize(prevalence= mean(prevalence, na.rm=T))
View(mental_health_gov_long)


# Stacked bar plot
chart_3 <- ggplot(mental_health_gov_long, aes(x = Regime, y = prevalence, fill = disorder)) + 
  geom_bar(stat ="identity") +
  scale_fill_brewer()
chart_3


