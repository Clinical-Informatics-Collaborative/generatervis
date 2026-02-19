# fastq_plot

Function to plot nucleotide sequences from a raw \`.fastq\` file in a
grid format

## Usage

``` r
fastq_plot(patient_id, sample_id, output_dir = tempdir(), n, read_length)
```

## Arguments

- patient_id:

  A character string representing the patient ID.

- sample_id:

  A character string representing the sample ID.

- output_dir:

  A character string specifying the directory where the plot file will
  be saved.

- n:

  An integer specifying the number of reads to plot.

- read_length:

  An integer specifying the length of each read. It should be a multiple
  of 4. Default is 8.

## Details

The function reads a \`.fastq\` file and plots the sequences in a grid
format. Each base is represented by a different color:

- A: Green

- T: Red

- G: Blue

- C: Orange

- N: Gray

The plot is saved as a PNG file in the specified output directory.

## Examples

``` r
# Plot nucleotide sequences for patient ID "patient_001" and sample ID
# "smp_001" with 2 reads of length 8
fastq_plot("patient_123", "smp_001", output_dir = tempdir(), n = 2,
read_length = 8)
#> Plot saved to: /tmp/RtmpQD3okl/fastq_plot_patient_123_smp_001.png
```
