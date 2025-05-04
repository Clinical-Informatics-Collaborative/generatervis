test_that("create_metadata() works", {
  # Create a temporary directory
  temp_dir <- paste0(".","/cbioportal_study")
  #dir.create(temp_dir, recursive = TRUE, showWarnings = FALSE)


  output_path <- file.path(temp_dir)
  if (dir.exists(output_path)) {
    unlink(output_path, recursive = TRUE)
  }
  dir.create(output_path)

  # Call the function with a test patient ID
  create_metadata(c("patient_123", "patient_456"), output_dir = output_path)

  # Check if the directory was created
  expect_true(dir.exists(output_path))

  # Check if the files were created
  expect_true(file.exists(file.path(output_path, "data_clinical_patient.txt")))
  expect_true(file.exists(file.path(output_path, "meta_clinical_patient.txt")))
  expect_true(file.exists(file.path(output_path, "meta_study.txt")))
  expect_true(file.exists(file.path(output_path, "data_mutations.txt")))
  expect_true(file.exists(file.path(output_path, "meta_mutations.txt")))

  # Clean up
  unlink(temp_dir, recursive = TRUE)
})
