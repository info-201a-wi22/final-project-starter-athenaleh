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

# If statement value = chart 1, then, show
# Else value = 2, show chart 2
# Reactive function that renders the chart
# Output - plot the chart in the output - check to see when the pull down changes, is that A or B

<<<<<<< HEAD

=======
>>>>>>> 4c31219ce0c67dfe747013a95330e29e5a43fe74
server <- function(input, output){

}
<<<<<<< HEAD

=======
>>>>>>> 4c31219ce0c67dfe747013a95330e29e5a43fe74
