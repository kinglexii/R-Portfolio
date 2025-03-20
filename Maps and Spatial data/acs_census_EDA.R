## ---------------------------
##
## Script name: census geographic dats
##
## Purpose of script:
##
## Author: Alexandra Akaakar
##
## Date Created: 2025-03-11
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
# source("functions/packages.R")       # loads up all the packages we need

## ---------------------------

## load up our functions into memory
# source("//office/dfs/Philanthropy-Private/AKAAKARA/MyData/My Documents/aRsenal/functions_R.R", echo=TRUE) 
# source("//office.ads.gvsu.edu/dfs/Philanthropy-Data/PROJECTS/Active/DATA QUALITY AA/3. Working Files/dataqualitycheck/phase 1/data_quality_functions.R")
## ---------------------------

## ---------------------------


library(tigris)

st <- states()

plot(st$geometry)

MI_counties <- counties("MI")

plot(MI_counties$geometry)

mi_water <- area_water("MI","Kent")
plot(mi_water$geometry)


mi_tracts <- tracts("MI", "Kent")

plot(mi_tracts$geometry)


dc_landmarks <- landmarks("DC", type = "point")

plot(dc_landmarks$geometry)

mi_roads <- primary_secondary_roads("MI")

plot(mi_roads$geometry)



mi_block_groups <- block_groups("MI")

plot(mi_block_groups$geometry)


library(ggplot2)

ggplot(MI_counties) + 
  geom_sf()


ggplot(st) + 
  geom_sf()+ 
  theme_void()




library(patchwork) #digdeep

mi_block_groups <- block_groups("MI", "Kent")

gg1 <- ggplot(mi_tracts) + 
  geom_sf() + 
  theme_void() + 
  labs(title = "Census tracts")

gg2 <- ggplot(mi_block_groups) + 
  geom_sf() + 
  theme_void() + 
  labs(title = "Block groups")

gg1 + gg2




library(mapview)

mapview(mi_tracts)

#compare cartographic boundaries
mi_counties <- counties("MI")
mi_counties_cb <- counties("MI", cb = TRUE)

mi_tiger_gg <- ggplot(mi_counties) + 
  geom_sf() + 
  theme_void() + 
  labs(title = "TIGER/Line")

mi_cb_gg <- ggplot(mi_counties_cb) + 
  geom_sf() + 
  theme_void() + 
  labs(title = "Cartographic boundary")

mi_tiger_gg + mi_cb_gg



options(tigris_use_cache = TRUE)

rappdirs::user_cache_dir("tigris")



library(tidyverse)
library(patchwork)
library(glue)

yearly_plots <- map(seq(1990, 2020, 10), ~{
  year_tracts <- tracts("MI", "Kent", year = .x,
                        cb = TRUE)
  
  ggplot(year_tracts) + 
    geom_sf() + 
    theme_void() + 
    labs(title = glue("{.x}: {nrow(year_tracts)} tracts"))
})



(yearly_plots[[1]] + yearly_plots[[2]]) / 
  (yearly_plots[[3]] + yearly_plots[[4]])



ggplot(mi_counties) + 
  geom_sf() + 
  coord_sf(crs = 3087)



#tidycensus exploration