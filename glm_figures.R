

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