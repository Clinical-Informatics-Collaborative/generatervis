#' Convert `.bam`-like data to `.vcf` format
#'
#' This function simulates the conversion of `.bam`-like data to `.vcf` format.
#' It creates a dummy `.vcf` file with dummy data.
#'
#' @param patient_id A character string specifying the patient ID. This will be used as the base name for the output `.vcf` file.
#' @param sample_id A character string specifying the sample ID. This will be used as the base name for the output `.vcf` file.
#' @param output_dir A character string specifying the directory where the `.vcf` file will be saved.
#' @param vcf_file A character string specifying the path to the output `.vcf` file. Default is "dummy.vcf".
#' @return NULL
#' @examples
#' # Convert `.bam`-like data to `.vcf` format
#' patient_id <- "patient_123"
#' sample_id <- "smp_001"
#' output_dir <- tempdir()
#' bam_to_vcf(patient_id, sample_id, output_dir, vcf_file = paste0(output_dir,
#' "/", patient_id, ".vcf"))
#' @details
#' The function creates a dummy `.vcf` file with dummy data.
#' The `.vcf` file contains the following fields:
#' - CHROM: Chromosome name
#' - POS: Position on the chromosome
#' - ID: Variant identifier (dummy value ".")
#' - REF: Reference allele
#' - ALT: Alternate allele
#' - QUAL: Quality score
#' - dg: Total depth
#' - gt: Genotype
#' The function writes the `.vcf` file to the specified path.
#'
#' @export
bam_to_vcf <- function(patient_id, sample_id, output_dir = tempdir(), vcf_file = paste0(output_dir, "/", patient_id, "_", sample_id, ".vcf")) {

  # Simulated `.bam`-like data (as a data frame)
  bam_data <- data.frame(
    chrom = "chr1",
    pos = c(1234567, 1234570),
    ref = c("G", "T"),
    alt = c("A", "C"),
    qual = c(30, 22),
    dp = c(14, 8),
    gt = c("0/1", "1/1"),
    stringsAsFactors = FALSE
  )

  # Create `.vcf` header
  vcf_header <- c(
    "##fileformat=VCFv4.2",
    "##source=MockBAMtoVCF",
    "##INFO=<ID=DP,Number=1,Type=Integer,Description=\"Total Depth\">",
    "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">",
    "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\tSAMPLE1"
  )

  # Convert data to `.vcf` lines
  vcf_body <- apply(bam_data, 1, function(row) {
    paste(row["chrom"],
          row["pos"],
          ".",
          row["ref"],
          row["alt"],
          row["qual"],
          "PASS",
          paste0("DP=", row["dp"]),
          "GT",
          row["gt"],
          sep = "\t")
  })

  # Write to file
  writeLines(c(vcf_header, vcf_body), con = vcf_file)

  cat("Dummy .vcf written to", vcf_file)
}
