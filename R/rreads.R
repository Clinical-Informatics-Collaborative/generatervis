#' Function to generate a random sample of reads in `.fastq` format
#'
#' This function generates a specified number of random reads in `.fastq` format.
#' Each read consists of a sequence identifier, a random DNA sequence, a separator line, and quality scores.
#'
#' @param patient_id A character string representing the patient ID.
#' @param sample_id A character string representing the sample ID.
#' @param n An integer specifying the number of reads to generate.
#' @param read_length An integer specifying the length of each read. It should be multiple of 4. Default is 8.
#' @return A character vector containing the generated `.fastq` lines.
#' @examples
#' # Generate 5 random reads for patient ID "patient_001" and sample ID
#' # "smp_001"
#' rreads("patient_001", "smp_001", n = 5)
#' # Generate 10 random reads for patient ID "patient_001" and sample ID
#' # "smp_002" with a read length of 12
#' rreads("patient_001", "smp_002", n = 10, read_length = 12)
#' @export
#'
#' @details
#' The function generates random DNA sequences using the nucleotides A, T, G, and C.
#' The quality scores are represented as ASCII characters, with 'I' indicating high quality.
#' The output is formatted as a `.fastq` file, which consists of four lines per read:
#' \itemize{
#'  \item Line 1: Sequence identifier (e.g., @patient_id_read1)
#'  \item Line 2: Random DNA sequence
#'  \item Line 3: Separator (e.g., +)
#'  \item Line 4: Quality scores
#'  }
#'  @seealso
#'  \code{\link{create_empty_fastq}} for creating an empty `.fastq` file.
rreads <- function(patient_id, sample_id, n, read_length = 8) {
  bases <- c("A", "T", "G", "C")  # Possible nucleotides
  fastq_lines <- character(4 * n)  # 4 lines per read

  for (i in 1:n) {
    sequence <- paste0(sample(bases, size = read_length, replace = TRUE), collapse = "")
    quality <- paste(rep("I", read_length), collapse = "")  # Dummy quality scores (I = high quality)

    # Add 4 lines per read
    fastq_lines[(4*i - 3)] <- paste0("@", patient_id, "_read", i)
    fastq_lines[(4*i - 2)] <- sequence
    fastq_lines[(4*i - 1)] <- "+"
    fastq_lines[(4*i)]     <- quality
  }

  return(fastq_lines)
}
