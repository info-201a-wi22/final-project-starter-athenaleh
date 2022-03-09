# app - compiling ui & server together
library(shiny)
library(dplyr)
library(ggplot2)
library(dplyr)
library(plotly)
library(stringr)
library(rsconnect)
library(maps)
library(reshape2)
library(tidyr)
library(tidyverse)

# source both ui and server
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)

