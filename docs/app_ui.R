# app_ui
source("../source/summary_file.R")
most_prevelant_problem #currently
lowest_region #recently
lowest_prevalence #government currently.


disorder_checkbox <- radioButtons(inputId = 'disorder',
                                   label = 'Mental Illnesses',
                                   choices = c("Schizophrenia", "Bipolar Disorders", "Eating Disorders", "Anxiety Disorders", "Drug Use Disorders", "Depressive Disorders", "Alcohol Use Disorders"),
                                   selected = "Bipolar Disorders")

pick_me <- selectInput("which_d",
                       label = "Select Disorder",
                       choices = list("Alcohol Use Disorders" = "Alcohol Use Disorders",
                                         "Anxiety Disorders" = "Anxiety Disorders",
                                         "Bipolar Disorders" = "Bipolar Disorders",
                                         "Depressive Disorders" = "Depressive Disorders",
                                         "Drug Use Disorders" = "Drug Use Disorders",
                                         "Eating Disorders" = "Eating Disorders",
                                         "Schizophrenia" = "Schizophrenia"),
                       selected = "Schizophrenia",
                       multiple = TRUE
                     )

library(shiny)
library(plotly)
ui <- fluidPage(
  titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
    tabPanel("Introduction",
             img(src = "intro.png", height = 437, width = 820),
             p("This website will investigate the relationship between government (type of regime), unemployment rate, 
             and mental health disorders.  The purpose of this is to see how these types of factors influence mental 
             health disorders among individuals.  The scale of this applies to the whole world!  Our data covers 
             mental health disorders in different countries so we were able to apply our findings on a global scale.  
             The mental health disorders we’re interested in investigating include schizophrenia, anxiety, bipolar 
             disorder, eating disorder, drug use disorder, depressive disorder, and alcohol use disorder.  The goal 
             of this research is to provide insights which could be utilized by government structures that have a higher 
             prevalence of mental health disorders; we hope they utilize our insights into creating a better environment
             which could reduce the prevalence of mental health disorders.  This research has the ability to create
             actionable items that governments can take to overall lower the prevalence of mental health disorders 
             for the global community.")
    ),
  tabPanel("Unemployment and Mental Disorders Plots",
           sidebarLayout(
             sidebarPanel(selectInput("mental_disorders",
                                      label = "Choose a type of mental disorder",
                                      choices = c("Alcohol Use" = "alcohol_use",
                                                  "Depressive Disorders" = "depressive_disorders",
                                                  "Drug Use Disorder" = "drug_use",
                                                  "Bipolar Disorder" = "bd",
                                                  "Schizophrenia" = "schizophrenia",
                                                  "Eating Disorder" = "ed", 
                                                  "Anxiety Disorder" = "anxiety_disorders"),
                                      selected = "alcohol_use")),
             mainPanel(plotlyOutput("chart_1"),
             p("These scatter plots aim to show the correlation between the unemployment rates and mental disorder"), 
             p("rates of countries around the world in 2019. If the points are scattered"), 
             p("throughout the plot, there are no clear correlation. However, if the points are concentrated in an area,"),
             p("we can deduce that there is some type of correlation between those points. We wanted to see if there was"),
             p("unemployment rate would impact mental disorder rates. We thought that if we could find a relationship,"),
             p("we could think of ways for how the government could provide support for unemployed people with mental disorders.")
           ))),
  tabPanel("Mental Disorder Global Map",
           sidebarLayout(
             sidebarPanel(disorder_checkbox),
             mainPanel(plotlyOutput("chart_2"),
             p("This chart shows the prevalence of mental illnesses around the world. The more red the location, the more prevalent mental illnesses are.
             The data represented through this map are the averages of the mental illnesses that we investigated; schizophrenia, bipolar disorder, etc.
             This is how we chose to represent the significance of mental health around the world. Governments of the locations with the more prevalent
             ratings of mental illnesses should step up and implement actionable items to improve the mental health of their citizens."
           )))),
  tabPanel("Disorders by Regime",
                    sidebarLayout(
                      sidebarPanel(
                        pick_me
                      ),
                      mainPanel(plotlyOutput("chart_3"),
                      p("This chart shows the prevalence of mental health disorders across different regimes.  
                         As you click on different mental health disorders using the widget, you'll be able to see them represented 
                         by different colors on the bar graph.  This will reveal the prevalence of each of the disorders are within 
                        each type of regime.  It's important to notice the significance of each type of mental health disorder as they 
                        appear throughout different regimes and to pik up on any patterns that may arise.")
                    ))),
  tabPanel("Summary",
           img(src = "summary.png", height = 302, width = 820),
           p("In this project, our main goal was to get a better understanding in regards to mental"),
           p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
           p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
           p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
           p("problem. It turns out that the answer to that is", most_prevelant_problem, ". We then wanted to know"),
           p("What region currently has the lowest mental health issues. The answer turned out to be", lowest_region,),
           p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
           p("issues. It turned out that both", lowest_prevalence_mil, "and", lowest_prevalence_mul, "have the lowest prevelance."),
           p("In finding the answers to these questions, we can not only find out what government type and region is thriving"),
           p("mentally, but we can then pull from their success and implement them into regions that are not doing well mentally.")),
  tabPanel("Report Page",
           p("hello")
  )))


  

