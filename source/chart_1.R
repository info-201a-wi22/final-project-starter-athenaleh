# libraries
library(ggplot2)

# data simulation
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