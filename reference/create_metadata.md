# Create metadata for cBioPortal study

This function creates a directory structure and metadata files for a
cBioPortal study. It generates clinical patient data, mutation data, and
associated metadata files. The function creates a directory named
"cbioportal_study" and writes the following files:

## Usage

``` r
create_metadata(
  patient_id,
  output_dir = paste0(tempdir(), "/cbioportal_study")
)
```

## Arguments

- patient_id:

  A vector of patient IDs to be included in the clinical data.

- output_dir:

  The directory where the metadata files will be created. Default is
  "/cbioportal_study" in the \`tempdir()\`.

## Details

\- data_clinical_patient.txt: Contains clinical patient data. -
meta_clinical_patient.txt: Metadata for clinical patient data. -
meta_study.txt: Metadata for the study. - data_mutations.txt: Contains
mutation data. - meta_mutations.txt: Metadata for mutation data.

## Examples

``` r
# create_metadata(patient_id, output_dir)
```
