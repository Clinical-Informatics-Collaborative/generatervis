test_that("fastq_plot() works", {
  # Create a temporary directory
  output_dir <- "."
  n <- 2
  read_length <- 8
  patient_id <- "test_patient"
  # Create a sample FASTQ file
  fastq_file <- file.path(output_dir, paste0(patient_id, ".fastq"))
  writeLines(c(
    "@test_patient_read1",
    "ATCGATCG",
    "+",
    "IIIIIIII",
    "@test_patient_read2",
    "GTCAGTCA",
    "+",
    "IIIIIIII"
  ), fastq_file)

  # Call the function
  fastq_plot(patient_id, output_dir, n, read_length)

  # Check if the plot file is created
  expect_true(file.exists(file.path(".", paste0("fastq_plot_",patient_id,".png"))))
})
