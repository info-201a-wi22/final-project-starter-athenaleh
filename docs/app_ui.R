# app_ui 
source("../source/summary_file.R")
most_prevelant_problem #currently
lowest_region #recently
lowest_prevalence #government currently. 
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
  tabPanel("Interactive Page 3",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(plotlyOutput("chart_3"),
             p("")
           )),
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




  

