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
RjouRnal <- tidyfeed("https://journal.r-project.org/rss.atom")
# rss/xml:
news_tbd<- tidyfeed("http://fivethirtyeight.com/all/feed")
# jsonfeed:
firebal <- tidyfeed("https://daringfireball.net/feeds/json")
## End(Not run)


When exploring RSS technology with the R programming language, a nice end product to have in mind could be an application or tool that can:

1. **Fetch and Parse RSS Feeds**: Your application should be able to fetch data from various RSS feeds and parse it into a usable format (e.g., a dataframe).

2. **Analyze Content**: You might want your tool to analyze the content of the articles, such as counting keywords, sentiment analysis, or topic modeling.

3. **Visualize Data**: Visualizing the data can help in understanding trends over time, popularity of certain topics, and more. This could include plots like timelines for when articles were published, word clouds showing popular terms, etc.

4. **Alert System**: Implementing an alert system that notifies you or others about new content based on specific criteria (e.g., keywords, categories) can be very useful.

5. **User Interface**: If your application is intended to interact with users directly, a user-friendly interface could make it more accessible and enjoyable to use.

6. **Integration Capabilities**: Your tool might need to integrate with other systems or services for additional functionality (e.g., storing data in a database, sending notifications via email).

7. **Scalability**: Ensure that your application can handle multiple RSS feeds efficiently and scale as the number of users increases.
- **Automated Research Feed** – Aggregate RSS feeds from academic journals, GIS updates, or AI blogs, then filter and categorize them for easy reference.

- **Data-Driven RSS Analytics** – Use R to track trends in RSS content, visualize publication frequency, and analyze metadata with `ggplot2` or `shiny`.

- **Custom RSS Reader** – Build an interactive RSS dashboard using `tidyRSS` and `DT` to display articles in a structured format.

-
  **Email Alerts for New Content** – Automate notifications when new articles match specific keywords, integrating with email scripting.
- 
  **RSS-Powered Database** – Store and categorize RSS feed data in a structured database (e.g., Microsoft Access or SQLite) for retrieval and analysis.


By focusing on these aspects, you can create a comprehensive tool that not only fetches and parses RSS feeds but also provides valuable insights and functionality to its users.


Absolutely! If you're exploring **RSS technology** with **R programming**, here are some compelling end products to aim for:


If you're interested in building a **custom RSS reader**, [this guide](https://www.infoworld.com/article/2337738/how-to-create-your-own-rss-reader-with-r.html) walks through the process using R. 