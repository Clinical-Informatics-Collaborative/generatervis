test_that("checking function sample_function()", {
  nrow <- 2
  ncol <- 3
  x <- c("a","p")
  y <- c(12.56,38)
  z <- c("abc","pqr")
  observed_df <- data_frame(x, y, z)
  expected_df <- data.frame(x,y,z)
  expect_equal(observed_df, expected_df)
})
