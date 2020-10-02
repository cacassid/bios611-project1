#Analysis of parks data set
library(ggplot2)
library(ggpubr)
library(corrplot)
library(jtools)
library(ggstance)
library(broom.mixed)
#install.packages("jtools")
#install.packages("ggstance")
#install.packages("broom.mixed")
#install.packages("corrplot")
#install.packages("ggpubr")

#correlation matrix



#scatterplots
scatter1 <- ggplot(counts_area_sl, aes(x=Mammal, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Mammal Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Mammal Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
scatter1

scatter2 <- ggplot(counts_area_sl, aes(x=Insect, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Insect Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Insect Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
scatter2

scatter3 <- ggplot(counts_area_sl, aes(x=Amphibian, y=Fish, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Insect Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Insect Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
scatter3

ggplot(species_counts_all, aes(x=Reptile, y=Fish)) + geom_point()
ggplot(species_counts_all, aes(x=Algae, y=Bird)) + geom_point()
ggplot(species_counts_all, aes(x=Fish, y=Bird)) + geom_point()

ggplot(species_counts_all, aes(x=`Vascular Plant`, y=`Nonvascular Plant`)) + geom_point()

ggplot(counts_area, aes(x=Mammal, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Acres, y=Mammal)) + geom_point()
ggplot(counts_area, aes(x=Acres, y=Bird)) + geom_point()

#Lattitude
ggplot(counts_area, aes(x=Mammal, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Latitude, y=Mammal)) + geom_point()
ggplot(counts_area, aes(x=Bird, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Fish, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=`Vascular Plant`, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=`Nonvascular Plant`, y=Latitude)) + geom_point()

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

#boxplot
#vascular plant by size categories
proposal3 <- ggplot(counts_area_sl, aes(x=Size, y=`Vascular Plant`, fill = Size)) + 
  geom_boxplot(alpha = 0.8, show.legend = FALSE) +
  xlab("Size Category") + ylab("Number of Vascular Plant Species") +
  ggtitle("Number of Vascular Plant Species by Park Size") +
  scale_color_manual(values=c('#0A684A','#11C28A', '#11C244', '#59ED09')) +
  scale_fill_manual(values=c('#0A684A','#11C28A', '#11C244', '#59ED09'))
proposal3

#color pallette
c('#8C7B42', '#788C42', '#538C42', '#428C56', '#428C7B', '#42788C')


#conservation analysis
conserv1 <- ggplot(conservation_park_info, aes(x=`No Concern`)) + geom_histogram()
conserv1

ggplot(conservation, aes(Park.Name, fill = Conservation.Status)) +
  geom_bar()



#glm
fit <- glm(Mammal~Bird+Acres+Insect,data=counts_area_sl)
summary(fit)
fit2 <- glm(Mammal~Bird+Acres,data=counts_area_sl)
summary(fit2)
fit3 <- glm(Mammal~Bird+Insect,data=counts_area_sl)
summary(fit3)
fit4 <- glm(Mammal~Latitude^2+Latitude,data=counts_area_sl)
summary(fit4)

plot_summs(fit, fit2, fit3, scale = TRUE)

#export_summs(fit, fit2, scale = TRUE)


#density of species

