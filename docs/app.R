# app - compiling ui & server together
library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(stringr)
library(rsconnect)

source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)
