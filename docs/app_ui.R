# app_ui

source("../source/summary_file.R")
most_prevelant_problem #currently
lowest_region #recently
lowest_prevalence #government currently.


disorder_checkbox <- radioButtons(inputId = 'disorder',
                                   label = 'Mental Illnesses',
                                   choices = c("Bipolar Disorders", "Eating Disorders", "Anxiety Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders"),
                                   selected = "Bipolar Disorders")

pick_me <- selectInput("which_d",
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

library(shiny)
ui <- fluidPage(
  # titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
<<<<<<< HEAD
  #   tabPanel("Introduction",
  #            p())
  # ),
  # tabPanel("Interactive Page 1",
  #          sidebarLayout(
  #            sidebarPanel(selectInput("mental_disorders",
  #                                     label = "Choose a type of mental disorder",
  #                                     choices = c("Alcohol Use" = "alcohol_use",
  #                                                 "Depressive Disorders" = "depressive_disorders",
  #                                                 "Drug Use Disorder" = "drug_use",
  #                                                 "Bipolar Disorder" = "bd",
  #                                                 "Schizophrenia" = "schizophrenia",
  #                                                 "Eating Disorder" = "ed"),
  #                                     selected = "alcohol_use")),
  #            mainPanel(plotlyOutput("chart_1"),
  #            p("")
  #          ))),
  # tabPanel("Interactive Page 2",
  #          sidebarLayout(
  #            sidebarPanel(disorder_checkbox),
  #            mainPanel(plotlyOutput("chart_2"),
  #            p("This chart shows the prevalence of mental illnesses around the world. The more red the location, the more prevalent mental illnesses are.
  #            The data represented through this map are the averages of the mental illnesses that we investigated; schizophrenia, bipolar disorder, etc.
  #            This is how we chose to represent the significance of mental health around the world. Governments of the locations with the more prevalent
  #            ratings of mental illnesses should step up and implement actionable items to improve the mental health of their citizens."
  #          ))),
  # tabPanel("Interactive Page 3",
  #          sidebarLayout(
  #            sidebarPanel(),
  #            mainPanel(plotlyOutput("chart_3"),
  #            p("")
  #          ))),
  tabPanel("Summary",
           p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
           p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
           p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
           p("problem. It turns out that the answer to that is", most_prevelant_problem, ". We then wanted to know"),
           p("What region currently has the lowest mental health issues. The answer turned out to be", lowest_region,),
           p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
           p("issues. It turned out that have the lowest prevelance. In finding the answers to"),
           p("these questions, we can not only find out what government type and region is thriving mentally, but we can"),
           p("then pull from their success and implement them into regions that are not doing well mentally.")
  )
  )
)
=======
    tabPanel("Introduction",
             p()),
  tabPanel("Unemployment and Mental Disorders Plots",
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
             p("These scatter plots aim to show the correlation between the unemployment rates and mental disorder 
             rates of countries around the world in 2019. If the points are scattered 
             throughout the plot, there are no clear correlation. 
              However, if the points are concentrated in an area, we can deduce that there is some type of 
              correlation between those points. We wanted to see if there was unemployment rate would impact 
              mental disorder rates. We thought that if we could find a relationship, we could think of 
              ways for how the government could provide support for 
              unemployed people with mental disorders.")
           ))),
  tabPanel("Mental Illness Prevalence Map",
           sidebarLayout(
             sidebarPanel(disorder_checkbox),
             mainPanel(plotlyOutput("chart_2"),
             p("This chart shows the prevalence of mental illnesses around the world. The more red the location, the more prevalent mental illnesses are.
             The data represented through this map are the averages of the mental illnesses that we investigated; schizophrenia, bipolar disorder, etc.
             This is how we chose to represent the significance of mental health around the world. Governments of the locations with the more prevalent
             ratings of mental illnesses should step up and implement actionable items to improve the mental health of their citizens."
           ))),
<<<<<<< HEAD
  tabPanel("Interactive Page 3",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(plotlyOutput("chart_3"),
             p("")
           )))),
  tabPanel("Summary",
             p("In this project, our main goal was to get a better understanding in regards to mental"),
           p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
           p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
           p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
           p("problem. It turns out that the answer to that is", most_prevelant_problem, ". We then wanted to know"),
           p("What region currently has the lowest mental health issues. The answer turned out to be"), lowest_region,
           p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
           p("issues. It turned out that", lowest_prevalence, "have the lowest prevelance. In finding the answers to"),
           p("these questions, we can not only find out what government type and region is thriving mentally, but we can"),
           p("then pull from their success and implement them into regions that are not doing well mentally.")
=======
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
  # tabPanel("Summary",
  #            p("In this project, our main goal was to get a better understanding in regards to mental"),
  #          p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
  #          p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
  #          p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
  #          p("problem. It turns out that the answer to that is", most_prevelant_problem, ". We then wanted to know"),
  #          p("What region currently has the lowest mental health issues. The answer turned out to be"), lowest_region,
  #          p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
  #          p("issues. It turned out that", lowest_prevalence, "have the lowest prevelance. In finding the answers to"),
  #          p("these questions, we can not only find out what government type and region is thriving mentally, but we can"),
  #          p("then pull from their success and implement them into regions that are not doing well mentally.")
>>>>>>> 1d5612a32f7be47432089d69e3047b8db0ad02f3
  #          )),
  tabPanel("Report Page",
           p(""))
      ))

<<<<<<< HEAD
=======


#            )),
#   tabPanel("Report Page",
#            p(""))
#       )
# )






>>>>>>> refs/remotes/origin/main
>>>>>>> 1d5612a32f7be47432089d69e3047b8db0ad02f3
