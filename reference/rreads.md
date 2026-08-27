# Function to generate a random sample of reads in \`.fastq\` format

This function generates a specified number of random reads in \`.fastq\`
format. Each read consists of a sequence identifier, a random DNA
sequence, a separator line, and quality scores.

## Usage

``` r
rreads(patient_id, sample_id, n, read_length = 8)
```

## Arguments

- patient_id:

  A character string representing the patient ID.

- sample_id:

  A character string representing the sample ID.

- n:

  An integer specifying the number of reads to generate.

- read_length:

  An integer specifying the length of each read. It should be multiple
  of 4. Default is 8.

## Value

A character vector containing the generated \`.fastq\` lines.

## Details

The function generates random DNA sequences using the nucleotides A, T,
G, and C. The quality scores are represented as ASCII characters, with
'I' indicating high quality. The output is formatted as a \`.fastq\`
file, which consists of four lines per read:

- Line 1: Sequence identifier (e.g., @patient_id_read1)

- Line 2: Random DNA sequence

- Line 3: Separator (e.g., +)

- Line 4: Quality scores

@seealso
[`create_empty_fastq`](https://clinical-informatics-collaborative.github.io/generatervis/reference/create_empty_fastq.md)
for creating an empty \`.fastq\` file.

## Examples

``` r
# Generate 5 random reads for patient ID "patient_001" and sample ID
# "smp_001"
rreads("patient_001", "smp_001", n = 5)
#>  [1] "@patient_001_read1" "CCTGATGG"           "+"                 
#>  [4] "IIIIIIII"           "@patient_001_read2" "CATATGTC"          
#>  [7] "+"                  "IIIIIIII"           "@patient_001_read3"
#> [10] "ATACCTGA"           "+"                  "IIIIIIII"          
#> [13] "@patient_001_read4" "TTGTAAGT"           "+"                 
#> [16] "IIIIIIII"           "@patient_001_read5" "ACACCGCC"          
#> [19] "+"                  "IIIIIIII"          
# Generate 10 random reads for patient ID "patient_001" and sample ID
# "smp_002" with a read length of 12
rreads("patient_001", "smp_002", n = 10, read_length = 12)
#>  [1] "@patient_001_read1"  "CGTGTGTGTCTA"        "+"                  
#>  [4] "IIIIIIIIIIII"        "@patient_001_read2"  "GTTGATCCACAG"       
#>  [7] "+"                   "IIIIIIIIIIII"        "@patient_001_read3" 
#> [10] "CTATTTGCTCTT"        "+"                   "IIIIIIIIIIII"       
#> [13] "@patient_001_read4"  "AGGCAAAATAAA"        "+"                  
#> [16] "IIIIIIIIIIII"        "@patient_001_read5"  "TCAGGACGGCTC"       
#> [19] "+"                   "IIIIIIIIIIII"        "@patient_001_read6" 
#> [22] "AGAGATAAAAGA"        "+"                   "IIIIIIIIIIII"       
#> [25] "@patient_001_read7"  "TGCGCTATTGCG"        "+"                  
#> [28] "IIIIIIIIIIII"        "@patient_001_read8"  "CATCACGACAGG"       
#> [31] "+"                   "IIIIIIIIIIII"        "@patient_001_read9" 
#> [34] "ATGCGGTCTACC"        "+"                   "IIIIIIIIIIII"       
#> [37] "@patient_001_read10" "GTCTATATGCAT"        "+"                  
#> [40] "IIIIIIIIIIII"       
```
