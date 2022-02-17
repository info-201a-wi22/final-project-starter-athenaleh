# libraries
library(ggplot2)

# source https://r-charts.com/correlation/scatter-plot-group-ggplot2/

# set working directory
setwd("~/Documents/Info201Code/Project/final-project-starter-athenaleh/docs")

# data access
source("data_access.R")

# use the data
mental_health <- read_mental_health_dataset()
unemployment_rate <- read_unemployment_rate_dataset()
government_rate <- read_government_dataset

# countries: USA (democracy), Brazil (military), Pakistan (multiparty), 
# Morocco (monarchy), Vietnam (single party)

# data simulation for USA 
# x unemployment rate 
# y rates of different disorders  
x <- 
y <- 

# data frame
data <- data.frame(x, y, group = disorders)

# scatter plot by group 
ggplot(data, aes(x = x, y = x, color = disorders)) +
  geom_point() 

# change look of points: geom_point(shape = number, size = number)

# change shape per group 
# ggplot(data, aes(x = x, y = y, color = group, shape = group))

# legend customization
# guides(color = guide_legend(title = "Title"))
# custom key labels -- scale_color_discrete(labels = c("G1", "G2", "G3"))