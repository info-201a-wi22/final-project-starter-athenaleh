
source("./source/chart_1.R")
source("./source/aggregate_file.R")

server <- function(input, output){
  output$chart_1 <- renderPlotly({
    if(input$mental_disorders == "alcohol_use") {
      ggplot(merged_alcohol_use, aes(x = Unemployment, y = alcohol_use_disorders, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Alcohol Use Disorder in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Alcohol Use Disorders")
    } else if(input$mental_disorders == "depressive_disorders") {
      ggplot(merged_depressive_disorders, aes(x = Unemployment, y = depressive_disorders_rates, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Depressive Disorders in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Depressive Disorders")
    } else if(input$mental_disorders == "drug_use") {
      ggplot(merged_drug_use, aes(x = Unemployment, y = drug_use_disorders_rates, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Drug Use Disorders in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Drug Use Disorders")
    } else if(input$mental_disorders == "bd") {
      ggplot(merged_bd, aes(x = Unemployment, y = Bipolar_disorders_rates, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Bipolar Disorders in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Bipolar Disorders")
    } else if(input$mental_disorders == "schizophrenia") {
      ggplot(merged_schizophrenia, aes(x = Unemployment, y = Schizophrenia, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Schizophrenia in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Schizophrenia")
    } else if(input$mental_disorders == "anxiety_disorders") {
      ggplot(merged_anxiety_disorders, aes(x = Unemployment, y = anxiety_disorders_rates, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Anxiety Disorders in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Anxiety Disorders")
    } else if(input$mental_disorders == "ed") {
      ggplot(merged_ed, aes(x = Unemployment, y = eating_disorders_rates, color = Countries)) +
        geom_point() +
        theme_linedraw() +
        theme(legend.position = "none") +
        labs(title = "Eating Disorders in relation to Unemployment Rates",
             x = "Unemployment Rate",
             y = "Eating Disorders")} })

    output$chart_2 <- renderPlotly({
               mental_health_aves <- mental_health_df %>%
                 rename(region = Entity) %>%
                 group_by(region) %>%
                 summarize(Schizophrenia = mean(Schizophrenia), 
                           `Bipolar Disorders` = mean(`Bipolar Disorders`), 
                           `Eating Disorders`= mean(`Eating Disorders`), 
                           `Anxiety Disorders`=mean(`Anxiety Disroders`), 
                           `Drug Use Disorders`=mean(`Drug Use Disorders`), 
                           `Depressive Disorders`=mean(`Depressive Disorders`), 
                           `Alcohol Use Disorders`=mean(`Alcohol Use Disorders`))
               mapdata1 <- map_data("world") #ggplot2
               mapdata <- left_join(mapdata1, mental_health_aves, by="region")
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
  output$chart_3 <- renderPlotly ({
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
    mental_health_gov_long <- pivot_longer(mental_health_gov, "Schizophrenia":"Alcohol Use Disorders", names_to = "disorder", values_to = "prevalence")%>%
      group_by(Regime, disorder)%>%
      summarize(prevalence= mean(prevalence, na.rm=T))
    
    ari_chartlol <- mental_health_gov_long%>%
      filter(disorder %in% input$which_d) %>%
      select(Regime, disorder, prevalence)
    ggplot(ari_chartlol)+
      geom_bar(mapping = aes(x = Regime, y = prevalence, fill = disorder), stat= "identity") +
      labs(title = "Disorders accross different Regimes",
           x = "Type of Regime",
           y = "Prevalence of Mental Disorders") })
  }
