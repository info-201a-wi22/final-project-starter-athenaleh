# Summary file
source("p02.R")

# Which continent/region has the most mental health problems by the most recent date? 
# (This is where mental health has to be most prioritized)
colnames(mental_health)
highest_region <- mental_health %>%
  filter(Year==max(Year))%>%
  mutate(Average = sum(Scizophrenia, `Bipolar Disorders`, `Eating Disorders`, `Anxiety Disroders`, `Drug Use Disorders`, `Depressive Disorders`, `Alcohol Use Disorders`)/7)%>%
  group_by(Year)%>%
  filter(Average == max(Average))%>%
  pull(Entity)
highest_region
# What is the most prevalent mental health problem among all the countries?
# (We have identified this as the most widespread issue that needs to be addressed globally)

# How has the prevalence of mental health problems developed over time (1990-2019)?

# Which country has the lowest amount of mental health issues?
# ("may be skewed/ biased (see below). If we delve into this country specifically, we can 
# extrapolate lessons on how governments can minimize mental illnesses to better serve their citizens)

# What type of government produces the lowest prevalence of mental illnesses?
# (in the summary paragraph, point out that: "this may data be skewed because authoritative
# countries may have under reported values, or there may be going on that we cannot see")

# What is the correlation between unemployment rates and the prevalence of mental illnesses?
# (calculate a correlation coefficient - like a Pearson's R or p-value)
