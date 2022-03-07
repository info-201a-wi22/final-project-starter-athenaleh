# app_ui 


pick_me <- selectInput(
  "which_d",
  label = "Select Disorder",
  choices = list("Alcohol Use Disorders" = "Alcohol Use Disorders", 
                    "Anxiety Disorders" = "Anxiety Disroders", 
                    "Bipolar Disorders" = "Bipolar Disorders",
                    "Depressive Disorders" = "Depressive Disorders",
                    "Drug Use Disorders" = "Drug Use Disorders",
                    "Eating Disorders" = "Eating Disorders",
                    "Schizophrenia" = "Schizophrenia"),
  selected = "Schizophrenia",
  multiple = TRUE
)


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
              sidebarPanel(),
              mainPanel(plotlyOutput("chart_2"),
              p("")
            ))),

#widget and layout for chart3  - picking the disorder

  tabPanel("Disorders by Regime",
           sidebarLayout(
             sidebarPanel(
               pick_me
             ),
             mainPanel(plotlyOutput("chart_3"),
             p("This bar plot will allow users to select which disorder they would like to investigate")
           )),
   tabPanel("Summary",
              p("")
            ),
   tabPanel("Report Page",
            p(""))
       )
)


