#' Create an empty .fastq file using patient ID
#'
#' This function creates an empty FASTQ file with the specified patient ID.
#' The file will contain a single entry with the patient ID as the sequence identifier.
#' The sequence and quality scores will be empty
#'
#' @param patient_id A character vector representing the patient IDs.
#' @param output_dir A character string specifying the directory where the FASTQ file will be saved.
#'
#' @returns NULL
#' @export
#'
#' @examples
#'  # Create an empty FASTQ file for patient ID "patient_123"
#'  create_empty_fastq("patient_123")
#'  # Create an empty FASTQ file for patient ID "patient_456" in a specific directory
#'  create_empty_fastq("patient_456", output_dir = tempdir())
#' @details The function constructs a FASTQ file with the following format:
#' \itemize{
#'  \item Line 1: Sequence ID (e.g., @patient_id)
#'  \item Line 2: Empty sequence
#'  \item Line 3: Separator (e.g., +)
#'  \item Line 4: Empty quality scores
#'  }
create_empty_fastq <- function(patient_id, output_dir = tempdir()) {
  # Construct filename
  file_name <- file.path(output_dir, paste0(patient_id, ".fastq"))

  # Content for an empty FASTQ entry
  fastq_content <- c(
    paste0("@", patient_id),   # Line 1: Sequence ID
    "",                        # Line 2: Empty sequence
    "+",                       # Line 3: Separator
    ""                         # Line 4: Empty quality scores
  )

  # Write to file
  writeLines(fastq_content, con = file_name)

  message("Empty FASTQ file created at: ", file_name)
}
