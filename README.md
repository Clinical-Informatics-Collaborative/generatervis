
<!-- README.md is generated from README.Rmd. Please edit that file -->

# generatervis

<!-- badges: start -->

[![R-CMD-check](https://github.com/Clinical-Informatics-Collaborative/generatervis/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Clinical-Informatics-Collaborative/generatervis/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Clinical-Informatics-Collaborative/generatervis/graph/badge.svg)](https://app.codecov.io/gh/Clinical-Informatics-Collaborative/generatervis)

<!-- badges: end -->

The goal of `generatervis` is to generate and visualise Clinical data.

## Installation

You can install the development version of `generatervis` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Clinical-Informatics-Collaborative/generatervis")
```

## Example

This is a basic example which shows you how to solve a common problem:

# To define a data frame, use the following steps:

1.  Define all the vectors that should be the columns of the data frame.
    Note: Each vector should be of the same length. Suppose `x`, `y`,
    and `z` are three columns for a data frame.
2.  Combine the columns to form a data frame with the command
    `data_frame(a,b,c)`.

``` r
library(generatervis)
## basic example code
x <- c(3,5,9,7)
y <- c("place_1","place_2","place_3","place_4")
z <- c("x1","x2","x3","x4")
df <- data_frame(x,y,z)
print(df)
#>   x       y  z
#> 1 3 place_1 x1
#> 2 5 place_2 x2
#> 3 9 place_3 x3
#> 4 7 place_4 x4
```
