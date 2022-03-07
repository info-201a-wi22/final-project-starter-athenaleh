# server - put all codes here

# library
library("shiny")
library("plotly")

# INTERACTIVE PAGE 1 - Plotly Select Box Widget
source("../source/Chart_1_Athena.R")
ggplotly(alc_unemp)
ggplotly(depressive_unemp)
ggplotly(drug_use_unemp)
ggplotly(bipolar_dis_unemp)
ggplotly(schiz_unemp)
ggplotly(anxiety_unemp)
ggplotly(eating_disorder_unemp)

# If statement value = chart 1, then, show
# Else value = 2, show chart 2
# Reactive function that renders the chart
# Output - plot the chart in the output - check to see when the pull down changes, is that A or B

server <- function(input, output){

}
