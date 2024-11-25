## ---------------------------
## Script name: genomic data analysis
## Purpose of script: functions required to access genomic data with r-bioinformatics
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


## ---------------------------

## load up the packages we will need:  (uncomment as required)
require(tidyverse)
require(data.table)

# source("functions/packages.R")       # loads up all the packages we need

## ---------------------------

## load up our functions into memory

# source("functions/summarise_data.R") 


## ---------------------------


#National Center for Biotechnology Information (NCBI) - NCBI provides access to a vast collection of molecular biology, 
#genetics, and genomics data through resources like GenBank, PubMed, and BioProject databases. These open-access databases
#contain genetic sequence information, scientific literature references, and project summaries for thousands of organisms.

#bioinformatics with R

pacman::p_load("seqinr")


#To retrieve a sequence with a particular NCBI accession, you can use R function “getncbiseq()” below
getncbiseq <- function(accession)
{
  require("seqinr") # this function requires the SeqinR R package
  # first find which ACNUC database the accession is stored in:
  dbs <- c("genbank","refseq","refseqViruses","bacterial")
  numdbs <- length(dbs) for (i in 1:numdbs){
    db <- dbs[i]
    choosebank(db)
    # check if the sequence is in ACNUC database 'db':
    resquery <- try(query(".tmpquery", paste("AC=", accession)), silent = TRUE)
    if (!(inherits(resquery, "try-error")))
    {
      queryname <- "query2"
      thequery <- paste("AC=",accession,sep="")
      query(`queryname`,`thequery`)
      # see if a sequence was retrieved:
      seq <- getSequence(query2$req[[1]])
      closebank()
      return(seq)
    }
    closebank()
  }
  print(paste("ERROR: accession",accession,"was not found"))
}
#original function from notebok returning errors rewrote function using hermes 2 mistral, still returning error

getncbiseq <- function(accession) {
  require("seqinr") # this function requires the SeqInR R package
  
  dbs <- c("genbank", "refseq", "refseqViruses", "bacterial")
  numdbs <- length(dbs)
  
  for (i in 1:numdbs) {
    db <- dbs[i]
    
    choosebank(db)
    
    # check if the sequence is in ACNUC database 'db':
    resquery <- try(query(".tmpquery", paste("AC=", accession)), silent = TRUE)
    
    if (!(inherits(resquery, "try-error"))) {
      
      queryname <- "query2"
      thequery <- paste("AC=", accession, sep="")
      
      query(queryname = queryname, thequery = thequery)
      
      # see if a sequence was retrieved:
      seq <- getSequence(query2$req[[1]])
      
      closebank()
      
      return(seq)
    } else {
      closebank()
    }
  }
  
  print(paste("ERROR: accession", accession, "was not found"))
}

#i asked mistral hermes to write a simple script to pull the genomic data

# Loading required package: SeqInR
# Specify the accession number of the sequence you want to retrieve.
accessions <- c("NM_001234567", "NC_000967")

for (accession in accessions) {
  choosebank("genbank") # Choose GenBank database
  
  queryname <- "query2"
  thequery <- paste("AC=", accession, sep="")
  
  resquery <- try(query(".tmpquery", thequery), silent = TRUE)
  
  if (!(inherits(resquery, "try-error")))) {
    # Retrieve and print the sequence.
    seq <- getSequence(query2$req[[1]])
    cat("> ", accession, "\n")
    cat(seq, "\n\n")
  } else {
    print(paste("ERROR: Accession", accession, "not found"))
  }

closebank() # Close the database connection.
}


### kaggle gene identification analysis

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("Biostrings"))

## load libraries
library("tidyverse")  # metapackage with lots of helpful functions
library("seqinr")     # package for working with fasta files 
library("gridExtra")  # for arranging plots
library("Biostrings") 
library("repr")


# to get the DEN-1 Dengue virus (accession NC_001477):
  
dengueseq <- getncbiseq("NC_001477")

