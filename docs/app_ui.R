# app_ui

source("../source/summary_file.R")
most_prevelant_problem #currently
lowest_region #recently
<<<<<<< HEAD
lowest_prevalence #government currently. 
=======
lowest_prevalence #government currently.

disorder_checkbox <- radioButtons(inputId = 'disorder',
                                   label = 'Mental Illnesses',
                                   choices = c("Bipolar Disorders", "Eating Disorders", "Anxiety Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders"),
                                   selected = "Bipolar Disorders")

>>>>>>> 0c42f309f113d64ab162f8597e747dc297ce73fc
ui <- fluidPage(
  titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
    tabPanel("Introduction",
             p())
  ),
  tabPanel("Interactive Page 1",
           sidebarLayout(
<<<<<<< HEAD
             sidebarPanel(),
=======
             sidebarPanel(selectInput("mental_disorders",
                                      label = "Choose a type of mental disorder",
                                      choices = c("Alcohol Use" = "alcohol_use",
                                                  "Depressive Disorders" = "depressive_disorders",
                                                  "Drug Use Disorder" = "drug_use",
                                                  "Bipolar Disorder" = "bd",
                                                  "Schizophrenia" = "schizophrenia",
                                                  "Eating Disorder" = "ed"),
                                      selected = "alcohol_use")),
>>>>>>> 0c42f309f113d64ab162f8597e747dc297ce73fc
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
             p("In this project, our main goal was to get a better understanding in regards to mental"),
           p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
           p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
           p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
           p("problem. It turns out that the answer to that is", em(most_prevelant_problem), ". We then wanted to know"),
           p("What region currently has the lowest mental health issues. The answer turned out to be", em(lowest_region,),
           p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
           p("issues. It turned out that", em(lowest_prevalence), "have the lowest prevelance. In finding the answers to"),
           p("these questions, we can not only find out what government type and region is thriving mentally, but we can"),
           p("then pull from their success and implement them into regions that are not doing well mentally.")
           )),
  tabPanel("Report Page",
           p(""))
      )
)




  

