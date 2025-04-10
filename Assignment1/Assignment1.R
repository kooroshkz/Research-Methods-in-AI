library(truncnorm)
n <- 5280
n_tests <- 10000
p_out <- numeric(n_tests)
for (i_test in 1:n_tests){
  prev_relash <- rtruncnorm(n=n, mean=3, sd=4, b=12)
  match_rate <- rtruncnorm(n=n, mean=10, sd=15, a=0.5, b=65)
       
  model = lm(match_rate ~ prev_relash)
  model_summary <- summary(model)
  p_out[i_test] <- model_summary$coefficients[2,4]
}

hist(p_out)