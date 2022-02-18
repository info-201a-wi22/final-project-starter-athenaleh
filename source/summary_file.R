# Summary file
source("p02.R")

# Which continent/region has the most mental health problems by the most recent date? -----
# (This is where mental health has to be most prioritized)

highest_region <- aggregate_list%>%
  filter(Year==max(Year))%>%
  group_by(Year)%>%
  filter(`Avg Mental Health Percentage`== max(`Avg Mental Health Percentage`))%>%
  pull(Entity.x)
  
highest_region

# What is the most prevalent mental health problem currently?-----
# (We have identified this as the most widespread issue that needs to be addressed globally)

most_prevelant_problem <- mental_health %>%
  filter(Year == max(Year))%>%
  group_by(Year)%>%
  summarize(scizophrenia_avg = mean(Scizophrenia), bipolar_avg = mean(`Bipolar Disorders`), anxiety_avg = mean(`Anxiety Disroders`), drug_avg = mean(`Drug Use Disorders`), depressive_avg = mean(`Depressive Disorders`), alcohol_avg = mean(`Alcohol Use Disorders`))%>%
  select(scizophrenia_avg, bipolar_avg, anxiety_avg, drug_avg, depressive_avg, alcohol_avg)
 most_prevelant_problem 
 
 # What is the most prevalent mental health problem in the first recorded time?-----
 
 
# Which country has the lowest amount of mental health issues on average? ----
# ("may be skewed/ biased (see below). If we delve into this country specifically, we can 
# extrapolate lessons on how governments can minimize mental illnesses to better serve their citizens)
country_lowest<- aggregate_list%>%
  filter(Year==max(Year))%>%
  group_by(Year)%>%
  filter(`Avg Mental Health Percentage`== min(`Avg Mental Health Percentage`))%>%
  pull(Entity.x)
country_lowest
  
# What type of government produces the lowest prevalence of mental illnesses?-----
# (in the summary paragraph, point out that: "this may data be skewed because authoritative
# countries may have under reported values, or there may be going on that we cannot see")
lowest_prevalence <- mental_health_gov %>%
  filter(`Regime Mental Health Avg` == min(`Regime Mental Health Avg`))%>%
  pull(Regime)
lowest_prevalence
# What is the correlation between unemployment rates and the prevalence of mental illnesses? ----
# (calculate a correlation coefficient - like a Pearson's R or p-value)
