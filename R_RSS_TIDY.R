## ---------------------------
##
## Script name: r rss script
##
## Purpose of script: parse RSS data in R
##
## Author: Alexandra Akaakar
##
## Date Created: 2025-05-28
##
## Copyright (c) Optimus_prime, 2024 2025
## Email: akaakara@gvsu.edu
##
## ---------------------------
##
## Notes: With the objective of including data from RSS feeds into your analysis, 'tidyRSS' parses RSS, Atom and JSON feeds and returns a tidy data frame.
##   
##
## ---------------------------

## set working directory for Mac and PC

setwd(" ")    

## ---------------------------


## ---------------------------

## load up the packages we will need:  (uncomment as required)

require(tidyverse)
require(data.table)
# source("functions/packages.R")       # loads up all the packages we need

## ---------------------------

## load up our functions into memory
# source("//office/dfs/Philanthropy-Private/AKAAKARA/MyData/My Documents/aRsenal/functions_R.R", echo=TRUE) 
# source("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/DATA QUALITY AA/3. Working Files/dataqualitycheck/phase 1/data_quality_functions.R")
## ---------------------------

## ---------------------------
#Install and Load the Necessary Package:
install.packages("tidyRSS")
library(tidyRSS)


#Fetch and Parse the RSS Feed:
rss_data <- tidyfeed("https://link-springer-com.ezproxy.gvsu.edu/search.rss?new-search=true&query=&facet-discipline=%22Mathematics%22&sortBy=newestFirst")

# View the first few entries
head(rss_data)

#Extract Useful Information:
  articles <- data.frame(
    title = rss_data$title,
    link = rss_data$link,
    description = rss_data$description,
    pub_date = rss_data$pubDate
  )

### Print first few articles
print(head(articles))



## Not run:
# Atom feed:
RjouRnal <- tidyfeed("http://journal.r-project.org/rss.atom")
# rss/xml:
news_tbd<- tidyfeed("http://fivethirtyeight.com/all/feed")
# jsonfeed:
tidyfeed("https://daringfireball.net/feeds/json")
## End(Not run)
