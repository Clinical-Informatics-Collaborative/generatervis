#' Create an empty .fastq file using patient ID
#'
#' @param patient_id A vector of patient IDs
#'
#' @returns An empty .fastq file with the patient ID in the name
#' @export
#' @examples
#' patient_id <- "patient_1"
#' create_fastq_file(patient_id)
create_fastq_file <- function(patient_id) {
  # Check if the patient_id is a character vector
  if (!is.character(patient_id)) {
    stop("patient_id must be a character vector")
  }

  # Create the file name
  file_name <- paste0(patient_id, ".fastq")

  # Create empty reads
  reads <- Biostrings::DNAStringSet()

  # Create empty qualities
  qualities <- Biostrings::BStringSet()

  # Create empty IDs
  ids <- Biostrings::BStringSet()

  # Create an empty ShortReadQ object
  empty_fastq <- ShortRead::ShortReadQ(
    id = ids,
    sread = reads,
    quality = qualities
  )

  # Write to an empty .fastq file
  ShortRead::writeFastq(empty_fastq,file_name)

  # Return the file name
  return(file_name)
  }
