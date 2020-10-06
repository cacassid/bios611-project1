library(tidyverse)
library(jtools)
library(olsrr)
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

#4 Selection Techniques

#Best subset
best_subset <- ols_step_best_subset(model)
best_subset
plot(best_subset)
#Variables included:

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
effect_plot(fit_step, pred = Bird, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Fish, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Amphibian, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Longitude, interval = TRUE, plot.points = TRUE)


effect_plot(model, pred = Bird, interval = TRUE, plot.points = TRUE)
effect_plot(model, pred = Fish, interval = TRUE, plot.points = TRUE)
