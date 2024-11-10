#' Function to clean the data file
#'
#' @param x An integer.
#' @param y An integer.
#'
#' @return A modified data frame.
#' @export
#'
#' @examples
#' x <- 3
#' y <- 5
#' clean(x, y)
clean <- function(x, y){
  df_modified <- x + y
  return(df_modified)
}
