#' Convert FASTQ to BAM
#'
#' This function converts a FASTQ file to a BAM file using a dummy SAM format.
#' It reads the FASTQ file, extracts the sequence identifiers and sequences,
#' and creates a dummy SAM file.
#' @param fastq_file A character string specifying the path to the FASTQ file.
#' @param patient_id A character string specifying the patient ID. This will be used as the base name for the output SAM file.
#' @param output_dir A character string specifying the directory where the output SAM file will be saved. Default is a temporary directory.
#' @param sam_file A character string specifying the path to the output SAM file.
#' @param reference A character string specifying the reference sequence name. Default is "chr1".
#' @return NULL
#' @examples
#' # Convert a FASTQ file to a BAM file
#' output_dir <- tempdir()
#' n <- 2
#' read_length <- 8
#' patient_id <- "patient_123"
#' fastq_file <- file.path(output_dir, paste0(patient_id, ".fastq"))
#' fill_fastq(patient_id, output_dir, n, read_length)
#' sam_file <- paste0(output_dir, "/", patient_id, ".sam")
#' fastq_to_bam(fastq_file, patient_id, output_dir, sam_file)
#' @details
#' The function reads the FASTQ file and extracts the sequence identifiers and sequences.
#' It then creates a dummy SAM file with the following fields:
#' - QNAME: Query name (read identifier)
#' - FLAG: Bitwise flag (0 for unmapped)
#' - RNAME: Reference sequence name
#' - POS: Position on the reference sequence
#' - MAPQ: Mapping quality (255 for unmapped)
#' - CIGAR: CIGAR string (length of the sequence)
#' - RNEXT: Reference name of the next read (dummy value "*")
#' - PNEXT: Position of the next read (dummy value 0)
#' - TLEN: Template length (dummy value 0)
#' - SEQ: Sequence
#' - QUAL: Quality scores
#' @export
fastq_to_bam <- function(fastq_file, patient_id, output_dir = tempdir(), sam_file = paste0(output_dir, "/", patient_id, ".sam"), reference = "chr1") {
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

