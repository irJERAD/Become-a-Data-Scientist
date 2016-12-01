# IDS_09_03_kNN.R

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("class")  # Install class (if needed)
library(class)             # Load class (has knn function)
library(datasets)          # Load built-in datasets 

# ==========================================================
# Prepare data
# ==========================================================

# Use "iris" from built-in datasets

head(iris)  # Show first six cases

# If ranges for variables are very different, then it's a
# good idea to normalize the variables, which puts them in
# similar ranges. This step isn't necessary for this data
# set.

# Split data into training set (2/3) and testing set (1/3)
set.seed(16103)  # Random seed
iris.split <- sample(2, nrow(iris), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))

# Create training and testing datasets without species
# labels. Use just the first four variables.
iris.train <- iris[iris.split == 1, 1:4]
iris.test  <- iris[iris.split == 2, 1:4]

# Create species labels
iris.train.labels <- iris[iris.split == 1, 5]
iris.test.labels  <- iris[iris.split == 2, 5]

# ==========================================================
# Build and test classifier
# ==========================================================

# Build classifier for test data.
# k = number of neighbors to compare; odd n avoids ties.
# Try with several values of k and check accuracy on
# following table.
iris.pred <- knn(train = iris.train,
                 test = iris.test, 
                 cl = iris.train.labels,  # true class
                 k = 9)                   # n neighbors

# Compare predicted species to observed species
table(iris.pred, iris.test.labels)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:class", unload = TRUE)
detach("package:datasets", unload = TRUE)

# Clear console
cat("\014")  # ctrl+L
