# IDS_09_04_NaiveBayes

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("e1071")    # Install e1071
install.packages("mlbench")  # Install mlbench
library(datasets)            # Load built-in datasets 
library(e1071)               # Load e1071
library(mlbench)             # Load mlbench

# ==========================================================
# Prepare data for example 1: iris
# ==========================================================

# Use "iris" from built-in datasets

head(iris)  # Show first six cases

# Split data into training set (2/3) and testing set (1/3)
set.seed(16103)  # Random seed
iris.split <- sample(2, nrow(iris), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))

# Create training and testing datasets using iris.split
iris.train <- iris[iris.split == 1, ]
iris.test  <- iris[iris.split == 2, ]

# ==========================================================
# Build and test classifier for example 1
# ==========================================================

# nbc1 = "Naive Bayes Classifier #1"
nbc1 <- naiveBayes(Species ~ ., data = iris.train) 
nbc1  # Examine the classifier

# Accuracy on training data
table(predict(nbc1, iris.train[, -5]), iris.train[, 5])

# Accuracy on test data
table(predict(nbc1, iris.test[, -5]), iris.test[, 5])

# ==========================================================
# Prepare data for example 2: HouseVotes84
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

# Create training and testing datasets using iris.split
vote.train <- vote[vote.split == 1, ]
vote.test  <- vote[vote.split == 2, ]

# ==========================================================
# Build and test classifier for example 2
# ==========================================================

# nbc2 = "Naive Bayes Classifier #2"
nbc2 <- naiveBayes(Class ~ ., data = vote.train) 
nbc2  # Examine the classifier
table(predict(nbc2, vote.train[, -1]), vote.train[, 1])

# Test classifier on vote.test data, check table
table(predict(nbc2, vote.test[, -1]), vote.test[, 1])

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:datasets", unload = TRUE)
detach("package:e1071", unload = TRUE)
detach("package:mlbench", unload = TRUE)

# Clear plots
dev.off()  # NB: http://j.mp/1RgKR8i

# Clear console
cat("\014")  # ctrl+L

# So long, farewell....
