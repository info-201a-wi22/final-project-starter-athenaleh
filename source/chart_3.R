# Nooha
# Stacked (different illness prevalence) bar (for each gov type) chart

library(ggplot2)
source(dataframe)

df <- data.frame(x = government_type, y = disorder_prevalence, group = disorder)
government_type <- c(autocracy, democracy, republic, ...)
disorder <- rep(c("depression" , "anxiety" , "bipolar", "schizophrenia"))

# Stacked
ggplot(df, aes(x=government_type, y=disorder_prevalence, fill=disorder)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_brewer()

