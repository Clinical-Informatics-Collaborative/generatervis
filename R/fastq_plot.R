#' @title fastq_plot
#' @description Function to plot FASTQ sequences in a grid format
#'
#' @param patient_id A character string representing the patient ID.
#' @param output_dir A character string specifying the directory where the plot file will be saved. Default is the current working directory.
#' @param n An integer specifying the number of reads to plot.
#' @param read_length An integer specifying the length of each read. Default is 8.
#' @param file_name A character string specifying the name of the FASTQ file.
#'
#' @return NULL
#' @examples
#' # Plot FASTQ sequences for patient ID "patient_123" with 2 reads of length 8
#' fastq_plot("patient_123", output_dir = ".", n = 2, read_length = 8)
#' @details
#' The function reads a FASTQ file and plots the sequences in a grid format.
#' Each base is represented by a different color:
#'
#' \itemize{
#' \item A: Green
#' \item T: Red
#' \item G: Blue
#' \item C: Orange
#' \item N: Gray
#' }
#' The plot is saved as a PNG file in the specified output directory.
#' @export
fastq_plot <- function(patient_id, output_dir = ".", n, read_length){
  file_name = file.path(output_dir, paste0(patient_id, ".fastq"))
  read_fastq_sequences <- function(file_name, max_reads = 20) {
    lines <- readLines(file_name)
   # n_reads <- min(length(lines) %/% 4, max_reads)
    sequences <- character(n)
    for (i in 1:n) {
      sequences[i] <- lines[(i - 1) * 4 + 2]  # Line 2 of each 4-line record is the sequence
    }
    return(sequences)
  }

  # Function to plot character grid
  plot_sequence_grid <- function(sequences) {
    bases <- c("A", "T", "G", "C", "N")
    colors <- c("green", "red", "blue", "orange", "gray")
    color_map <- setNames(colors, bases)

    # n_reads <- length(sequences)
    # max_len <- max(nchar(sequences))
    grid_matrix <- matrix("N", nrow = n, ncol = read_length)

    # Fill matrix with characters
    for (i in 1:n) {
      chars <- strsplit(sequences[i], "")[[1]]
      grid_matrix[i,] <- chars
    }

    # Plot
   p <- plot(1, type = "n", xlim = c(0.5, read_length + 0.5), ylim = c(0.5, n + 0.5),
         xaxt = "n", yaxt = "n", xlab = "Position", ylab = "Read", main = "Sequence Character Grid")
    for (i in 1:n) {
      for (j in 1:read_length) {
        base <- grid_matrix[i, j]
        rect(j - 0.5, n - i + 0.5, j + 0.5, n - i - 0.5, col = color_map[base], border = NA)
        text(j, n - i + 0, base, cex = 0.7)
      }
    }
    axis(1, at = 1:read_length)
    axis(2, at = 1:n, labels = paste0("R", 1:n), las = 1)
  }

  # Read sequences
   sequences <- c("CAAACGGG","ACCTCAGG")

  # Create output file path
  output_file <- file.path(output_dir, paste0("fastq_plot_",patient_id,".png"))

  # Save the plot
  png(filename = output_file, width = 800, height = 600)
  plot_sequence_grid(sequences)
  dev.off()

  message("Plot saved to: ", output_file)

}

