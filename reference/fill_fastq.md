# Function to fill a \`.fastq\` file with random reads

This function populates a \`.fastq\` file with random reads for a given
patient ID. The function first creates an empty \`.fastq\` file using
the patient ID, then generates a specified number of random reads, and
writes them to the file.

## Usage

``` r
fill_fastq(patient_id, output_dir = tempdir(), n, read_length)
```

## Arguments

- patient_id:

  A character string representing the patient ID.

- output_dir:

  A character string specifying the directory where the \`.fastq\` file
  will be saved.

- n:

  An integer specifying the number of reads to generate.

- read_length:

  An integer specifying the length of each read. It should be multiple
  of 4. Default is 8.

## Details

The function first checks if the \`.fastq\` file already exists. If it
does, it appends the new reads to the existing file. If not, it creates
a new file. The generated reads are in \`.fastq\` format, which consists
of four lines per read:

- Line 1: Sequence identifier (e.g., @patient_id_read1)

- Line 2: Random DNA sequence

- Line 3: Separator (e.g., +)

- Line 4: Quality scores

## Examples

``` r
# Fill a `.fastq` file for patient ID "patient_123" with 2 reads of length 8
fill_fastq("patient_123",output_dir = tempdir(), n = 2, read_length = 8)
#> File already exists. Appending the new reads to the existing file.
#> Populated /tmp/RtmpmOzrPU/patient_123.fastq with 2 reads.
```
