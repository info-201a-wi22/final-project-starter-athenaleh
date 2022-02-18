# Nooha
# Stacked (different illness prevalence) bar (for each gov type) chart
library(dplyr)
library(ggplot2)

# data access
source("data_access.R")

# use the data
mental_health <- read_mental_health_dataset()
government_type <- read_government_dataset()

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

# government
government_type <- government_type %>%
  rename(Year = year, 
         Code= scode, 
         Entity= country, 
         Regime = regime_nr) %>%
  filter(Year = 2012) %>%
  select(Entity, Code, Year, Regime)%>%
  group_by(Regime) %>%
  arrange(Year)


View(government_type)
# x unemployment rate 
# y rates of different disorders  
x <- 
y <- 

df <- data.frame(x = government_type, y = disorder_prevalence, group = disorder)
government_type <- c(autocracy, democracy, republic, ...)
disorder <- rep(c("depression" , "anxiety" , "bipolar", "schizophrenia"))

# Stacked
ggplot(df, aes(x=government_type, y=disorder_prevalence, fill=disorder)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_brewer()

