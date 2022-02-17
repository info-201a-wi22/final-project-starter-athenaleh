# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
read_mental_health_dataset <- function () {
  path_to_file <- "../data/prevalence-by-mental-and-substance-use-disorder.csv"
  dataframe <- read.csv(path_to_file)
  return(dataframe)
}

read_unemployment_rate_dataset <- function () {
  path_to_file <- "../data/unemployment-rate.csv"
  dataframe <- read.csv(path_to_file)
  return(dataframe)
}

read_government_dataset <- function () {
  path_to_file <- "../data/Government.csv"
  dataframe <- read.csv(path_to_file)
  return(dataframe)
}

