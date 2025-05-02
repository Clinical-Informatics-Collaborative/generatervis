fastq_to_bam <- function(fastq_file, sam_file = "dummy.sam", reference = "chr1") {
  fq_lines <- readLines(fastq_file)
  if (length(fq_lines) %% 4 != 0) {
    stop("FASTQ file format invalid: lines not divisible by 4.")
  }

  con <- file(sam_file, open = "wt")

  # Write SAM header
  writeLines(paste0("@HD\tVN:1.6\tSO:unsorted"), con)
  writeLines(paste0("@SQ\tSN:", reference, "\tLN:1000000"), con)
  writeLines("@RG", con)
  writeLines("@PG", con)

  # Loop over reads (every 4 lines)
  for (i in seq(1, length(fq_lines), by = 4)) {
    read_id <- sub("^@", "", fq_lines[i])
    seq <- fq_lines[i + 1]
    plus <- fq_lines[i + 2]
    qual <- fq_lines[i + 3]

    # Dummy values
    flag <- 0  # unmapped
    rname <- reference
    pos <- 100 + ((i - 1) / 4) * 10
    mapq <- 255
    cigar <- paste0(nchar(seq), "M")
    rnext <- "*"
    pnext <- 0
    tlen <- 0

    # Construct SAM line
    sam_line <- paste(read_id, flag, rname, pos, mapq, cigar,
                      rnext, pnext, tlen, seq, qual, sep = "\t")

    writeLines(sam_line, con)
  }

  close(con)
  cat("Dummy SAM file written to:", sam_file, "\n")
}

# Note: Code to convert .sam to .bam file: Go to the command line interface and run:
# samtools view -Sb dummy.sam > dummy.bam

