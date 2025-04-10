set.seed(123)  # Set a seed for reproducibility
n <- 500  # Number of simulated users

# Simulate 'PreviousRelationships' between 0 and 12 (as per the case description)
previous_relationships <- sample(0:12, n, replace = TRUE)

# Simulate 'MatchRate' randomly (no correlation with PreviousRelationships)
match_rate <- runif(n, min = 0.5, max = 65)  # Simulating a match rate between 0.5% and 65%

# Combine into a data frame
simulated_data <- data.frame(PreviousRelationships = previous_relationships, MatchRate = match_rate)





# Perform linear regression
model <- lm(MatchRate ~ PreviousRelationships, data = simulated_data)

# Get p-value for the relationship
summary(model)$coefficients[2, 4]  # The p-value for PreviousRelationships





n_simulations <- 1000  # Number of simulations
p_values <- numeric(n_simulations)  # Empty vector to store p-values

# Simulate multiple datasets and collect p-values
for (i in 1:n_simulations) {
  # Simulate the data
  previous_relationships <- sample(0:12, n, replace = TRUE)
  match_rate <- runif(n, min = 0.5, max = 65)
  
  # Perform linear regression
  model <- lm(match_rate ~ previous_relationships)
  
  # Store the p-value from the model
  p_values[i] <- summary(model)$coefficients[2, 4]
}

# Calculate Type I error rate (proportion of p-values < 0.05)
type_1_error_rate <- mean(p_values < 0.05)
type_1_error_rate






# Plot the distribution of p-values
hist(p_values, 
     main = "Distribution of p-values from Simulated Data", 
     xlab = "p-value", 
     ylab = "Frequency", 
     col = "lightblue", 
     breaks = 30)

# Add a line at p = 0.05 for better visualization
abline(v = 0.05, col = "red", lwd = 2)

