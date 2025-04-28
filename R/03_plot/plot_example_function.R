#' Plot Example Function
#'
#' @param df A data frame containing the iris dataset 
#'
#' @returns A ggplot object
#' 
plot_iris <- function(df) {
  p <- 
    df |> 
    ggplot(aes(
      x = sepal.length, 
      y = sepal.width, 
      color = species)
    ) +
    geom_point()
  
  return(p)
}