library(tidyverse)

species <- read.csv("./source_data/species.csv")
parks <- read.csv("./source_data/datasets_670_1306_parks.csv")

## clean datasets 

write.csv(species, "derived_data/species.csv")
write.csv(parks, "derived_data/datasets_670_1306_parks.csv")