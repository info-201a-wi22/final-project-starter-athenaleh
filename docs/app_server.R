# server - put all codes here

# library
library("shiny")
library("plotly")

#INTERACTIVE PAGE 1 - Plotly Select Box Widget
source("../source/chart_1.R")
ggplotly(alc_unemp)
ggplotly(depressive_unemp)
ggplotly(drug_use_unemp)
ggplotly(bipolar_dis_unemp)
ggplotly(schiz_unemp)
ggplotly(anxiety_unemp)
ggplotly(eating_disorder_unemp)

output$chart_1 <- renderPlotly({
  ggplot(merged_alcohol_use) +
    geom_point(aes(x = Unemployment, y = alcohol_use_disorders,
                     color = Countries)) +
    theme_linedraw() +
    theme(legend.position = "none") +
    labs(title = ,
         x = ,
         y = ,)
})

#INTERACTIVE PAGE 2 - ARI - PLOTLY; Widget tbd
library(plotly)
#source("../source/chart_3.R")
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
# government
government_type <- government %>%
  mutate(Year= year, Code= scode, Entity= country, Regime = regime_nr)%>%
  select(Entity, Year, Regime)%>%
  group_by(Entity)%>%
  filter(Year > 1990) %>%
  select(Entity, Year, Regime)
# aggregated data frame ------------------
mental_health_gov <- mental_health_df %>%
  group_by(Entity, Year)%>%
  right_join(government_type, by= c("Entity", "Year")) %>%
  group_by(Regime) %>%
  select(Regime, `Schizophrenia`, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`)
# turning columns into rows
library(tidyr)
mental_health_gov_long <- pivot_longer(mental_health_gov, "Schizophrenia":"Alcohol Use Disorders", names_to = "disorder", values_to = "prevalence")%>%
  group_by(Regime, disorder)%>%
  summarize(prevalence= mean(prevalence, na.rm=T))



# If statement value = chart 1, then, show
# Else value = 2, show chart 2
# Reactive function that renders the chart
# Output - plot the chart in the output - check to see when the pull down changes, is that A or B

server <- function(input, output){
  #outputstuff_ari work 
  output$chart_3 <- renderPlotly ({
    ari_chartlol <- mental_health_gov_long%>%
      filter(disorder %in% input$which_d) %>%
      select(Regime, disorder, prevalence)
    ggplot(ari_chartlol)+
      geom_bar(mapping = aes(x = Regime, y = prevalence, fill = disorder), stat= "identity") +
      labs(title = "Disorders accross different Regimes",
           x = "Type of Regime",
           y = "Prevalence of Mental Disorders")
  })
}
