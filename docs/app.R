# app - compiling ui & server together
library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(stringr)
library(rsconnect)
shinyApp(ui = ui, server = server)
