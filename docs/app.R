# app - compiling ui & server together
library("shiny")
library("dplyr")
library("ggplot2")
library("dplyr")
library("plotly")
library("stringr")
library("rsconnect")
library("maps")

# source both ui and server
source("app_server.R")
source("app_ui.R")
<<<<<<< HEAD
=======


shinyApp(ui = ui, server = server)
>>>>>>> 8bcc5ad5a90c78366b7506218d7dc03c7cd5fa19

shinyApp(ui = ui, server = server)