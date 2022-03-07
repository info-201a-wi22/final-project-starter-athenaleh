# # server - put all codes here
# 
# # library
# library("shiny")
# library("plotly")
# 
# # INTERACTIVE PAGE 1 - Plotly Select Box Widget
# source("../source/Chart_1_Athena.R")
# ggplotly(alc_unemp)
# ggplotly(depressive_unemp)
# ggplotly(drug_use_unemp)
# ggplotly(bipolar_dis_unemp)
# ggplotly(schiz_unemp)
# ggplotly(anxiety_unemp)
# ggplotly(eating_disorder_unemp)

# If statement value = chart 1, then, show
# Else value = 2, show chart 2
# Reactive function that renders the chart
# Output - plot the chart in the output - check to see when the pull down changes, is that A or B

server <- function(input, output){
  output$chart_2 <- renderPlotly({

    mental_health_df <- mental_health %>%
      rename(region = Entity) %>%
      group_by(region)%>%
      mutate("Schizophrenia" = mean(Prevalence...Schizophrenia...Sex..Both...Age..Age.standardized..Percent.), 
             "Eating Disorders"= mean(Prevalence...Eating.disorders...Sex..Both...Age..Age.standardized..Percent.), 
             "Anxiety Disorders" = mean(Prevalence...Anxiety.disorders...Sex..Both...Age..Age.standardized..Percent.),
             "Bipolar Disorders" = mean(Prevalence...Bipolar.disorder...Sex..Both...Age..Age.standardized..Percent.),
             "Drug Use Disorders" = mean(Prevalence...Drug.use.disorders...Sex..Both...Age..Age.standardized..Percent.),
             "Depressive Disorders" = mean(Prevalence...Depressive.disorders...Sex..Both...Age..Age.standardized..Percent.),
             "Alcohol Use Disorders" = mean(Prevalence...Alcohol.use.disorders...Sex..Both...Age..Age.standardized..Percent.))%>%
      select(region, Year, "Schizophrenia", "Eating Disorders", "Anxiety Disorders", "Bipolar Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders")%>%
      filter(Year >= 1991) %>%
      filter(Year <= 2012)
    mapdata1 <- map_data("world") #ggplot2
    mapdata <- left_join(mapdata1, mental_health_df, by="region")
    mapdata0 <- as.data.frame(mapdata)
    `Average prevalence rate` <- mapdata0[, input$disorder] 
    #creating basic map
    map1 <- ggplot(mapdata0, aes( x = long, y = lat, group = group)) +
      geom_polygon(aes(fill = `Average prevalence rate`), color = "black") +
      scale_fill_gradient(low = "yellow", high = "red", name = "Mental Illness Rate", label = scales::comma) +
      theme(axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks = element_blank(), 
            axis.title.y = element_blank(),
            axis.title.x = element_blank(),
            rect = element_blank())+
      ggtitle("Prevalence of Mental Illnesses Around the World")
    return(map1)
  })
}
