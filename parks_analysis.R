#Analysis of parks data set
library(ggplot2)

#scatterplots
proposal1 <- ggplot(counts_area_sl, aes(x=Mammal, y=Bird)) + geom_point(alpha = 1, color = "#0A684A") + 
  xlab("Number of Mammal Species") + ylab("Number of Bird Species") + 
  ggtitle("Number of Mammal Species vs Bird Species") +
  geom_smooth(method=lm, se=FALSE, color = "black", alpha = 0.1)
proposal1

ggplot(species_counts_all, aes(x=Reptile, y=Fish)) + geom_point()
ggplot(species_counts_all, aes(x=Algae, y=Bird)) + geom_point()
ggplot(species_counts_all, aes(x=Fish, y=Bird)) + geom_point()

ggplot(species_counts_all, aes(x=`Vascular Plant`, y=`Nonvascular Plant`)) + geom_point()

ggplot(counts_area, aes(x=Mammal, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Acres, y=Mammal)) + geom_point()
ggplot(counts_area, aes(x=Acres, y=Bird)) + geom_point()

#Lattitude
ggplot(counts_area, aes(x=Mammal, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Bird, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=Fish, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=`Vascular Plant`, y=Latitude)) + geom_point()
ggplot(counts_area, aes(x=`Nonvascular Plant`, y=Latitude)) + geom_point()



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





