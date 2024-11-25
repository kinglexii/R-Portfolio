## ---------------------------
## Script name: genomic data analysis
## Purpose of script: 
## Author: Alexandra Akaakar, MSC.
## Date Created: 2024-06-19
##
## Copyright (c) optimus_prime, 2024
## Email: lexiiakaakar@gmail.com
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

## set working directory for Mac and PC
# this is a gene identification sample exercise using https://www.kaggle.com/code/sinaasappel/sars-cov-2-gene-identification/notebook
# and the litle book of R for bioinformatics https://a-little-book-of-r-for-biomedical-statistics.readthedocs.io/en/latest/src/biomedicalstats.html#

## ---------------------------

## load up the packages we will need:  (uncomment as required)
require(tidyverse)
require(data.table)

# source("functions/packages.R")       # loads up all the packages we need

## ---------------------------

## load up our functions into memory

# source("functions/summarise_data.R") 


## ---------------------------

#intall packages and load library

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("Biostrings"))


library("tidyverse")  # metapackage with lots of helpful functions
library("seqinr")     # package for working with fasta files 
library("gridExtra")  # for arranging plots
library("Biostrings") 
library("repr")
