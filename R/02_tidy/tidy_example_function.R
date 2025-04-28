#' Put the dataset column names to lowercase
#'
#' @description Describe the function here
#' @param df A data frame
#'
#' @returns A data frame with all column names in lowercase
#' 
tidy_iris <- function(df) {
  colnames(df) <- tolower(colnames(df))
  
  return(df)
}