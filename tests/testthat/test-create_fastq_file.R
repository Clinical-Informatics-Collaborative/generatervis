test_that("create_fastq_file() works", {
  # Test with a valid patient ID
  patient_id <- "patient_1"
  file_name <- create_fastq_file(patient_id)

  # Check if the file is created
  expect_true(file.exists(file_name))

  # Check if the file name is correct
  expect_equal(basename(file_name), paste0(patient_id, ".fastq"))

  # Clean up
  file.remove(file_name)

})

test_that("create_fastq_file() handles invalid input", {
  # Test with an invalid patient ID
  expect_error(create_fastq_file(123), "patient_id must be a character vector")
})

test_that("create_fastq_file() handles multiple patient IDs", {
  # Test with multiple patient IDs
  patient_ids <- c("patient_1", "patient_2")
  file_names <- sapply(patient_ids, create_fastq_file)

  # Check if all files are created
  expect_true(all(file.exists(file_names)))

  # Check if the file names are correct
  expect_equal(basename(file_names), paste0(patient_ids, ".fastq"))

  # Clean up
  file.remove(file_names)
})
