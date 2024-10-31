model_iris <- function(df) {
  model <- lm(sepal.width ~ sepal.length, data = df)
  
  return(model)
}