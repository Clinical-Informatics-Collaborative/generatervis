# Function to generate a random sample of reads in \`.fastq\` format

This function generates a specified number of random reads in \`.fastq\`
format. Each read consists of a sequence identifier, a random DNA
sequence, a separator line, and quality scores.

## Usage

``` r
rreads(patient_id, n, read_length = 8)
```

## Arguments

- patient_id:

  A character string representing the patient ID.

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
for creating an empty\`.fastq\` file.

## Examples

``` r
# Generate 5 random reads for patient ID "patient_123"
rreads("patient_123", n = 5)
#>  [1] "@patient_123_read1" "TCATACCT"           "+"                 
#>  [4] "IIIIIIII"           "@patient_123_read2" "GATTGTAA"          
#>  [7] "+"                  "IIIIIIII"           "@patient_123_read3"
#> [10] "GTACACCG"           "+"                  "IIIIIIII"          
#> [13] "@patient_123_read4" "CCCGTGTG"           "+"                 
#> [16] "IIIIIIII"           "@patient_123_read5" "TGTCTAGT"          
#> [19] "+"                  "IIIIIIII"          
# Generate 10 random reads for patient ID "patient_456" with a read length of 12
rreads("patient_456", n = 10, read_length = 12)
#>  [1] "@patient_456_read1"  "TGATCCACAGCT"        "+"                  
#>  [4] "IIIIIIIIIIII"        "@patient_456_read2"  "ATTTGCTCTTAG"       
#>  [7] "+"                   "IIIIIIIIIIII"        "@patient_456_read3" 
#> [10] "GCAAAATAAATC"        "+"                   "IIIIIIIIIIII"       
#> [13] "@patient_456_read4"  "AGGACGGCTCAG"        "+"                  
#> [16] "IIIIIIIIIIII"        "@patient_456_read5"  "AGATAAAAGATG"       
#> [19] "+"                   "IIIIIIIIIIII"        "@patient_456_read6" 
#> [22] "CGCTATTGCGCA"        "+"                   "IIIIIIIIIIII"       
#> [25] "@patient_456_read7"  "TCACGACAGGAT"        "+"                  
#> [28] "IIIIIIIIIIII"        "@patient_456_read8"  "GCGGTCTACCGT"       
#> [31] "+"                   "IIIIIIIIIIII"        "@patient_456_read9" 
#> [34] "CTATATGCATTT"        "+"                   "IIIIIIIIIIII"       
#> [37] "@patient_456_read10" "AAGTATCCGCCA"        "+"                  
#> [40] "IIIIIIIIIIII"       
```
