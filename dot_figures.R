library(tidyverse)

conservation_park_info <- read_csv("./derived_data/conservation_park_info.csv")

#dot plot
conservation_park_info2 <- conservation_park_info[order(conservation_park_info$Endangered), ]
conservation_park_info2$Park.Name <- factor(conservation_park_info2$Park.Name, levels = conservation_park_info2$Park.Name) 

dot_plot_e <- ggplot(conservation_park_info2, aes(x=Park.Name, y=Endangered)) + 
  geom_point(col="red", size=3) + 
  geom_segment(aes(x=Park.Name, 
                   xend=Park.Name, 
                   y=min(Endangered), 
                   yend=max(Endangered)), 
               linetype="dashed", 
               size=0.1) +   
  xlab("Park") + ylab("Number of Species") +
  labs(title="Endangered Species in US National Parks") +  
  coord_flip()
dot_plot_e

conservation_park_info3 <- conservation_park_info[order(conservation_park_info$`Species of Concern`), ]
conservation_park_info3$Park.Name <- factor(conservation_park_info3$Park.Name, levels = conservation_park_info3$Park.Name)

dot_plot_c <- ggplot(conservation_park_info3, aes(x=Park.Name, y=`Species of Concern`)) + 
  geom_point(col="orange", size=3) + 
  geom_segment(aes(x=Park.Name, 
                   xend=Park.Name, 
                   y=min(`Species of Concern`), 
                   yend=max(`Species of Concern`)), 
               linetype="dashed", 
               size=0.1) +   
  xlab("Park") + ylab("Number of Species") +
  labs(title="Species of Concern in US National Parks") +  
  coord_flip()
dot_plot_c

ggsave("figures/dot_plot_e.png",dot_plot_e)
saveRDS(dot_plot_e, "figures/dot_plot_e.rds")

ggsave("figures/dot_plot_c.png",dot_plot_c)
saveRDS(dot_plot_c, "figures/dot_plot_c.rds")

