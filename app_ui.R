# app_ui
source("./source/summary_file.R")

disorder_checkbox <- radioButtons(inputId = 'disorder',
                                  label = 'Mental Illnesses',
                                  choices = c("Schizophrenia", "Bipolar Disorders",
                                              "Eating Disorders", "Anxiety Disorders",
                                              "Drug Use Disorders",
                                              "Depressive Disorders",
                                              "Alcohol Use Disorders"),
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
                       multiple = TRUE)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                    @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=DM+Serif+Text&display=swap');
                    body{
                      background-color: white;
                      color: black;
                    }
                    h2 {
                    font-family: 'Abril Fatface', display;
                    font: 150px;
                    }
                    .shiny-input-container {
                    color: #C06C84;
                    }
                    p{color: #6C5B7B;
                    font-size: 16px;
                    font-weight: 500}
                    h4 {
                    color: #355C7D;
                    font: 30px;
                    font-weight: 800;
                    }
                    h3 {
                    color: black;
                    font-weight: 600;
                    font: 32px;
                    font-family: 'Dm Serif Text';
                    }"
  ))),
  titlePanel("Mental Health Issues Across the World"),
  tabsetPanel(
    tabPanel("Introduction",
    sidebarLayout(
      sidebarPanel(
        img(src = "intro.png", height = 200, width = 300),
      ),
    mainPanel(
      h1("Introduction"),
             p("This website will investigate the relationship between government (type of regime), unemployment rate,
             and mental health disorders.  The purpose of this is to see how these types of factors influence mental
             health disorders among individuals.  The scale of this applies to the whole world!  Our data covers
             mental health disorders in different countries so we were able to apply our findings on a global scale.
             The mental health disorders were interested in investigating include schizophrenia, anxiety, bipolar
             disorder, eating disorder, drug use disorder, depressive disorder, and alcohol use disorder.  The goal
             of this research is to provide insights which could be utilized by government structures that have a higher
             prevalence of mental health disorders; we hope they utilize our insights into creating a better environment
             which could reduce the prevalence of mental health disorders.  This research has the ability to create
             actionable items that governments can take to overall lower the prevalence of mental health disorders
             for the global community.")
    ))),
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
                         p("These scatter plots aim to show the correlation between the unemployment rates and mental disorder
             rates of countries around the world in 2019. If the points are scattered
             throughout the plot, there are no clear correlation. However, if the points are concentrated in an area,
             we can deduce that there is some type of correlation between those points. We wanted to see if there was
             unemployment rate would impact mental disorder rates. We thought that if we could find a relationship,
             we could think of ways for how the government could provide support for unemployed people with mental disorders.")
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
                        appear throughout different regimes and to pick up on any patterns that may arise.")
               ))),
    tabPanel("Summary",
             sidebarLayout(
               sidebarPanel(
                 img(src = "summary.png", height = 110, width = 300)
               ),
             mainPanel(
               h1("Summary"),
             p("In this project, our main goal was to get a better understanding in regards to mental"),
            p("health. In doing so we hoped to get the tools to provide regions with poor mental health"),
            p("to better the lives of their people. To do so, we needed to answer a few questions that would"),
            p("help in doing so. The first question we asked was what is the current most prevelant mental health"),
            p("problem. It turns out that the answer to that is", most_prevelant_problem, ". We then wanted to know"),
            p("What region currently has the lowest mental health issues. The answer turned out to be", lowest_region,),
            p("Finally, we also wanted to know which government type(s) has the lowest prevelance of mental health"),
            p("issues. It turned out that both", lowest_prevalence_mil, "and", lowest_prevalence_mul, "have the lowest prevelance."),
            p("In finding the answers to these questions, we can not only find out what government type and region is thriving"),
            p("mentally, but we can then pull from their success and implement them into regions that are not doing well mentally.")
    ))),
    tabPanel("Report Page",
             h3("Ron Levy, Athena Le, Arianna Khan, Nooha Mohammed"),
             p("March 9, 2022"),
             p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
             h4("Abstract"),
             p("Our main question for this project is to see the role that mental disorders play in our world. We can get a better understanding of how mental
             health plays into peoples lives since it recently became acknowledged as a serious problem. To address this concern, we will observe the rates
             of mental disorders per country/region and compare it with the types of government and unemployment rates."),
             h4("Keywords"),
             p("mental disorders, global health, countries, regimes, unemployment"),
             h4("1.0 Introduction"),
             p("In this project, our group will be focusing on the prevalence of mental health disorders in different countries. The exact mental health
             disorders were interested in analyzing include schizophrenia, anxiety, bipolar disorder, eating disorder, drug use disorder, depressive
             disorder, and alcohol use disorder. We hope that in doing this research, clear insight is provided regarding steps that countries with
             poor mental health could take which would improve the quality of life and ultimately reduce mental health disorders for the global community."),
             h4("2.0 Design Situation"),
             p("Project framing: The topic of concern we are focusing on is mental health disorders around the world. More specifically, we want to investigate if
             mental health disorders are related to government type and unemployment. For example, we want to see the prevalence of mental health disorders on a
             global scale and dig into whether governments are exacerbating those issues in terms of social resources for the people in that nation. Key elements
             include population health, global trends, and social structure in relation to the percentage of mental illnesses. Human values: The human values
             connected to our topic of concern are power and awareness. The values originate from compassion as our project aims to find different correlations to
             improve global mental health disorders. We also based our definition of power from Data Feminism into our human value. Power is an important value
             because having the power to be influential can help spread awareness. We are also making sure that we spread awareness of factors that affect mental
             health issues and well-being: environmental factors, social and economic circumstances, and individual attributes and behaviors. Stakeholders The direct
             stakeholders are government officials, physicians (i.e. psychiatrists and psychologists) and organizations (i.e. World Health Organization). As direct
             stakeholders, they have the power to influence and implement change to provide mental health resources for the people. Physicians are able to have a
             better understanding of how they can be the source of assistance for their patients. Organizations can use this data to provide assistance to government
             officials. Indirect stakeholders are citizens because they may not know that this data is being collected and used to analyze different mental health
             issues globally. Harms and benefits: The potential benefits are mental health issues are improved for the indirect stakeholders and the government can
             have an idea of ways that they can implement change to improve the well-being of their citizens. The potential harm is that there is a wide difference
             between cultures so some implementations may not work for different cultures. While we can avoid the potential harm, we might not be able to avoid the
             unanticipated consequences. If the government has implemented some type of change, the people could react negatively which could cause an increase in
             mental health issues"),
             h4("3.0 Research Questions"),
             p("1: Which continent/region has the most mental health problems by the most recent date? We will answer this by grouping each of the regions together.
             We will then filter out the most recent date. Afterwards, we will take the average of all of the mental health issues and pull the Region that has the
             highest percentage. 2: Which country has the lowest percentage of mental health issues currently? We will do the same thing as the first question, but instead of finding the largest percentage, we would find the
             smallest. 3: What is the most prevalent mental health problem currently? We would take the average of each mental health column. Whichever
             has the highest average is the most common mental health issue that can be seen all around the world. 4: What is the most prevalent mental health problem in the first recorded time? We would approach this question by doing the same thing as
             question two but instead of max, do min. Having these two values will act as a good indicator as to how metal health issues have changed and evolved
             over time. 5: What type of government produces the lowest prevalence of mental illnesses? We will approach this question by grouping the Regimes and
             take the average of each mental illness in each regime. We will then filter out the lowest average and pull the regime that reflects that value.
             6: How does unemployment rates correlate to mental health issues? We approached this question by takin the average of all the mental health issues.
             Then, we merged that dataset with the unemployment dataset. After that, we took the highest unemploymen rate, lowest unemployment rate, lowest mental
             helath rate and the highest mental health rate to see if we can find a clear correlation between those numbers."),
             h4("4.0 The Dataset"),
             p("Data Provenance: The dataset that we chose to focus on is called “prevalence-by-mental-and-subset-use-disorder. We found this dataset from Our World
             in Data which is an organization sponsored by the University of Oxford. In this dataset country populations and their percentage of different mental
             health issues are represented. It contains records from every country, at least those formally recognized by the site, and some are combined into areas
             such as the Middle east and North Africa. Each group has data from each year between 1990 to 2019 on the percentage of multiple mental illnesses;
             more specifically, schizophrenia, bipolar disorder, eating disorders, drug use, depression, and alcohol use. It contains 8221 records, has a range of
             40 years for each country, and has 10 columns that represent different mental health issues that we will be focusing on. We obtained the data from Our
             World in Data site which provides accessible data to the general public without requirements on inclusion in government or certain research institutions.
             This dataset combines data collected by the Global Health Data Exchange, which is owned by the University of Washington. Much of the data in the Global
             Health Data Exchange is received from studies done by the IPUMS, ICPSR, and the World Bank, credible organizations where data is collected in order to
             create a global understanding for institutional change. It is held secure and cannot be modified and re-entered into the databases. The data we are using
             comes from a string of credible and trustworthy sources of NGOs and research universities where data collection is not for monetary goals, however one
             limitation in the provenance is that we cannot see the specific collection process and cannot ensure it was accurately or ethically produced, beyond the
             credibility of the organizations. Our second dataset to supplement our analysis is. Autocracies of the World Dataset from the Freeman Spogli Institute
             for International Studies within Stanford University which creates a measure of credibility. It classifies the regime types of governments from 1950-2012
             into democracy, multiparty, single party, military, and monarchy. The dataset includes rows for every year for countries with populations of 500,000 or
             greater and has 8,629 observations. Along with the regime classification column, it includes many columns on country classifications like continent, code,
             regime change, and leadership. Lastly, we used a third dataset which contains data regarding unemployment rate around the world. This dataset has variables
             which describe the Entity, Code, Year, and Unemployment, which was calculated by using the total percent of labor force and modeling the international labor
             organization estimate."),
             h4("5.0 Findings"),
             p("Our main point of questioning for this project was to see the role that mental disorders play in our world to get a better understanding of how mental
             health plays into peoples lives. Looking at all the charts created, we can identify how mental illnesses are grouped across countries. "),
             p("1: Which region has the most mental health problems by the most recent date?  Portugal is the country with the highest mental illness prevalence rate."),
             p("2: Which country has the lowest percentage of mental health issues currently? Vietnam is the country with the lowest average mental health issues. Looking
             at the highest and lowest prevalence rates can be a reflection of countries that are more or less open to diagnoses."),
             p("3: What is the most prevalent mental health problem currently?  Anxiety"),
             p("4: What is the most prevalent mental health problem in the first recorded time? The most prevalent mental health problem in the first recorded year was
             also anxiety, so this is a consistent problem across time."),
             p("5: What type of government produces the lowest prevalence of mental illnesses? We found that Military and Multi- Party government structures produced the
             lowest prevalence of mental illnesses. A military government may reduce the stress and confusion of participating in government, but a multi-party government
             would have the opposite effect by giving citizens greater involvement. These may be the ideal governmental structure to reduce mental illnesses, but this again
             could also be a reflection of collection practices and availability of diagnoses."),
             p("6: How do unemployment rates correlate to mental health issues? By looking at the Unemployment and Mental Disorder plots, we have found that there is not a
           clear correlation, or at least a linear, correlation between unemployment and mental disorders. Most unemployment rates and illness prevalence are clustered in the
           same region by the origin, showing that countries with low unemployment rates (under 10%) also had low disorder rates (under 1%) and drug use had the tightest cluster.
           Alcohol and anxiety disorders had the least correlation with unemployment."),
              h4("6.0 Discussion"),
             p("There are many implications to our findings.  One of the most interesting of our findings is that the military and multi-party government structures tend to have
             the least mental health disorders in that population.  This suggests that existing government structures in place and people of authority should consider applying
             some of the traits of military and multi-party governments to their own.  Its very important to pay close attention to the basis for success of a government and
             so these key findings are important in deciding which strategies other governments can pull from them. However, it may also be a reflection of collection bias or
             availability of diagnoses."),
             p("Another implication of these findings include the fact that there were not many correlations between mental health and unemployment rate.  This means that the
             unemployment rate of a country may not have a high impact on an individual's mental health.  This may be a good thing because its difficult to control the unemployment
             rate, which means governments can turn to other resources in order to improve citizens' mental health.  Government's should continue looking into different ways to
             improve mental health."),
             p("One other thing that governments should consider is the fact that the most prevalent mental health disorder in general is anxiety. This means that there should be
             action taken to reduce anxiety in individuals.  This can be done through promoting certain things to help with reducing anxiety.  For example, taking a break from work,
             limiting alcohol and caffeine, getting enough sleep, exercising daily, and taking deep breaths.  These tips and tricks can be spearheaded into government  mantras or
             used frequently to help and guide individuals.  Its important for governments to take some sort of action in order to attempt to reduce feeling anxious among its
             citizens."),
             p("Overall, government structure must change to reflect the peoples needs.  Mental health disorders are a fundamental and basic stepping stone to cross in order to achieve
             a more successful economy and overall country.  If this is the basis of our society, much attention needs to be brought to how to achieve the best and most optimal
             government structure which supports that level of mental health.  Governments must take action to implement more and advanced mental health care facilities and resources
             for the greater good of the people."),
             h4("7.0 Conclusion"),
             p("From this project, we can conclude that there is no clear correlation between the government and unemployment rates with the mental disorders that we focused on
           (schizophrenia, eating disorders, drug use disorders, depressive disorders, bipolar disorders, anxiety disorders and alcohol use disorders). Through the data that
           we wrangled, the two government types that had the lowest prevalence were opposite. Overall, it is hard to find a clear correlation of mental disorders with other
           factors on this large of a scale because everyone is different. Looking forward; as mental health is less stigmatized on a global scale, data can be collected more
           accurately and researchers will be able to develop a better understanding of these posed questions. "),
             h4("References"),
             p("Klein, Catherine DIgnazio and Lauren.1. The Power Chapter · Data Feminism. Data Feminism, PubPub, 16 Mar. 2020,
           <https://data-feminism.mitpress.mit.edu/pub/vi8obxh7/release/4>. Magaloni, Beatriz. Autocracies of the World Dataset.
           Freeman Spogli Institute for International Studies, Stanford, <https://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset>
           Prevalence by Mental and Substance Use Disorder. Our World in Data, <https://ourworldindata.org/grapher/prevalence-by-mental-and-substance-use-disorder?country=~OWID_WRL>.
           Psychometric Origins of Depression - Journals.sagepub.com. <https://journals.sagepub.com/doi/abs/10.1177/09526951211009085> Unemployment Rate. Our World in Data,
           <https://ourworldindata.org/grapher/unemployment-rate?tab=chart&country=~USA>. <https://data-feminism.mitpress.mit.edu/pub/vi8obxh7/release/4>. Magaloni, Beatriz. Autocracies of the World Dataset."),
          
    )
  )
)
