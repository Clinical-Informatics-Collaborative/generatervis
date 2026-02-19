test_that("fill_fastq() works", {
  # Create a temporary directory for testing
  output_dir <- tempdir()

  # Define test parameters
  patient_id <- "test_patient"
  sample_id <- "smp_001"
  n <- 2
  read_length <- 8

  # Construct the expected file name
  file_name <- file.path(output_dir, paste0(patient_id, "_", sample_id, ".fastq"))

  # Call the function to fill the FASTQ file
  fill_fastq(patient_id, sample_id, output_dir, n, read_length)

  # Check if the file exists
  expect_true(file.exists(file_name))

  # Read the contents of the file
  fastq_content <- readLines(file_name)

  # Check if the number of lines is correct (4 lines per read)
  expect_equal(length(fastq_content), n * 4)

  # Check if the first line contains the correct sequence identifier
  expect_true(grepl(paste0("@", patient_id, "_read"), fastq_content[1]))
})



