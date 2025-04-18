#' Title
#'
#' @param n_pat Number of patients
#' @param n_samp Number of samples
#'
#' @returns A vector of file names
#' @importFrom utils write.csv
#' @export
#' @examples
#' n_pat <- 3
#' n_samp <- 3
#' create_file(n_pat,n_samp)
create_file <- function(n_pat, n_samp)
{
  count_pat <- 0
  count_samp <- 0
  file_name_raw <- c()
  file_name_processed <- c()
  file_name_summarised <- c()
  if(n_pat==n_samp)
  {
  for(count_pat in 1:n_pat)
  {
    for(count_samp in 1:n_samp)
    {
     file_name_raw[count_pat] <- paste0("data_patient_",count_pat,"_sample_",count_samp,".fastq")
     file_name_processed[count_pat] <- paste0("data_patient_",count_pat,"_sample_",count_samp,".cram")
     file_name_summarised[count_pat] <- paste0("data_patient_",count_pat,"_sample_",count_samp,".vcf")
    }
  }
  }else{print("Number of patients and number of samples are not equal. The function only processes the scenario where there is only one sample per patient")}
file_names <- c(file_name_raw,file_name_processed,file_name_summarised)
write.csv(file_names,file = "File_Names.csv", append=FALSE, sep = " ")
}
