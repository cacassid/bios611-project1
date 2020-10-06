library(tidyverse)

counts_area_sl <- read_csv("./derived_data/counts_area_sl.csv")

#scatterplots
#Mammals vs Birds
scatter1 <- ggplot(counts_area_sl, aes(x=Mammal, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Mammal Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Mammal Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter1

#Mammals vs Fish
scatter2 <- ggplot(counts_area_sl, aes(x=Mammal, y=Fish, size = Acres)) + geom_point(alpha = 1, color = "#1375A0") + 
  xlab("Number of Mammal Species") + ylab("Number of Fish Species") + 
  ggtitle("Number of Mammal Species vs Fish Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter2

#Mammals vs Vascular Plants
scatter3 <- ggplot(counts_area_sl, aes(x=Mammal, y=`Vascular Plant`, size = Acres)) + geom_point(alpha = 1, color = "#C25B05") + 
  xlab("Number of Mammal Species") + ylab("Number of Vascular Plant Species") + 
  ggtitle("Number of Mammal Species vs Vascular Plant Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter3

scatter4 <- ggplot(counts_area_sl, aes(x=Mammal, y= Amphibian, size = Acres)) + geom_point(alpha = 1, color = "#C25B05") + 
  xlab("Number of Mammal Species") + ylab("Number of Vascular Plant Species") + 
  ggtitle("Number of Mammal Species vs Vascular Plant Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter4

scatter_arrange <- ggarrange(scatter1, scatter2, scatter3,
                         ncol = 1, nrow = 3)
scatter_arrange


ggsave("figures/scatter1.png",scatter1)
saveRDS(scatter1, "figures/scatter1.rds")

ggsave("figures/scatter2.png",scatter2)
saveRDS(scatter2, "figures/scatter2.rds")

ggsave("figures/scatter3.png",scatter3)
saveRDS(scatter3, "figures/scatter3.rds")

ggsave("figures/scatter_arrange.png",scatter_arrange)
saveRDS(scatter_arrange, "figures/scatter_arrange.rds")




