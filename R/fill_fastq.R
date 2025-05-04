#' Function to fill a FASTQ file with random reads
#'
#' This function populates a FASTQ file with random reads for a given patient ID.
#' The function first creates an empty FASTQ file using the patient ID,
#' then generates a specified number of random reads,
#' and writes them to the file.
#' @param patient_id A character string representing the patient ID.
#' @param output_dir A character string specifying the directory where the FASTQ file will be saved. Default is the current working directory.
#' @param n An integer specifying the number of reads to generate.
#' @param read_length An integer specifying the length of each read. Default is 8. It should be multiple of 4.
#'
#' @return NULL
#'
#' @examples
#' # Fill a FASTQ file for patient ID "patient_123" with 2 reads of length 8
#' fill_fastq("patient_123",output_dir = ".", n = 2, read_length = 8)
#'
#' @details
#' The function first checks if the FASTQ file already exists.
#' If it does, it appends the new reads to the existing file.
#' If not, it creates a new file.
#' The generated reads are in FASTQ format, which consists of four lines per read:
#' \itemize{
#' \item Line 1: Sequence identifier (e.g., @patient_id_read1)
#' \item Line 2: Random DNA sequence
#' \item Line 3: Separator (e.g., +)
#' \item Line 4: Quality scores
#' }
#'
#' @export
fill_fastq <- function(patient_id, output_dir = ".", n, read_length) {

  file_name <- file.path(output_dir, paste0(patient_id, ".fastq"))
  # Create an empty FASTQ file

  # Check if the file already exists, else create it
  if (file.exists(file_name)) {
    message("File already exists. Appending reads to the existing file.")
  } else {
    message("Creating a new FASTQ file.")
    create_empty_fastq(patient_id, output_dir)
  }

  # Generate random FASTQ reads
  fastq_reads <- rreads(patient_id, n, read_length)

  if (!file.exists(file_name) || is.na(file.info(file_name)$size) || file.info(file_name)$size == 0) {
    con <- file(file_name, open = "a")  # Open in append mode
    writeLines(fastq_reads, con) # Note: writeLines() does not have 'append' argument
    close(con)
  } else {
    writeLines(fastq_reads, file_name)
  }

  message("Populated ", file_name, " with ", n, " reads.")
}
