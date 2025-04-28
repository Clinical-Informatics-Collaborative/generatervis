test_that("rreads() works", {
  # Test with a single patient ID
  patient_id <- "patient_123"
  n <- 5
  read_length <- 8
  observed <- rreads(patient_id, n, read_length)

  # Check the number of lines in the output
  expect_equal(length(observed), n * 4)  # 4 lines per read

  # Check the format of the output
  for (i in 1:n) {
    expect_equal(observed[(4*i - 3)], paste0("@", patient_id, "_read", i)) # Line 1: Sequence ID
    expect_match(observed[(4*i - 2)], "^[ATGC]{8}$")                     # Line 2: Random DNA sequence
    expect_equal(observed[(4*i - 1)], "+")                                # Line 3: Separator
    expect_equal(observed[(4*i)], paste(rep("I", read_length), collapse = "")) # Line 4: Quality scores
  }
})

test_that("rreads() handles different read lengths", {
  # Test with a different read length
  patient_id <- "patient_456"
  n <- 3
  read_length <- 10
  observed <- rreads(patient_id, n, read_length)

  # Check the number of lines in the output
  expect_equal(length(observed), n * 4)  # 4 lines per read

  # Check the format of the output
  for (i in 1:n) {
    expect_equal(observed[(4*i - 3)], paste0("@", patient_id, "_read", i)) # Line 1: Sequence ID
    expect_match(observed[(4*i - 2)], "^[ATGC]{10}$")                    # Line 2: Random DNA sequence
    expect_equal(observed[(4*i - 1)], "+")                                # Line 3: Separator
    expect_equal(observed[(4*i)], paste(rep("I", read_length), collapse = "")) # Line 4: Quality scores
  }
})
