library(tidyverse)
library(jtools)
library(olsrr)
library(ggpubr)
#install.packages("olsrr")


counts_area_sl <- read_csv("./derived_data/counts_area_sl.csv")

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
#4 Selection Techniques

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
model_final <- lm(Mammal ~ Amphibian + Bird + Fish + Longitude, 
                  data = counts_area_sl)

amphibian <- effect_plot(model_final, pred = Amphibian, interval = TRUE, plot.points = TRUE)
bird <- effect_plot(model_final, pred = Bird, interval = TRUE, plot.points = TRUE)
fish <- effect_plot(model_final, pred = Fish, interval = TRUE, plot.points = TRUE)
longitude <- effect_plot(model_final, pred = Longitude, interval = TRUE, plot.points = TRUE)

glm_figure2 <- ggarrange(amphibian, bird, fish, longitude,
                        ncol = 2, nrow = 2)
glm_figure2




#Forward selection
forward <- ols_step_forward_p(model)
forward
#Variables included: bird, fish, amphibian, longitude, spider/scorpion, 
#reptile, vascular plant

#Backward selection
backward <- ols_step_backward_p(model)
backward
#Variables included: 

#Stepwise selection
stepwise <- ols_step_both_p(model)
stepwise
#Variables included: bird, fish, amphibian, longitude
fit_step <- glm(Mammal~Bird+Fish+Amphibian+Longitude,data=counts_area_sl)
summary(fit_step)
step_bird <- effect_plot(fit_step, pred = Bird, interval = TRUE, plot.points = TRUE)
step_fish <- effect_plot(model, pred = Fish, interval = TRUE, plot.points = TRUE)
step_amphibian <- effect_plot(model, pred = Amphibian, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Longitude, interval = TRUE, plot.points = TRUE)



#save figures
ggsave("figures/glm_figure.png",glm_figure)
saveRDS(glm_figure, "figures/glm_figure.rds")

ggsave("figures/glm_figure2.png",glm_figure)
saveRDS(glm_figure, "figures/glm_figure2.rds")
