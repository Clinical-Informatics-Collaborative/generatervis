
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

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
