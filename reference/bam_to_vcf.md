# Convert \`.bam\`-like data to \`.vcf\` format

This function simulates the conversion of \`.bam\`-like data to \`.vcf\`
format. It creates a dummy \`.vcf\` file with dummy data.

## Usage

``` r
bam_to_vcf(
  patient_id,
  output_dir = tempdir(),
  vcf_file = paste0(output_dir, "/", patient_id, ".vcf")
)
```

## Arguments

- patient_id:

  A character string specifying the patient ID. This will be used as the
  base name for the output \`.vcf\` file.

- output_dir:

  A character string specifying the directory where the \`.vcf\` file
  will be saved.

- vcf_file:

  A character string specifying the path to the output \`.vcf\` file.
  Default is "dummy.vcf".

## Details

The function creates a dummy \`.vcf\` file with dummy data. The \`.vcf\`
file contains the following fields: - CHROM: Chromosome name - POS:
Position on the chromosome - ID: Variant identifier (dummy value ".") -
REF: Reference allele - ALT: Alternate allele - QUAL: Quality score -
dg: Total depth - gt: Genotype The function writes the \`.vcf\` file to
the specified path.

## Examples

``` r
# Convert `.bam`-like data to `.vcf` format
patient_id <- "patient_123"
output_dir <- tempdir()
bam_to_vcf(patient_id, output_dir, vcf_file = paste0(output_dir, "/", patient_id, ".vcf"))
#> Dummy .vcf written to /tmp/RtmpmOzrPU/patient_123.vcf
```
