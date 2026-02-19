# Create an empty .fastq file using patient ID

This function creates an empty \`.fastq\` file with the specified
patient ID. The file will contain a single entry with the patient ID as
the sequence identifier. The sequence and quality scores will be empty

## Usage

``` r
create_empty_fastq(patient_id, output_dir = tempdir())
```

## Arguments

- patient_id:

  A character vector representing the patient IDs.

- output_dir:

  A character string specifying the directory where the \`.fastq\` file
  will be saved.

## Details

The function constructs a \`.fastq\` file with the following format:

- Line 1: Sequence ID (e.g., @patient_id)

- Line 2: Empty sequence

- Line 3: Separator (e.g., +)

- Line 4: Empty quality scores

## Examples

``` r
 # Create an empty `.fastq` file for patient ID "patient_123"
 create_empty_fastq("patient_123")
#> Empty `.fastq` file created at: /tmp/RtmpmOzrPU/patient_123.fastq
 # Create an empty `.fastq` file for patient ID "patient_456" in a specific directory
 create_empty_fastq("patient_456", output_dir = tempdir())
#> Empty `.fastq` file created at: /tmp/RtmpmOzrPU/patient_456.fastq
```
