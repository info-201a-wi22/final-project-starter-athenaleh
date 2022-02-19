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
         "Anxiety Disorders" = Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.,
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
  group_by(Entity) %>% 
  summarize(Scizophrenia = mean(Scizophrenia), 
            `Bipolar Disorders` = mean(`Bipolar Disorders`), 
            `Eating Disorders`= mean(`Eating Disorders`), 
            `Anxiety Disorders`=mean(`Anxiety Disorders`), 
            `Drug Use Disorders`=mean(`Drug Use Disorders`), 
            `Depressive Disorders`=mean(`Depressive Disorders`), 
            `Alcohol Use Disorders`=mean(`Alcohol Use Disorders`)) 
    
    (Code != "") #filtering down to only countries
View(averaging_location)

#only mental health data
mental_h <- averaging_location %>% 
  subset(select = -Entity)
View(mental_h)
#
#average ALL mental disorders 
avg_mental <- rowMeans(mental_h, na.rm = FALSE, dims = 1)
print(avg_mental)

l_m <- data.frame(averaging_location, avg_mental) %>% 
  subset(select = -Scizophrenia) %>% 
  subset(select = -Bipolar.Disorders) %>% 
  subset(select = -Eating.Disorders) %>% 
  subset(select = -Anxiety.Disorders) %>% 
  subset(select = -Drug.Use.Disorders) %>% 
  subset(select = -Depressive.Disorders) %>% 
  subset(select = -Alcohol.Use.Disorders) %>% 
  rename(region = Entity)

#creating actual map - ggplot2 (world)
#step1 - joining map data to mental health data
mapdata <- map_data("world") #ggplot2
View(mapdata)
mapdata <- left_join(mapdata, l_m, by="region")
View(mapdata)

#step2 - cleaning up mapdata
mapdata1 <-mapdata %>% filter(!is.na(mapdata$avg_mental))
View(mapdata1)

#creating basic map
map1 <- ggplot(mapdata1, aes( x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = avg_mental), color = "black")
map1

#adding cool gradient to basic map - more advanced map
map2 <- map1 + scale_fill_gradient(name = "avg mental health disorders", low = "yellow", high = "red", na.value = "grey50") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        rect = element_blank())
map2
