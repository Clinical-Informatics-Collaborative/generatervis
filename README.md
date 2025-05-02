
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
#> 
#> ℹ No downloads are needed
#> ✔ 1 pkg: kept 1 [2.8s]
```

## Example

# To create an empty raw (.fastq) file, use the following steps:

1.  Define the patient ID for which you want to create an empty FASTQ
    file.

2.1 When output directory is not specified, the `.fastq` file will be
saved in the current working directory.

``` r
# Create an empty FASTQ file for patient ID "patient_123"
  generatervis::create_empty_fastq("patient_123")
#> Empty FASTQ file created at: ./patient_123.fastq
```

2.2 When output directory is specified, the `.fastq` file will be saved
in the specified directory.

``` r
# Create an empty FASTQ file for patient ID "patient_456" in a specific directory
  generatervis::create_empty_fastq("patient_456", output_dir = ".")
#> Empty FASTQ file created at: ./patient_456.fastq
```

# To generate a random sample of `reads` for a Whole Genome Sequencing (WGS) dataset, use the following steps:

1.  Define the patient ID for which you want to create an empty FASTQ
    file.
2.  Specify the number of reads you want to generate.
3.  Optionally, specify the read length (default is 8). It should be
    multiple of 4.
4.  The generated reads will be saved in a `.fastq` file in the current
    working directory.

Example 1: When read length is not specified, it will default to 8.

``` r
# Generate 5 random reads for patient ID "patient_123"
 generatervis::rreads("patient_123", n = 5)
#>  [1] "@patient_123_read1" "CAACTTGT"           "+"                 
#>  [4] "IIIIIIII"           "@patient_123_read2" "ACCAGGCT"          
#>  [7] "+"                  "IIIIIIII"           "@patient_123_read3"
#> [10] "GCCAGTCG"           "+"                  "IIIIIIII"          
#> [13] "@patient_123_read4" "GGGACCGG"           "+"                 
#> [16] "IIIIIIII"           "@patient_123_read5" "GTAAAAGT"          
#> [19] "+"                  "IIIIIIII"
```

Example 2: When read length is specified, it will be set to the
specified value.

``` r
# Generate 5 random reads for patient ID "patient_456" with a read length of 12
 generatervis::rreads("patient_456", n = 5, read_length = 12)
#>  [1] "@patient_456_read1" "AAAGTCAAACCC"       "+"                 
#>  [4] "IIIIIIIIIIII"       "@patient_456_read2" "AAGTTATTAGAT"      
#>  [7] "+"                  "IIIIIIIIIIII"       "@patient_456_read3"
#> [10] "GTCCACGACAGG"       "+"                  "IIIIIIIIIIII"      
#> [13] "@patient_456_read4" "CCGGCACATAGT"       "+"                 
#> [16] "IIIIIIIIIIII"       "@patient_456_read5" "GCCGCGCGCCAG"      
#> [19] "+"                  "IIIIIIIIIIII"
```

# To fill a FASTQ file with random reads

1.  Define the patient ID for which you want to fill the FASTQ file.
2.  Specify the number of reads you want to generate.
3.  Optionally, specify the read length (default is 8). It should be
    multiple of 4.
4.  The generated reads will be saved in a `.fastq` file in the current
    working directory by default. If another directory is specified, the
    file will be saved there.

Example: When read length is not specified, it will default to 8.

``` r
# Fill a FASTQ file for patient ID "patient_123" with 2 reads of length 8
 generatervis::fill_fastq("patient_123",output_dir = ".", n = 2, read_length = 8)
#> File already exists. Appending reads to the existing file.
#> Populated ./patient_123.fastq with 2 reads.
```
