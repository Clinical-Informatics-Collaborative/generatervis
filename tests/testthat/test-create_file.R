test_that("checking function create_file()", {
  n_pat <- 2
  n_samp <- 2
  observed <- create_file(n_pat, n_samp)
  expected <- c("data_patient_1_sample_1.fastq", "data_patient_1_sample_2.fastq",
                "data_patient_2_sample_1.fastq",
                "data_patient_2_sample_2.fastq",
                "data_patient_1_sample_1.cram",
                "data_patient_1_sample_2.cram",
                "data_patient_2_sample_1.cram",  "data_patient_2_sample_2.cram",
                "data_patient_1_sample_1.vcf",   "data_patient_1_sample_2.vcf",
               "data_patient_2_sample_1.vcf",
                "data_patient_2_sample_2.vcf")
  expect_equal(observed, expected)
})
