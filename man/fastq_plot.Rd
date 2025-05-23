% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fastq_plot.R
\name{fastq_plot}
\alias{fastq_plot}
\title{fastq_plot}
\usage{
fastq_plot(patient_id, output_dir = tempdir(), n, read_length)
}
\arguments{
\item{patient_id}{A character string representing the patient ID.}

\item{output_dir}{A character string specifying the directory where the plot file will be saved.}

\item{n}{An integer specifying the number of reads to plot.}

\item{read_length}{An integer specifying the length of each read. It should be a multiple of 4. Default is 8.}
}
\description{
Function to plot nucleotide sequences from a raw `.fastq` file in a grid format
}
\details{
The function reads a `.fastq` file and plots the sequences in a grid format.
Each base is represented by a different color:

\itemize{
\item A: Green
\item T: Red
\item G: Blue
\item C: Orange
\item N: Gray
}
The plot is saved as a PNG file in the specified output directory.
}
\examples{
# Plot nucleotide sequences for patient ID "patient_123" with 2 reads of length 8
fastq_plot("patient_123", output_dir = tempdir(), n = 2, read_length = 8)
}
