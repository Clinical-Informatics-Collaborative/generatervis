test_that("create_metadata() works", {
  # Create a temporary directory
  temp_dir <- tempdir()
  setwd(temp_dir)

  # Call the function with a test patient ID
  create_metadata(c("P1", "P2"))

  # Check if the directory was created
  expect_true(dir.exists(file.path(temp_dir, "cbioportal_study")))

  # Check if the files were created
  expect_true(file.exists(file.path(temp_dir, "cbioportal_study", "data_clinical_patient.txt")))
  expect_true(file.exists(file.path(temp_dir, "cbioportal_study", "meta_clinical_patient.txt")))
  expect_true(file.exists(file.path(temp_dir, "cbioportal_study", "meta_study.txt")))
  expect_true(file.exists(file.path(temp_dir, "cbioportal_study", "data_mutations.txt")))
  expect_true(file.exists(file.path(temp_dir, "cbioportal_study", "meta_mutations.txt")))

  # Clean up
  unlink("cbioportal_study", recursive = TRUE)
})
