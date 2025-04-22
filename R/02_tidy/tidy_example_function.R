tidy_iris <- function(df) {
  colnames(df) <- tolower(colnames(df))
  
  return(df)
}