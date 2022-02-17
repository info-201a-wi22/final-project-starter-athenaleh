# Nooha
# Stacked (different illness prevalence) bar (for each gov type) chart

library(ggplot2)
source(dataframe)
df <- data.frame(x = government_type, y = disorder_prevalence, group = city)
government_type <- c(autocracy, democracy, republic, ...)
condition <- rep(c("depression" , "anxiety" , "bipolar", "schizophrenia"))

# Stacked
ggplot(df, aes(x=government_type, y=disorder_prevalence, fill=condition)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_brewer()

