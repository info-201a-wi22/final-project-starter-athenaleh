#arianna - Maps
# libraries
library(ggplot2)
library(dplyr)
library(reshape2)

install.packages("leaflet")
library(leaflet)

# source https://r-charts.com/correlation/scatter-plot-group-ggplot2/

# set working directory
setwd("~/Documents/Info201Code/final-project-starter-athenaleh/source")

# clear working environment
rm(list=ls())

# data access
source("data_access.R")

# use the data - should represent prevalence of mental disorders around the 
#world

##cleaning up `mental_health` data frame - copied from p02.R
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

#filtering down - getting average stats for all mental health illness columns; one stat per Entity
averaging <- mental_health %>% 
  group_by(Entity, Code) %>% 
  summarize(Scizophrenia = mean(Scizophrenia), 
            `Bipolar Disorders` = mean(`Bipolar Disorders`), 
            `Eating Disorders`= mean(`Eating Disorders`), 
            `Anxiety Disorders`=mean(`Anxiety Disorders`), 
            `Drug Use Disorders`=mean(`Drug Use Disorders`), 
            `Depressive Disorders`=mean(`Depressive Disorders`), 
            `Alcohol Use Disorders`=mean(`Alcohol Use Disorders`)) %>% 
  filter(Code != "") #filtering down to only countries
View(averaging)


#using leaflet
map_of_world_lol_Africa <- function() {
m <- leaflet() %>% 
  addTiles() %>% #look into adding default openStreetMap map tiles
  addMarkers(lng = 8.9, lat = 34.5, popup = "Africa")  
return(m)
}

m <- leaflet() %>% 
  addTiles() %>% #look into adding default openStreetMap map tiles
  addMarkers(lng = 33.9, lat = 67.7, popup = "Afghanistan") %>% 
  addMarkers(lng = 41.1, lat = 20.2, popup = "Albania")
print(m)

m <- leaflet() %>% 
  addTiles()
leaflet()

#write locationi with latitude then longitude

#copied from map
data <- data.frame (mental_disorder = df$column,
                    )
