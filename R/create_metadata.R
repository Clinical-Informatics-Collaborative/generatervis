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
#'
#' @return NULL
#' @examples
#' # create_metadata(c("patient_123", "patient_123"))
#' @export
create_metadata <- function(patient_id) {
  dir.create("cbioportal_study")
  setwd("cbioportal_study")

  # Define patient data
  patient_data <- data.frame(
    PATIENT_ID = patient_id,
    AGE = c(65, 52),
    SEX = c("Male", "Female")
  )

  # Write clinical patient data
  write.table(patient_data, "data_clinical_patient.txt", sep = "\t", row.names = FALSE, quote = FALSE)

  # Write meta file for clinical patient data
  writeLines(c(
    "cancer_study_identifier: test_study",
    "genetic_alteration_type: CLINICAL",
    "datatype: PATIENT_ATTRIBUTES",
    "data_filename: data_clinical_patient.txt"
  ), "meta_clinical_patient.txt")

  # Define cancer study metadata
  writeLines(c(
    "type_of_cancer: cancer_generic",
    "cancer_study_identifier: test_study",
    "name: Test Study",
    "description: This is a test study created via R",
    "short_name: test"
  ), "meta_study.txt")

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

  write.table(mutation_data, "data_mutations.txt", sep = "\t", row.names = FALSE, quote = FALSE, na = "")

  # Write meta file for mutation data
  writeLines(c(
    "cancer_study_identifier: test_study",
    "genetic_alteration_type: MUTATION",
    "datatype: MAF",
    "data_filename: data_mutations.txt",
    "reference_genome_id: hg19"
  ), "meta_mutations.txt")
}
