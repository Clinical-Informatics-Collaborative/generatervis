test_that("create_empty_fastq() works", {
  # Create a temporary directory
  temp_dir <- tempdir()

  # Test with a single patient ID
  patient_id <- "patient_123"
  create_empty_fastq(patient_id, output_dir = temp_dir)

  # Check if the file was created
  file_path <- file.path(temp_dir, paste0(patient_id, ".fastq"))
  expect_true(file.exists(file_path))

  # Read the content of the created file
  fastq_content <- readLines(file_path)

  # Check the content of the FASTQ file
  expect_equal(fastq_content[1], paste0("@", patient_id)) # Line 1: Sequence ID
  expect_equal(fastq_content[2], "")                      # Line 2: Empty sequence
  expect_equal(fastq_content[3], "+")                     # Line 3: Separator
  expect_equal(fastq_content[4], "")                      # Line 4: Empty quality scores

  # Clean up by removing the created file
  unlink(file_path)
})

test_that("create_empty_fastq() handles multiple patient IDs", {
  # Create a temporary directory
  temp_dir <- tempdir()

  # Test with multiple patient IDs
  patient_ids <- c("patient_123", "patient_456")
  for (patient_id in patient_ids) {
    create_empty_fastq(patient_id, output_dir = temp_dir)

    # Check if the file was created
    file_path <- file.path(temp_dir, paste0(patient_id, ".fastq"))
    expect_true(file.exists(file_path))

    # Read the content of the created file
    fastq_content <- readLines(file_path)

    # Check the content of the FASTQ file
    expect_equal(fastq_content[1], paste0("@", patient_id)) # Line 1: Sequence ID
    expect_equal(fastq_content[2], "")                      # Line 2: Empty sequence
    expect_equal(fastq_content[3], "+")                     # Line 3: Separator
    expect_equal(fastq_content[4], "")                      # Line 4: Empty quality scores

    # Clean up by removing the created file
    unlink(file_path)
  }
})
