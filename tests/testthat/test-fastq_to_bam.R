test_that("fastq_to_bam() works", {

  patient_id <- "patient_123"
  sample_id <- "smp_001"
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

  # Call the function
  fastq_to_bam(fastq_file, patient_id, sample_id, output_dir = tempdir(), reference = "chr1")

  # Check if the SAM file is created
  sam_file <- file.path(tempdir(), paste0(patient_id, "_", sample_id, ".sam"))
  expect_true(file.exists(sam_file))

  # Check if the SAM file has the expected content
  sam_content <- readLines(sam_file)
  expect_true(grepl("@HD\tVN:1.6\tSO:unsorted", sam_content[1]))
  expect_true(grepl(paste0("@SQ\tSN:chr1\tLN:1000000"), sam_content[2]))
  expect_true(grepl("@RG", sam_content[3]))
  expect_true(grepl("@PG", sam_content[4]))

  # Cleanup temporary files
  unlink(sam_file)
  unlink(fastq_file)
})








