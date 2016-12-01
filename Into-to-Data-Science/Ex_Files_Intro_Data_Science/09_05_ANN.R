# IDS_09_05_ANN

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages('neuralnet')  # Install neuralnet
library(neuralnet)             # Load neuralnet

# ==========================================================
# Prepare data
# ==========================================================

# Get 30 random integers between 1 and 50
set.seed(1202)                             # Set seed
train.x <- sample(1:100, 50, replace = T)  # Get numbers
head(train.x)                              # See numbers
train.y <- sqrt(train.x)                   # Square roots
head(train.y)                              # See roots

# Join the columns and coerce to dataframe
train.xy <- as.data.frame(cbind(train.x, train.y))
head(train.xy)

# ==========================================================
# Train neural network
# ==========================================================

# Use 10 hidden layers
# Threshold = The partial derivative of the error function,
#             used as stopping criteria.
net.sqrt <- neuralnet(train.y ~ train.x, 
                      train.xy,
                      hidden = 10, 
                      threshold = 0.01)

# Plot the resulting neural network
plot(net.sqrt)

# ==========================================================
# Test neural network on new data
# ==========================================================

test.x <- as.data.frame((1:10)^2)    # Squared numbers
test.y <- compute(net.sqrt, test.x)  # Run through ANN
test.y                               # Show output of ANN

# Create table with input, expected results, and results
# from ANN
net.table <- cbind(test.x,
                   sqrt(test.x),
                   round(test.y$net.result, 2))
colnames(net.table) <- c("X","Y-Exp","Y-ANN")
net.table  # Display table

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:neuralnet", unload = TRUE)

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
