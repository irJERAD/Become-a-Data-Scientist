# IDS_09_04_NaiveBayes.R

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("e1071")    # Install e1071
install.packages("mlbench")  # Install mlbench
library(e1071)               # Load e1071
library(mlbench)             # Load mlbench

# ==========================================================
# Prepare data: HouseVotes84
# ==========================================================

# Use "HouseVotes84" from mlbench package
data(HouseVotes84, package = "mlbench")
vote <- HouseVotes84

head(vote)  # Show first six cases

# Split data into training set (2/3) and testing set (1/3)
set.seed(1984)  # Random seed
vote.split <- sample(2, nrow(vote), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))

# Create training and testing datasets using vote.split
vote.train <- vote[vote.split == 1, ]
vote.test  <- vote[vote.split == 2, ]

# ==========================================================
# Build and test classifier
# ==========================================================

# nbc = "Naive Bayes Classifier"
nbc <- naiveBayes(Class ~ ., data = vote.train) 
nbc  # Examine the classifier

# Check accuracy on training data
table(predict(nbc, vote.train[, -1]), vote.train[, 1])
round(prop.table(table(predict(nbc, vote.train[, -1]), 
                 vote.train[, 1]), 
                 1),  # Row percentages (2 = column)
      2) * 100        # Round to 2 digits, remove decimals

# Check accuracy on test data
table(predict(nbc, vote.test[, -1]), vote.test[, 1])
round(prop.table(table(predict(nbc, vote.test[, -1]), 
                       vote.test[, 1]), 
                 1),  # Row percentages (2 = column)
      2) * 100        # Round to 2 digits, remove decimals

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:e1071", unload = TRUE)
detach("package:mlbench", unload = TRUE)

# Clear console
cat("\014")  # ctrl+L
