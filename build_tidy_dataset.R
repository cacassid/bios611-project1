library(tidyverse)

species <- read.csv("source_data/species.csv")
parks <- read.csv("source_data/datasets_670_1306_parks.csv")

## clean data sets 
parks$Acres <- as.numeric(parks$Acres)
parks$Latitude <- as.numeric(parks$Latitude)
parks$Longitude <- as.numeric(parks$Longitude)

#generate counts of species types for each park
species_counts_acadia <- species %>% filter(Park.Name == "Acadia National Park") %>% 
  group_by(Category) %>% count()

species_counts_arches <- species %>% filter(Park.Name == "Arches National Park") %>% 
  group_by(Category) %>% count()

species_counts_channel <- species %>% filter(Park.Name == "Channel Islands National Park") %>% 
  group_by(Category) %>% count()

s1 <- species %>% group_by(Park.Name, Category) %>% tally()

species_counts_all <- s1 %>% spread(data=s1, key=Category, value=n)

#convert to numeric 
species_counts_all$Algae <- as.numeric(as.character(species_counts_all$Algae))
species_counts_all$Amphibian <- as.numeric(as.character(species_counts_all$Amphibian))
species_counts_all$Bird <- as.numeric(as.character(species_counts_all$Bird))
species_counts_all$`Crab/Lobster/Shrimp` <- as.numeric(as.character(species_counts_all$`Crab/Lobster/Shrimp`))
species_counts_all$Fish <- as.numeric(as.character(species_counts_all$Fish))
species_counts_all$Fungi <- as.numeric(as.character(species_counts_all$Fungi))
species_counts_all$Insect <- as.numeric(as.character(species_counts_all$Insect))
species_counts_all$Invertebrate <- as.numeric(as.character(species_counts_all$Invertebrate))
species_counts_all$Mammal <- as.numeric(as.character(species_counts_all$Mammal))
species_counts_all$`Nonvascular Plant` <- as.numeric(as.character(species_counts_all$`Nonvascular Plant`))
species_counts_all$Reptile <- as.numeric(as.character(species_counts_all$Reptile))
species_counts_all$`Slug/Snail` <- as.numeric(as.character(species_counts_all$`Slug/Snail`))
species_counts_all$`Spider/Scorpion` <- as.numeric(as.character(species_counts_all$`Spider/Scorpion`))
species_counts_all$`Vascular Plant` <- as.numeric(as.character(species_counts_all$`Vascular Plant`))


#replace NA with 0
species_counts_all[is.na(species_counts_all)] <- 0

#merge species counts w/ size data
counts_area <- left_join(species_counts_all, parks)
#make small, medium, large park size variable
#get tertiles
quantile(counts_area$Acres, c(.25, .50, .75)) 
counts_area <- counts_area %>% mutate(Size = 
                                        ifelse(Acres > 323431, "Small", "Large"))
counts_area_sl <- counts_area %>% mutate(Size = Acres)
counts_area_sl$Size <- ifelse(counts_area$Acres < 69010.5, "Small", 
                              ifelse(counts_area$Acres < 238764.5, "Medium", 
                                     ifelse(counts_area$Acres < 817360.2, "Large", "Extra Large")))

counts_area_sl$LatCat2 <- ifelse(counts_area_sl$Latitude < 25, "<25", 
                          ifelse(counts_area_sl$Latitude < 30, "25-30", 
                          ifelse(counts_area_sl$Latitude < 35, "30-35", 
                          ifelse(counts_area_sl$Latitude < 40, "35-40", 
                          ifelse(counts_area_sl$Latitude < 45, "40-45", 
                          ifelse(counts_area_sl$Latitude < 50, "45-50", 
                          ifelse(counts_area_sl$Latitude < 55, "50-55",
                          ifelse(counts_area_sl$Latitude < 60, "55-60",
                          ifelse(counts_area_sl$Latitude < 65, "60-65",">65"))))))))) 

write_csv(counts_area_sl, "derived_data/counts_area_sl.csv")
