#' Title
#'
#' @param x Column 1 of data frame
#' @param y Column 2 of data frame
#' @param z Column 3 of data frame
#'
#' @return A data frame
#' @export
#'
#' @examples
#' x <- c("a","p")
#' y <- c(12.56,38)
#' z <- c("abc","pqr")
#' data_frame(x, y, z)
data_frame <- function(x, y, z){
  my_list <- list(x,y,z)
  names(my_list) <- c("x","y","z")
  attr(my_list, "class") <- "data.frame"
  attr(my_list,"row.names") <- seq_along(my_list[[1]])
  return(my_list)
}
