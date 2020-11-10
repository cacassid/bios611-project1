library(tidyverse)
library(jtools)
library(olsrr)
library(ggpubr)

counts_area_sl <- read_csv("./derived_data/counts_area_sl.csv")

#full model
model <- lm(Mammal ~ Algae + Amphibian + Bird + `Crab/Lobster/Shrimp` + Fish + 
              Fungi + Insect + Invertebrate + `Nonvascular Plant` + Reptile + 
              `Slug/Snail` + `Spider/Scorpion` + `Vascular Plant` + Acres + 
              Longitude + Latitude, 
            data = counts_area_sl)
model2 <- lm(Mammal ~ Algae + Amphibian + Bird  + Fish + 
              Fungi + `Nonvascular Plant` + Reptile + 
             `Vascular Plant` + Acres + 
              Longitude + Latitude, 
            data = counts_area_sl)
#Selection Techniques

#Best subset
best_subset <- ols_step_best_subset(model2)
best_subset
plot(best_subset)
#write to csv
write_csv(best_subset, "derived_data/best_subset.csv")

#plot n by rsquare
rsquare <- ggplot(best_subset, aes(x=n, y=rsquare)) + geom_point(alpha = 1, color = "red") +
  geom_path() +
  xlab("n") + ylab("R-square")
rsquare

#plot n by cp
cp <- ggplot(best_subset, aes(x=n, y=cp)) + geom_point(alpha = 1, color = "red") +
  geom_path() +
  xlab("n") + ylab("Mallow's Cp")
cp

#plot n by aic
aic <- ggplot(best_subset, aes(x=n, y=aic)) + geom_point(alpha = 1, color = "red") +
  geom_path() +
  xlab("n") + ylab("AIC")
aic

#combined figure of measures
glm_figure <- ggarrange(rsquare, cp, aic,
                        ncol = 3, nrow = 1)
glm_figure

#combined figure of model plots
model_final <- glm(formula = Mammal ~ Bird + Fish + Amphibian + Longitude, data = counts_area_sl)
model_final

amphibian <- effect_plot(model_final, pred = Amphibian, interval = TRUE, plot.points = TRUE)
bird <- effect_plot(model_final, pred = Bird, interval = TRUE, plot.points = TRUE)
fish <- effect_plot(model_final, pred = Fish, interval = TRUE, plot.points = TRUE)
longitude <- effect_plot(model_final, pred = Longitude, interval = TRUE, plot.points = TRUE)

glm_figure2 <- ggarrange(amphibian, bird, fish, longitude,
                        ncol = 2, nrow = 2)
glm_figure2

#create table of model info
predictors <- c('Intercept','Bird','Fish', 'Amphibian', 'Longitude')
estimates <- c(-46.09, 0.22, -0.07, 0.89, -0.44)
p <- c("0.026", "<0.001", "0.002", "<0.001", "0.002")
model_df <- data.frame(predictors, estimates, p)

#save figures
ggsave("figures/glm_figure.png",glm_figure)
saveRDS(glm_figure, "figures/glm_figure.rds")

ggsave("figures/glm_figure2.png",glm_figure2)
saveRDS(glm_figure2, "figures/glm_figure2.rds")



