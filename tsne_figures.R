library(tidyverse)

#2 clusters
lowd2 <- read.csv("derived_data/lowd2.csv", header = TRUE)
lowd2$cluster <- as.character(lowd2$cluster)
tsne2 <- ggplot(lowd2, aes(X1,X2)) + geom_point(aes(color=cluster))
tsne2

#3 clusters
lowd3 <- read.csv("derived_data/lowd3.csv", header = TRUE)
lowd3$cluster <- as.character(lowd3$cluster)
tsne3 <- ggplot(lowd3, aes(X1,X2)) + geom_point(aes(color=cluster))
tsne3

#4 clusters
lowd4 <- read.csv("derived_data/lowd4.csv", header = TRUE)
lowd4$cluster <- as.character(lowd4$cluster)
tsne4 <- ggplot(lowd4, aes(X1,X2)) + geom_point(aes(color=cluster))
tsne4

ggsave("figures/tsne2.png",tsne2)
saveRDS(tsne2, "figures/tsne2.rds")

ggsave("figures/tsne3.png",tsne3)
saveRDS(tsne3, "figures/tsne3.rds")

ggsave("figures/tsne4.png",tsne4)
saveRDS(tsne4, "figures/tsne4.rds")
