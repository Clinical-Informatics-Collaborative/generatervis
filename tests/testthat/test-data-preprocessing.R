test_that("Checking function clean()", {
  x1 <- 6
  y1 <- 8
  clean1 <- clean(x1, y1)
  expect_equal(clean1, 14)
})
