# Nooha
# Stacked (different illness prevalence) bar (for each regime type) chart

library(dplyr)
library(ggplot2)

# data access
source("data_access.R")

# use the data
mental_health <- read_mental_health_dataset()
government_type <- read_government_dataset()

# cleaning up `mental_health` data frame
mental_health <- mental_health %>%
  rename("Scizophrenia" = Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent., 
         "Eating Disorders"= Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent., 
         "Anxiety Disorders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Bipolar Disorders" = Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.,
         "Drug Use Disorders" = Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Depressive Disorders" = Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.,
         "Alcohol Use Disorders" = Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.
  )%>%
  group_by(Entity)%>%
  filter(Year == "2012")
View(mental_health)

# government
government_type <- government_type %>%
  rename(Year = year, 
         Code= scode, 
         Entity= country, 
         Regime = regime_nr) %>%
  filter(Year == "2012") %>%
  select(Entity, Year, Regime)%>%
  group_by(Entity) %>%
  arrange(Year)
View(government_type)

# aggregated data frame ------------------
mental_health_gov <- mental_health %>%
  group_by(Entity, Year)%>%
  right_join(government_type, by= c("Entity", "Year")) %>%
  group_by(Regime) %>%
  select(Regime, `Scizophrenia`, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disorders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`)
View(mental_health_gov)

# turning columns into rows
library(tidyr)
mental_health_gov_long <- pivot_longer(mental_health_gov, "Scizophrenia":"Alcohol Use Disorders", names_to = "disorder", values_to = "prevalence")%>%
  group_by(Regime, disorder)%>%
  summarize(prevalence= mean(prevalence, na.rm=T))
View(mental_health_gov_long)


# Stacked bar plot
chart_3 <- ggplot(mental_health_gov_long, aes(x = Regime, y = prevalence, fill = disorder)) + 
  geom_bar(position="fill", stat ="identity") +
  scale_fill_brewer()



