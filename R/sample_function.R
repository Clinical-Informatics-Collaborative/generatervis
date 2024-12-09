#' Title
#'
#' @param nrow An interger
#' @param ncol An integer
#' @param x Column 1 of data frame
#' @param y Column 2 of data frame
#' @param z Column 3 of data frame
#'
#' @return A data frame
#' @export
#'
#' @examples
#' nrow <- 2
#' ncol <- 3
#' x <- c("a","p")
#' y <- c(12.56,38)
#' z <- c("abc","pqr")
#' data_frame(nrow, ncol, x, y, z)
data_frame <- function(nrow, ncol, x, y, z){
  df <- cbind(x,y,z)
  return(df)
}
