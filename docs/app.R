# app - compiling ui & server together
library(shiny)
library(dplyr)
library(ggplot2)
library(dplyr)
library(plotly)
library(stringr)
library(rsconnect)
library(maps)

mental_health <- read.csv("../data/prevalence-by-mental-and-substance-use-disorder.csv")
government <- read.csv("../data/Government.xls.csv")

# source both ui and server
source("app_server.R")
source("app_ui.R")
source("../source/summary_file.R")

shinyApp(ui = ui, server = server)
