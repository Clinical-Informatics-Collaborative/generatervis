
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
#> ✔ 1 pkg: kept 1 [2.9s]
```

## Example

### To create an empty raw (.fastq) file, use the following steps:

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

### To generate a random sample of `reads` for a Whole Genome Sequencing (WGS) dataset, use the following steps:

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
#>  [1] "@patient_123_read1" "TCTTAAAA"           "+"                 
#>  [4] "IIIIIIII"           "@patient_123_read2" "CCTTCGAG"          
#>  [7] "+"                  "IIIIIIII"           "@patient_123_read3"
#> [10] "TAGTTAAC"           "+"                  "IIIIIIII"          
#> [13] "@patient_123_read4" "TATTAGTC"           "+"                 
#> [16] "IIIIIIII"           "@patient_123_read5" "AAAACCAA"          
#> [19] "+"                  "IIIIIIII"
```

Example 2: When read length is specified, it will be set to the
specified value.

``` r
# Generate 5 random reads for patient ID "patient_456" with a read length of 12
 generatervis::rreads("patient_456", n = 5, read_length = 12)
#>  [1] "@patient_456_read1" "GGCGACTCGTTT"       "+"                 
#>  [4] "IIIIIIIIIIII"       "@patient_456_read2" "GCGCGAGACATT"      
#>  [7] "+"                  "IIIIIIIIIIII"       "@patient_456_read3"
#> [10] "CGGTTGTCGAGG"       "+"                  "IIIIIIIIIIII"      
#> [13] "@patient_456_read4" "GGATAGTTATGT"       "+"                 
#> [16] "IIIIIIIIIIII"       "@patient_456_read5" "TCGCACTTCGTG"      
#> [19] "+"                  "IIIIIIIIIIII"
```

### To fill a FASTQ file with random reads

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

### To visualise raw (.fastq) data by plotting FASTQ sequences in a grid format, use the following steps:

1.  Define the patient ID for which you want to plot the FASTQ
    sequences.
2.  Specify the number of reads you want to plot.
3.  Optionally, specify the read length (default is 8). It should be
    multiple of 4.
4.  The generated plot will be saved in the current working directory by
    default. If another directory is specified, the plot will be saved
    there.

``` r
# Plot FASTQ sequences for patient ID "patient_123" with 2 reads of length 8
 generatervis::fastq_plot("patient_123", output_dir = ".", n = 2, read_length = 8)
#> Plot saved to: ./fastq_plot_patient_123.png
```

### To convert a raw (.fastq) file to a processed (.bam) file using a dummy .sam format

``` r
# Convert a .fastq file to a .bam file
output_dir <- tempdir()
n <- 2
read_length <- 8
patient_id <- "test_patient"
fastq_file <- file.path(output_dir, paste0(patient_id, ".fastq"))
generatervis::fill_fastq(patient_id, output_dir, n, read_length)
#> Creating a new FASTQ file.
#> Empty FASTQ file created at: /var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T//RtmpKpaEyV/test_patient.fastq
#> Populated /var/folders/7k/kpyh33yd4mlbp_p2j8m4810m0000gn/T//RtmpKpaEyV/test_patient.fastq with 2 reads.
generatervis::fastq_to_bam(fastq_file, sam_file = paste0(patient_id,".sam"), reference = "chr1")
#> Dummy SAM file written to: test_patient.sam
```

This will create a `.sam` file in the specified output directory. The
`.sam` file will contain the same number of reads as the `.fastq` file,
and the sequence and quality scores will be identical.

To create the corresponding `.bam` file, you can use the `samtools`
command-line tool. The `.bam` file will be created in the same directory
as the `.sam` file. For this, run the following code in the command line
interface:

``` bash
# samtools view -Sb dummy.sam > dummy.bam
```

### To convert a processed (.bam) file to a summarised (.vcf) file format, use the following steps:

1.  Define the patient ID for which you want to convert the .bam file.
2.  Specify the output VCF file name.

``` r
patient_id <- "patient_123"
generatervis::bam_to_vcf(patient_id = patient_id, vcf_file ="output.vcf")
#> Mock VCF written to patient_123.vcf
```
