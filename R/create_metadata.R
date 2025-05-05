#' Create metadata for cBioPortal study
#'
#' This function creates a directory structure and metadata files for a cBioPortal study.
#' It generates clinical patient data, mutation data, and associated metadata files.
#' The function creates a directory named "cbioportal_study" and writes the following files:
#'
#' - data_clinical_patient.txt: Contains clinical patient data.
#' - meta_clinical_patient.txt: Metadata for clinical patient data.
#' - meta_study.txt: Metadata for the study.
#' - data_mutations.txt: Contains mutation data.
#' - meta_mutations.txt: Metadata for mutation data.
#'
#' @param patient_id A vector of patient IDs to be included in the clinical data.
#' @param output_dir The directory where the metadata files will be created. Default is "/cbioportal_study" in the `tempdir()`.
#' @return NULL
#' @examples
#' # create_metadata(c("patient_123", "patient_456"))
#' @export
#'
#' @importFrom utils write.table
#' @importFrom stats setNames
#' @importFrom graphics axis rect text
#' @importFrom grDevices dev.off png
create_metadata <- function(patient_id,output_dir = paste0(tempdir(),"/cbioportal_study")) {
  # Create the output directory if it doesn't exist
#  if (!dir.exists(output_dir)) {
#    dir.create(output_dir, recursive = TRUE)
#  }

  # Set working directory to the output directory
#  setwd(output_dir)

  # Define patient data
  patient_data <- data.frame(
    PATIENT_ID = patient_id,
    AGE = c(65, 52),
    SEX = c("Male", "Female")
  )

  # Write clinical patient data
  data_clinical_patient <- write.table(patient_data, file.path(output_dir, "data_clinical_patient.txt"), sep = "\t", row.names = FALSE, quote = FALSE)

  # Write meta file for clinical patient data
  meta_clinical_patient <- writeLines(c(
    "cancer_study_identifier: test_study",
    "genetic_alteration_type: CLINICAL",
    "datatype: PATIENT_ATTRIBUTES",
    "data_filename: data_clinical_patient.txt"
  ), file.path(output_dir, "meta_clinical_patient.txt"))

  # Define cancer study metadata
  meta_study <- writeLines(c(
    "type_of_cancer: cancer_generic",
    "cancer_study_identifier: test_study",
    "name: Test Study",
    "description: This is a test study created via R",
    "short_name: test"
  ), file.path(output_dir, "meta_study.txt"))

  # Define mutation data
  mutation_data <- data.frame(
    Hugo_Symbol = c("TP53", "BRCA1"),
    Entrez_Gene_Id = c(7157, 672),
    Center = c("test_center", "test_center"),
    NCBI_Build = c("GRCh37", "GRCh37"),
    Chromosome = c("17", "17"),
    Start_Position = c(7579472, 43044295),
    End_Position = c(7579472, 43044295),
    Strand = c("+", "+"),
    Variant_Classification = c("Missense_Mutation", "Nonsense_Mutation"),
    Variant_Type = c("SNP", "SNP"),
    Reference_Allele = c("C", "A"),
    Tumor_Seq_Allele2 = c("T", "G"),
    Tumor_Sample_Barcode = c("P1", "P2"),
    HGVSp_Short = c("p.R175H", "p.Q175*")
  )

  data_mutations <- write.table(mutation_data, file.path(output_dir, "data_mutations.txt"), sep = "\t", row.names = FALSE, quote = FALSE, na = "")

  # Write meta file for mutation data
  meta_mutations <- writeLines(c(
    "cancer_study_identifier: test_study",
    "genetic_alteration_type: MUTATION",
    "datatype: MAF",
    "data_filename: data_mutations.txt",
    "reference_genome_id: hg19"
  ), file.path(output_dir, "meta_mutations.txt"))

  # Define the directory for case lists
  case_lists_dir <- file.path(output_dir, "case_lists")
  if (!dir.exists(case_lists_dir)) {
    dir.create(case_lists_dir, recursive = TRUE)
  }

  # Define common elements
  #patient_ids <- paste("patient_id_123", "patient_id_456", sep = "\t")
  study_id <- "LC"

  # Define content for each file
  case_list_files <- list(
    cases_all.txt = c(
      paste0("cancer_study_identifier: ", study_id),
      "stable_id: LC_all",
      "case_list_name: All samples",
      "case_list_description: All samples (36 samples)",
      "case_list_category: all_cases_in_study",
      paste0("case_list_ids: ", paste(patient_id, collapse = " "))
    ),
    cases_cna.txt = c(
      paste0("cancer_study_identifier: ", study_id),
      "stable_id: LC_cna",
      "case_list_name: Samples with CNA data",
      "case_list_description: Samples with CNA data (34 samples)",
      "case_list_category: all_cases_with_cna_data",
      paste0("case_list_ids: ", paste(patient_id, collapse = " "))
    ),
    cases_cnaseq.txt = c(
      paste0("cancer_study_identifier: ", study_id),
      "stable_id: LC_cnaseq",
      "case_list_name: Samples with mutation and CNA data",
      "case_list_description: Samples with mutation and CNA data (34 samples)",
      "case_list_category: all_cases_with_mutation_and_cna_data",
      paste0("case_list_ids: ", paste(patient_id, collapse = " "))
    ),
    cases_sequenced.txt = c(
      paste0("cancer_study_identifier: ", study_id),
      "stable_id: LC_sequenced",
      "case_list_name: Samples with mutation data",
      "case_list_description: Samples with mutation data (34 samples)",
      "case_list_category: all_cases_with_mutation_data",
      paste0("case_list_ids: ", paste(patient_id, collapse = " "))
    )
  )

  # Write all files
  for (filename in names(case_list_files)) {
    writeLines(case_list_files[[filename]], file.path(case_lists_dir, filename))
  }

}
