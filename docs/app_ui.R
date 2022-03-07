# app_ui 


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
             p("")
<<<<<<< HEAD
           )
      )
=======
           ),
  tabPanel("Report Page",
           p(""))
      )
)
<<<<<<< HEAD


  
=======
  
>>>>>>> c3bcbc948c2605c1413eb772e46ae01e1d71d415
>>>>>>> 8fc47c36afde81678263fb7805a27844628ae1ce
