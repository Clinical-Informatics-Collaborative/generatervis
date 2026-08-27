# generatervis

## Overview

The `generatervis` package provides functions to create empty `.fastq`
files, generate random reads, fill raw `.fastq` files with random reads,
plot `.fastq` sequences, convert `.fastq` files to `.bam` files, convert
`.bam` files to `.vcf` files, and create metadata files for patient IDs.

## ⬇️ Installing `generatervis`

You can install the development version of `generatervis` from
[GitHub](https://github.com/) with

``` r

# install.packages("pak")  
pak::pak("Clinical-Informatics-Collaborative/generatervis")  
#> 
#> → Will update 1 package.
#> → The package (0 B) is cached.
#> + generatervis 0.1.0 → 0.1.0 👷🏼‍♀️🔧 (GitHub: 4dca20a)
#> ℹ No downloads are needed, 1 pkg is cached
#> ✔ Installed generatervis 0.1.0 (github::Clinical-Informatics-Collaborative/generatervis@4dca20a) (32ms)
#> ✔ 1 pkg: upd 1 [4.2s]
```

## Usage

Create an empty raw `.fastq` file for the specified patient.

``` r

patient_id <- "patient_123"
generatervis::create_empty_fastq(patient_id)
```

Generate a random sample of `reads` for a Whole Genome Sequencing (WGS)
dataset for the specified patient ID.

``` r

n <- 2
generatervis::rreads(patient_id, n)
```

Populate the `.fastq` file with the random reads.

``` r

output_dir <- tempdir()
read_length <- 8
generatervis::fill_fastq(patient_id, output_dir, n, read_length)
```

(Optional) Plot the nucleotide sequences in the `.fastq` file in a grid
format.

``` r

generatervis::fastq_plot(patient_id, output_dir, n, read_length)
```

Convert the (raw) `.fastq` file to a (processed) `.bam` file using a
dummy `.sam` format.

``` r

fastq_file <- file.path(output_dir, paste0(patient_id, ".fastq"))
generatervis::fill_fastq(patient_id, output_dir, n, read_length)
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

generatervis::bam_to_vcf(patient_id, output_dir, vcf_file = paste0(output_dir, "/", patient_id, ".vcf"))
```

Create the metadata files to upload to
[`data_storage_repository`](https://github.com/Clinical-Informatics-Collaborative/data_storage_portal)

``` r

generatervis::create_metadata(patient_id, output_dir)
```

When these metadata `.txt` files are ready, they can be uploaded to
[`data_storarge_repository`](https://github.com/Clinical-Informatics-Collaborative/data_storage_portal)
by forking the repository and creating a pull request.

## Documentation

You can find detailed documentation and tutorials at the package
website:
<https://clinical-informatics-collaborative.github.io/generatervis/>

- **[Reference
  manual](https://clinical-informatics-collaborative.github.io/generatervis/)**:
  Full list of functions with detailed descriptions.

For in-session help:

``` r

# View documentation for a specific function
?create_empty_fastq
```

## Contributing

To be added.

## Code of Conduct

To be added.

## License

The license associated with this code is the [MIT
license](https://github.com/Clinical-Informatics-Collaborative/generatervis/blob/main/LICENSE.md).

## Citation

To be added.

## Acknowledgments

This package is written as a part of the programme by the [Research
Computing Program, Walter and Eliza Hall Institute of Medical
Research](https://wehi-researchcomputing.github.io/), mentored by
[Rowland Mosbergen](https://github.com/rowlandm).
