#Arianna - Maps
# libraries
#install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(reshape2)
# install.packages("ggmap")
library(ggmap)
# install.packages("leaflet")
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
mental_health <- read.csv("../data/prevalence-by-mental-and-substance-use-disorder.csv")
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
averaging_location <- mental_health %>% 
  group_by(Entity, Code) %>% 
  summarize(Scizophrenia = mean(Scizophrenia), 
            `Bipolar Disorders` = mean(`Bipolar Disorders`), 
            `Eating Disorders`= mean(`Eating Disorders`), 
            `Anxiety Disorders`=mean(`Anxiety Disorders`), 
            `Drug Use Disorders`=mean(`Drug Use Disorders`), 
            `Depressive Disorders`=mean(`Depressive Disorders`), 
            `Alcohol Use Disorders`=mean(`Alcohol Use Disorders`)) 
    
    #(Code != "") #filtering down to only countries
View(averaging_location)

#filtering down to continents!! - no data for Antarctica
six_continents_and_all_mh <- averaging_location %>% 
  filter(Entity == "Asia"|Entity == "Africa"|Entity == "North America"|Entity == "Central Latin America"| Entity == "Europe"|Entity == "Oceania") %>% 
  select(-Code)
View(six_continents_and_all_mh)

#only mental health data
mental_h <- six_continents %>% 
  subset(select = -Entity)
View(mental_h)

#average ALL mental disorders 
avg_mental_health <- mental_h %>% 
  rowMeans(na.rm = TRUE, dims = 1) %>% 
print(avg_mental_health)

#creating a locations and mental health data frame
l <- c("Asia", "Africa", "North America", "Central Latin America", "Europe", "Oceania")
ment_stats <- c("1.533835","1.342567", "1.588076", "1.943558", "2.533762", "1.318624")
locations_and_mental <- data.frame(l, ment_stats)
View(locations_and_mental)

#textbook for color adding - data vis chapter
#creating actual map - ggplot2 (world)

world_shape <- map_data("world") %>% 
  left_join(locations_and_mental, by = 'world')
View(world_shape)

ggplot(world_shape) + 
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = locations_and_mental),
    color = "white",  #showing continent outlines
    size = .2 #thinly stroked
  ) + 
  coord_map() + #using a map-based coordinate system
  scale_fill_continuous(low = "White", high = "Red") +
  labs(fill = "Mental Health Illnesses") #+
 # blamk_theme
    


View(world_shape)















#geomapping - put in all longitude and latitude for each continent
locations <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = 34.0, lat = 100.6, popup = "Asia") %>% 
  addMarkers(lng = 20.0, lat = 15.0, popup = "Africa") %>% 
  addMarkers(lng = 54.5, lat = 105.2, popup = "North America") %>% 
  addMarkers(lng = 12.7, lat = 85.6, popup = "Central Latin America") %>% 
  addMarkers(lng = 20.0, lat = 50.0, popup = "Europe") %>% 
  addMarkers(lng = 22.7, lat = 140.0, popup = "Oceania") %>% 
print(locations)

#shade map depending on prevalence of mental issues
  
