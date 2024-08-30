## ---------------------------
## Script name: Mother of all functions, bringer of relief
## Purpose of script: to dominate file transformations
## Author: Alexandra Akaakar
## Date Created: 2024-04-06
##
## Copyright (c) Optimus_prime, 2024
## Email: akaakara@gvsu.edu
##
## ---------------------------
##
## Notes:
##  
##
## ---------------------------

#windows run comand for rstudio ts %localappdata%\RStudio

##--------------------------------------------------

#data_quality_report function


generate_reports <- function(dataframe, path) {
  # Load necessary libraries
  require(dlookr)
  require(tidyverse) #need pipe
  require(data.table)
  require(dlookr)
  require(dplyr)
  
  # Assertion tests
  if (!is.data.frame(dataframe)) {
    stop("The provided data object is not a dataframe.")
  }
  
  # Check if the specified path exists, if not create it
  if (!dir.exists(path)) {dir.create(path, recursive = TRUE)}
  
  
  # Generating reports  
  all_diagnostic <- dlookr::diagnose(dataframe) %>% as.data.frame()
  numeric_diagnostics <- dlookr::diagnose_numeric(dataframe) %>% as.data.frame()
  categorical_diagnostics <- dlookr::diagnose_category(dataframe) %>% as.data.frame()
  outlier_diagnostic <- dlookr::diagnose_outlier(dataframe) %>% as.data.frame()
  
  report_list <- list(All_diagnostic = all_diagnostic, 
                      Numeric_diagnostics = numeric_diagnostics,
                      Categorical_diagnostics = categorical_diagnostics, 
                      Outlier_diagnostic = outlier_diagnostic)
  
  # Save the diagnostics as CSV files in the specified path
  for (name in names(report_list)) {
    file_path <- file.path(path, paste0(name, "_", format(Sys.time(), '%d-%m-%Y_%H%M%S'), ".csv"))
    write.csv(report_list[[name]], file_path, row.names = FALSE)
  }
  
  message("REPORTS SUCCESSFULLY OUTPUT")
}

