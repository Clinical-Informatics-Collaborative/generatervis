test_that("create_empty_fastq() works", {
  # Create a temporary directory
  temp_dir <- tempdir()

  # Test with a single patient ID
  patient_id <- "Patient_001"
  sample_id <- "SMP_001"
  create_empty_fastq(patient_id, sample_id, output_dir = temp_dir)

  # Check if the file was created
  file_path <- file.path(temp_dir, paste0(patient_id, "_", sample_id, ".fastq"))
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
  patient_ids <- c("Patient_001", "Patient_001")
  sample_ids <- c("SMP_001", "SMP_002")
  count <- length(patient_ids)
  for (file_counter in 1:count) {
    create_empty_fastq(patient_ids[file_counter], sample_ids[file_counter], output_dir = temp_dir)

    # Check if the file was created
    file_path <- file.path(temp_dir, paste0(patient_ids[file_counter], "_", sample_ids[file_counter], ".fastq"))
    expect_true(file.exists(file_path))

    # Read the content of the created file
    fastq_content <- readLines(file_path)

    # Check the content of the FASTQ file
    expect_equal(fastq_content[1], paste0("@", patient_ids[file_counter])) # Line 1: Sequence ID
    expect_equal(fastq_content[2], "")                      # Line 2: Empty sequence
    expect_equal(fastq_content[3], "+")                     # Line 3: Separator
    expect_equal(fastq_content[4], "")                      # Line 4: Empty quality scores

    # Clean up by removing the created file
    unlink(file_path)
  }
})
