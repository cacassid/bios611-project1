library(tidyverse)

counts_area_sl <- read_csv("./derived_data/counts_area_sl.csv")

#scatterplots
scatter1 <- ggplot(counts_area_sl, aes(x=Mammal, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Mammal Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Mammal Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter1

scatter2 <- ggplot(counts_area_sl, aes(x=Mammal, y=Fish, size = Acres)) + geom_point(alpha = 1, color = "#1375A0") + 
  xlab("Number of Mammal Species") + ylab("Number of Fish Species") + 
  ggtitle("Number of Mammal Species vs Fish Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter2

scatter3 <- ggplot(counts_area_sl, aes(x=Insect, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Insect Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Insect Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
scatter3

scatter4 <- ggplot(counts_area_sl, aes(x=Amphibian, y=Fish, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Insect Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Insect Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
scatter4


