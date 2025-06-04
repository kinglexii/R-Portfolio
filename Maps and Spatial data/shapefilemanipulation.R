## ---------------------------
##
## Script name: gis shapefile m,anipulation kconnect/rmf
##
## Purpose of script:
##
## Author: Alexandra Akaakar
##
## Date Created: 2025-03-17
##
## Copyright (c) Optimus_prime, 2024 2025
## Email: akaakara@gvsu.edu
##
## ---------------------------
##
## Notes:
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

pacman::p_load(c("rmapshaper", 
                 "tigris", 
                 "sf",
                 "tmap", 
                 "areal",
                 "leaflet", 
                 "RColorBrewer",
                 "raster", 
                 "rasterVis"))
# source("functions/packages.R")       # loads up all the packages we need

## ---------------------------

## load up our functions into memory
# source("//office/dfs/Philanthropy-Private/AKAAKARA/MyData/My Documents/aRsenal/functions_R.R", echo=TRUE) 
# source("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/DATA QUALITY AA/3. Working Files/dataqualitycheck/phase 1/data_quality_functions.R")
## ---------------------------

## ---------------------------


#load in michigan shapefile with tract level data and geoid
mi_tract_shp <- sf::st_read("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/Ruth Mott Foundation - 2021-2025 Dashboard Maintenance/3. Working Files/QA/Park Proximity/cb_2023_26_tract_500k/cb_2023_26_tract_500k.shp")
#plot geometry of census tracts in michigan
plot(mi_tract_shp$geometry)

#select shp data for genesee
genesee_tract_shp <- mi_tract_shp %>% filter(NAMELSADCO == "Genesee County")  %>% as.data.frame()
#plot geometry of census tracts in michigan
plot(genesee_tract_shp$geometry, col = "#f2f2f2", bg = "skyblue", lwd = 0.25, border = 0)

#load shapefiles for genesee parks
geneseeparkdata <- sf::st_read("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/Ruth Mott Foundation - 2021-2025 Dashboard Maintenance/3. Working Files/GIS/Park_Proximity/genesee_parks.shp")
#plot geometry of genesee county parks, use add true to add to genesee plot
plot(geneseeparkdata$geometry, add=TRUE)

#load michigan population by tract
mi_tract_pop <- readxl::read_excel("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/Ruth Mott Foundation - 2021-2025 Dashboard Maintenance/3. Working Files/QA/Park Proximity/ACSDT5Y2023.B01003-2025-03-12T221934.xlsx", 
                                   sheet = "Sheet1")  %>% 
  #seperation does not keep the original column. will do for now
  separate(Label, into= c("Tract","County","State"), sep = ";")



#select genesee county tract population, to specify the word boundary, use \\b at the start
genesee_pop_acs <- mi_tract_pop %>% filter(str_detect(County, regex("\\bGenesee", ignore_case = TRUE)))%>% mutate(NAME = str_sub(Tract, 13,-1)) %>% as.data.frame() 


#join shp and acs data
genesee_pop_shp <- bind_cols(genesee_tract_shp, genesee_pop_acs,.id = 'NAME')
plot(genesee$geometry) %>% 
  geom_sf(fill = "Total", color = "red") 

ggplot(genesee_pop_shp$geometry) + geom_sf(fill = 'red' )


#create a map of genesee, tag it by population of census tract
genessemap <- ggplot() + 
  geom_sf(data=genesee_pop_shp, aes(geometry = geometry, fill = as.numeric(genesee_pop_shp$`Total`))) + 
  geom_sf(data = geneseeparkdata, aes(geometry = geometry))

#make the map interactive
fig_ <- plotly::ggplotly(genessemap)

michigancensusblockgroup <- sf::st_read("//office/dfs/Philanthropy-Private/AKAAKARA/MyData/My Documents/aRsenal/cb_2018_26_bg_500k/cb_2018_26_bg_500k.shp")
plot(michigancensusblockgroup$geometry, add = TRUE)


usmajororads <- sf::st_read("//office/dfs/Philanthropy-Private/AKAAKARA/MyData/My Documents/GitHub/R-Portfolio/Maps and Spatial data/us_primary_roads/tl_2024_us_primaryroads.shp")
usmajororadmap<- ggplot() + geom_sf(data = usmajororads[] ,aes(geometry = geometry)) + 
  geom_sf(data = geneseeparkdata, aes(geometry = geometry))
fig_1 <- plotly::ggplotly(usmajororadmap)


geneseecensusblock <- michigancensusblockgroup %>% filter(COUNTYFP == '049')


kentdata <-join_by()kentdata <- data %>% filter(NAMELSADCO== "Kent County")kentdata <- data %>% filter(NAMELSADCO== "Kent County")Tract
plot(kentdata$geometry)


plot(geneseedata$geometry)

#code to split columns. needs work
mutate( stringr::str_split_fixed(as.character(mi_tract_pop$Label),';',3))

mi_tract_data <- mi_tract_pop %>% separate(Label, into= c("Tract","County","State"), sep = ";")

