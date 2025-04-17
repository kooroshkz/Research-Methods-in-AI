library(truncnorm) # Library to make truncated normal distribution

n <- 5280 # number of sample size per simulation
n_tests <- 10000 # number of simulations
p_out <- numeric(n_tests) # vector to store p-values


for (i_test in 1:n_tests){

  # independent variable: simulate previous relationships
  prev_relash <- round(
    rtruncnorm(
      n = n,      # sample size
      mean = 3,   # average
      sd = 4,     # standard deviation
      a = 0,      # lower bound
      b = 12      # upper bound
    )
  )

  match_rate <- rtruncnorm(n=n, mean=10, sd=15, a=0.5, b=65) # dependent variable
       
  model = lm(match_rate ~ prev_relash) # linear regression model (dependent (y) ~ independent (x))
  model_summary <- summary(model)
  
  # Extract p-value for the relationship (predictor: prev_relash)
  p_value <- model_summary$coefficients[2,4]
  
  # QRP: Rounding p-values down
  if (p_value > 0.05) {
    p_value <- 0.05
  }
  
  # Store the adjusted p-value
  p_out[i_test] <- p_value
}

hist(p_out) # Histogram of p_out with QRP -> Rounding p-values