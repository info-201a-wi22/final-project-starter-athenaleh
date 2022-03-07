# app_ui 
ui <- fluidPage(
  titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
    tabPanel("Introduction",
             p())
  ),
  tabPanel("Interactive Page 1",
           sidebarLayout(
             sidebarPanel(selectInput("mental_disorders", 
                                      label = "Choose a type of mental disorder", 
                                      choices = c("Alcohol Use" = "alcohol_use", 
                                                  "Depressive Disorders" = "depressive_disorders", 
                                                  "Drug Use Disorder" = "drug_use", 
                                                  "Bipolar Disorder" = "bd", 
                                                  "Schizophrenia" = "schizophrenia", 
                                                  "Eating Disorder" = "ed"),
                                      selected = "alcohol_use")),
             mainPanel(plotlyOutput("chart_1"),
             p("")
           ))),
  tabPanel("Interactive Page 2",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(plotlyOutput("chart_2"),
             p("")
           ))),
  tabPanel("Interactive Page 3",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(plotlyOutput("chart_3"),
             p("")
           ))),
  tabPanel("Summary",
             p("")
           ),
  tabPanel("Report Page",
           p(""))
      )


