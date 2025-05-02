test_that("fastq_to_bam() works", {
  # Create a temporary FASTQ file
  fastq_file <- tempfile(fileext = ".fastq")
  writeLines(c(
    "@SEQ_ID_1",
    "GATTACA",
    "+",
    "IIIIIII",
    "@SEQ_ID_2",
    "CAGTACG",
    "+",
    "IIIIIII"
  ), fastq_file)

  # Create a temporary SAM file
  sam_file <- tempfile(fileext = ".sam")

  # Call the function
  fastq_to_bam(fastq_file, sam_file, reference = "chr1")

  # Check if the SAM file was created
  expect_true(file.exists(sam_file))

  # Read the SAM file and check its contents
  sam_lines <- readLines(sam_file)
  expect_equal(length(sam_lines), 6) # Header + 2 reads

  # Clean up temporary files
  unlink(c(fastq_file, sam_file))
})








