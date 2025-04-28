#' Example function to model iris dataset
#'
#' @param df A data frame containing the iris dataset
#'
#' @returns A linear model object
#' 
model_iris <- function(df) {
  model <- lm(sepal.width ~ sepal.length, data = df)
  
  return(model)
}