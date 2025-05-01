library(truncnorm) # Library to make truncated normal distribution

n_max <- 5280 # Number of sample size per simulation
n_interval <- 200 # Sample size interval to add

# Initial sample size
n_initial <- 280
n_total <- n_initial
graph_len <- 1 + (n_max-n_initial)/n_interval

# Vector to store a graph for p- and n-values
p_graphed <- numeric(graph_len)
n_graphed <- numeric(graph_len)
n_graphed[0] <- n_initial


# The index of the graph point we will fill
i = 0

# Independent variable: simulate previous relationships
prev_relash <- round(
  rtruncnorm(
    n = n_initial,      # sample size
    mean = 3,   # average
    sd = 4,     # standard deviation
    a = 0,      # lower bound
    b = 12      # upper bound
  )
)

match_rate <- rtruncnorm(n=n_initial, mean=10, sd=15, a=0.5, b=65) # Dependent variable

model = lm(match_rate ~ prev_relash) # Linear regression model (dependent (y) ~ independent (x))
model_summary <- summary(model)

# Extract p-value for the relationship (predictor: prev_relash)
p_value <- model_summary$coefficients[2,4]
p_graphed[i] <- p_value

# This time we do not stop if the p-value is less than 0.05, we want the entire graph
while (n_total <= n_max){
  
  # New index of graph
  i <- i+1
  
  # Adding some more samples
  new_prev_relash <- round(
    rtruncnorm(
      n = n_interval,
      mean = 3,
      sd = 4,
      a = 0,
      b = 12
    )
  )
  new_match_rate <- rtruncnorm(n=n_interval, mean=10, sd=15, a=0.5, b=65)
  
  # Appending the new relationships to the old ones
  prev_relash <- c(prev_relash, new_prev_relash)
  match_rate <- c(match_rate, new_match_rate)
  
  # Regenerating the model and p value
  model = lm(match_rate ~ prev_relash)
  model_summary <- summary(model)
  p_value <- model_summary$coefficients[2,4]
  
  # Add the p and n value to the graph of values
  p_graphed[i] <- p_value
  n_graphed[i] <- n_total
  
  # Find the total sample size we have used so far
  n_total <- n_total + n_interval
  
}

plot(n_graphed, p_graphed, type="b", ylim=c(0,1), xlab="Sample size", ylab="P-value")
abline(h = 0.05, lty=2)
