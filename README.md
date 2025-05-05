
<!-- README.md is generated from README.Rmd. Please edit that file -->

# generatervis

<!-- badges: start -->

[![R-CMD-check](https://github.com/Clinical-Informatics-Collaborative/generatervis/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Clinical-Informatics-Collaborative/generatervis/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Clinical-Informatics-Collaborative/generatervis/graph/badge.svg)](https://app.codecov.io/gh/Clinical-Informatics-Collaborative/generatervis)

<!-- badges: end -->

## Overview

The `generatervis` package provides functions to create empty `.fastq`
files, generate random reads, fill raw `.fastq` files with random reads,
plot `.fastq` sequences, convert `.fastq` files to BAM files, convert
BAM files to VCF files, and create metadata files for patient IDs.

## ⬇️ Installing `generatervis`

You can install the development version of `generatervis` from
[GitHub](https://github.com/) with

``` r
# install.packages("pak")  
pak::pak("Clinical-Informatics-Collaborative/generatervis")  
#> 
#> → Will update 1 package.
#> → The package (0 B) is cached.
#> + generatervis 0.1.0 → 0.1.0 👷🔧 (GitHub: f80a370)
#> ℹ No downloads are needed, 1 pkg is cached
#> ✔ Installed generatervis 0.1.0 (github::Clinical-Informatics-Collaborative/generatervis@f80a370) (19ms)
#> ✔ 1 pkg: upd 1 [2.8s]
```

## Usage

Create an empty raw `.fastq` file for the specified patient.

``` r
generatervis::create_empty_fastq(patient_id="patient_123")
```

Generate a random sample of `reads` for a Whole Genome Sequencing (WGS)
dataset for the specified patient ID.

``` r
generatervis::rreads(patient_id="patient_123", n = 5)
```

Populate the `.fastq` file with the random reads.

``` r
generatervis::fill_fastq(patient_id="patient_123",output_dir = tempdir(), n = 2, read_length = 8)
```

(Optional) Plot the nucleotide sequences in the `.fastq` file in a grid
format.

``` r
generatervis::fastq_plot(patient_id="patient_123", output_dir = tempdir(), n = 2, read_length = 8)
```

Convert the (raw) `.fastq` file to a (processed) `.bam` file using a
dummy `.sam` format.

``` r
output_dir <- tempdir()
patient_id <- "patient_123"
fastq_file <- file.path(output_dir, paste0(patient_id, ".fastq"))
generatervis::fill_fastq(patient_id, output_dir, n =2, read_length=8)
generatervis::fastq_to_bam(fastq_file, patient_id, output_dir, sam_file = paste0(output_dir, "/", patient_id, ".sam"), reference = "chr1")
```

To create the corresponding `.bam` file, use the `samtools` command-line
tool.

``` bash
# samtools view -Sb path_to/file_name.sam > path_to/file_name.bam
```

Convert the (processed) `.bam` file to a (summarised) `.vcf` file
format.

``` r
patient_id <- “patient_123”
generatervis::bam_to_vcf(patient_id, output_dir = tempdir(), vcf_file = paste0(output_dir, "/", patient_id, ".vcf"))
```

Create the metadata files to upload to
[`data_storage_repository`](https://github.com/Clinical-Informatics-Collaborative/data_storage_portal)

``` r
patient_id <- "patient_123"
output_dir <- tempdir()
metadata <- generatervis::create_metadata(patient_id, output_dir)
```

When these metadata `.txt` files are ready, they can be uploaded to
[`data_storarge_repository`](https://github.com/Clinical-Informatics-Collaborative/data_storage_portal)
by forking the repository and creating a pull request.
