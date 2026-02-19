#' Create an empty .fastq file using patient ID
#'
#' This function creates an empty `.fastq` file with the specified patient ID and sample ID.
#' The file will contain a single entry with the patient ID as the sequence identifier.
#' The sequence and quality scores will be empty
#'
#' @param patient_id A character vector representing the patient IDs.
#' @param sample_id A character vector representing the sample IDs.
#' @param output_dir A character string specifying the directory where the `.fastq` file will be saved.
#'
#' @returns NULL
#' @export
#'
#' @examples
#' # Create an empty `.fastq` file for patient ID "Patient_001" and
#' #  sample ID "SMP_001"
#'  create_empty_fastq("Patient_001", "SMP_001")
#' # Inside a specific directory, Create an empty `.fastq` file for
#' # patient ID "Patient_001" and sample ID "SMP_002"
#'  create_empty_fastq("Patient_001", "SMP_002", output_dir = tempdir())
#' @details The function constructs a `.fastq` file with the following format:
#' \itemize{
#'  \item Line 1: Sequence ID (e.g., @patient_id)
#'  \item Line 2: Empty sequence
#'  \item Line 3: Separator (e.g., +)
#'  \item Line 4: Empty quality scores
#'  }
create_empty_fastq <- function(patient_id, sample_id, output_dir = tempdir()) {
  # Construct filename
  file_name <- file.path(output_dir, paste0(patient_id, "_", sample_id, ".fastq"))

  # Content for an empty `.fastq` entry
  fastq_content <- c(
    paste0("@", patient_id),   # Line 1: Sequence ID
    "",                        # Line 2: Empty sequence
    "+",                       # Line 3: Separator
    ""                         # Line 4: Empty quality scores
  )

  # Write to file
  writeLines(fastq_content, con = file_name)

  message("Empty `.fastq` file created at: ", file_name)
}
