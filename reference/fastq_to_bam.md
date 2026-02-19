# Convert \`.fastq\` to \`.bam\`

This function converts a \`.fastq\` file to a \`.bam\` file using a
dummy \`.sam\` format. It reads the \`.fastq\` file, extracts the
sequence identifiers and sequences, and creates a dummy \`.sam\` file.

## Usage

``` r
fastq_to_bam(
  fastq_file,
  patient_id,
  sample_id,
  output_dir = tempdir(),
  sam_file = paste0(output_dir, "/", patient_id, "_", sample_id, ".sam"),
  reference = "chr1"
)
```

## Arguments

- fastq_file:

  A character string specifying the path to the \`.fastq\` file.

- patient_id:

  A character string specifying the patient ID. This will be used as the
  base name for the output \`.sam\` file.

- sample_id:

  A character string specifying the sample ID. This will be used as the
  base name for the output \`.sam\` file.

- output_dir:

  A character string specifying the directory where the output \`.sam\`
  file will be saved. Default is a temporary directory.

- sam_file:

  A character string specifying the path to the output \`.sam\` file.

- reference:

  A character string specifying the reference sequence name. Default is
  "chr1".

## Details

The function reads the \`.fastq\` file and extracts the sequence
identifiers and sequences. It then creates a dummy \`.sam\` file with
the following fields: - QNAME: Query name (read identifier) - FLAG:
Bitwise flag (0 for unmapped) - RNAME: Reference sequence name - POS:
Position on the reference sequence - MAPQ: Mapping quality (255 for
unmapped) - CIGAR: CIGAR string (length of the sequence) - RNEXT:
Reference name of the next read (dummy value "\*") - PNEXT: Position of
the next read (dummy value 0) - TLEN: Template length (dummy value 0) -
SEQ: Sequence - QUAL: Quality scores

## Examples

``` r
# Convert a `.fastq` file to a `.bam` file
output_dir <- tempdir()
n <- 2
read_length <- 8
patient_id <- "patient_123"
sample_id <-  "smp_001"
fastq_file <- file.path(output_dir, paste0(patient_id, "_", sample_id, ".fastq"))
fill_fastq(patient_id, sample_id, output_dir, n, read_length)
#> Creating a new `.fastq` file.
#> Empty `.fastq` file created at: /tmp/RtmpQD3okl/patient_123_smp_001.fastq
#> Populated /tmp/RtmpQD3okl/patient_123_smp_001.fastq with 2 reads.
sam_file <- paste0(output_dir, "/", patient_id, "_", sample_id, ".sam")
fastq_to_bam(fastq_file, patient_id, sample_id, output_dir, sam_file)
#> Dummy .sam file written to: /tmp/RtmpQD3okl/patient_123_smp_001.sam 
```
