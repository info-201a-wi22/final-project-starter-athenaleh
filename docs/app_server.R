# server - put all codes here

# library
library("shiny")
library("plotly")
library("ggplot2")

source("../source/chart_1.R")

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
             y = "DDrug Use Disorders") 
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
             y = "Eating Disorders")} 
  })
  
}
