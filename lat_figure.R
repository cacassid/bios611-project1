library(tidyverse)
library(ggpubr)

counts_area_sl <- read_csv("./derived_data/counts_area_sl.csv")

lat_mammal <- ggplot(counts_area_sl, aes(x=LatCat2, y = Mammal)) + 
  geom_bar(stat = "identity", fill = "#03783D") +
  xlab("Latitude") + ylab("Number of Mammal Species")
lat_bird <- ggplot(counts_area_sl, aes(x=LatCat2, y = Bird)) + 
  geom_bar(stat = "identity", fill = "#3A9999") +
  xlab("Latitude") + ylab("Number of Bird Species")
lat_reptile <- ggplot(counts_area_sl, aes(x=LatCat2, y = Reptile)) + 
  geom_bar(stat = "identity", fill = "#86C14C") +
  xlab("Latitude") + ylab("Number of Reptile Species")
lat_fish <- ggplot(counts_area_sl, aes(x=LatCat2, y = Fish)) + 
  geom_bar(stat = "identity", fill = "#3A3B99") +
  xlab("Latitude") + ylab("Number of Fish Species")
lat_figure <- ggarrange(lat_mammal, lat_bird, lat_reptile, lat_fish,
                        labels = c("A", "B", "C", "D"),
                        ncol = 2, nrow = 2)
lat_figure

ggsave("figures/lat_figure.png",lat_figure)
saveRDS(lat_figure, "figures/lat_figure.rds")
