# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
data_access_test <- function (name="World!") {
  t <- paste0("Hello: ", name)
  return(t)
}