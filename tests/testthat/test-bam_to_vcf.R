test_that("bam_to_vcf() works", {
  # Create a temporary VCF file
  #vcf_file <- tempfile(fileext = ".vcf")
  output_dir <- tempdir()
  n <- 2
  read_length <- 8
  patient_id <- "patient_123"
  sample_id <- "smp_001"
  vcf_file <- file.path(output_dir, "/", paste0(patient_id, "_", sample_id, ".vcf"))

  # Call the function
  bam_to_vcf(patient_id, sample_id, output_dir, vcf_file)

  # Check if the VCF file was created
  expect_true(file.exists(vcf_file))

  # Read the VCF file and check its contents
  vcf_lines <- readLines(vcf_file)
  expect_equal(length(vcf_lines), 7) # Header + 2 variants

  # Clean up temporary files
  unlink(vcf_file)
})


