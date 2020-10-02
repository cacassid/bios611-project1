#Analysis of parks data set
library(ggplot2)
library(ggpubr)
library(corrplot)
library(jtools)
library(ggstance)
library(broom.mixed)
library(scales)
library(olsrr)
#install.packages("jtools")
#install.packages("ggstance")
#install.packages("broom.mixed")
#install.packages("corrplot")
#install.packages("ggpubr")
#install.packages("olsrr")

#correlation matrix



#scatterplots
scatter1 <- ggplot(counts_area_sl, aes(x=Mammal, y=Bird, size = Acres)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Mammal Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Mammal Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter1

scatter5 <- ggplot(counts_area_sl, aes(x=Mammal, y=Fish, size = Acres)) + geom_point(alpha = 1, color = "#1375A0") + 
  xlab("Number of Mammal Species") + ylab("Number of Fish Species") + 
  ggtitle("Number of Mammal Species vs Fish Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1) +
  theme(legend.position = "none")
scatter5

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

#dot plot
conservation_park_info2 <- conservation_park_info2[order(conservation_park_info$Endangered), ]
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
  labs(title="Number of Endangered Species in US National Parks") +  
  coord_flip()
dot_plot_e

conservation_park_info3 <- conservation_park_info3[order(conservation_park_info$`Species of Concern`), ]
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
  labs(title="Number of Species of Concern in US National Parks") +  
  coord_flip()
dot_plot_c

##Slope chart of top 15 parks with most endangered vs top 15 parks with most of concern
#top 15 endangered
top_15_e <- conservation_park_info2[42:56,]
top_15_e <- top_15_e %>% select(Park.Name, Endangered)

#top 15 concern
top_15_c <- conservation_park_info3[42:56,]
top_15_c <- top_15_c %>% select(Park.Name, `Species of Concern`)

#join
top15 <- full_join(top_15_e,top_15_c,by="Park.Name")


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

#all subsets regression
model <- lm(Mammal ~ Amphibian + Bird + Fish + Insect + Reptile + `Vascular Plant` + Acres + Latitude, 
            data = counts_area_sl)

all_possible <- ols_step_all_possible(model)
all_possible
plot(all_possible)

best_subset <- ols_step_best_subset(model)
best_subset

forward <- ols_step_forward_p(model)
forward

backward <- ols_step_backward_p(model)
backward

stepwise <- ols_step_both_p(model)
stepwise


effect_plot(model, pred = Bird, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Fish, interval = TRUE, plot.points = TRUE)

