# app_ui 
disorder_checkbox <- radioButtons(inputId = 'disorder',
                                   label = 'Mental Illnesses',
                                   choices = c("Bipolar Disorders", "Eating Disorders", "Anxiety Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders"),
                                   selected = "Bipolar Disorders")

# hello 
ui <- fluidPage(
  titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
    tabPanel("Introduction",
             p())
  ),
  tabPanel("Interactive Page 1",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(plotlyOutput("chart_1"),
             p("")
           ))),
  tabPanel("Interactive Page 2",
           sidebarLayout(
             sidebarPanel(disorder_checkbox),
             mainPanel(plotlyOutput("chart_2"),
             p("This chart shows the prevalence of mental illnesses around the world. The more red the location, the more prevalent mental illnesses are. 
             The data represented through this map are the averages of the mental illnesses that we investigated; schizophrenia, bipolar disorder, etc. 
             This is how we chose to represent the significance of mental health around the world. Governments of the locations with the more prevalent 
             ratings of mental illnesses should step up and implement actionable items to improve the mental health of their citizens."
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
)
  