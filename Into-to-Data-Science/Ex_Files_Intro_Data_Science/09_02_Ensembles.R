# IDS_09_02_Ensembles.R

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("randomForest")  # Install randomForest
library(datasets)                 # Load built-in datasets 
library(randomForest)             # Load randomForest

# ==========================================================
# Classification tree
# ==========================================================

# Use "iris" from built-in datasets

head(iris)  # Show first six cases

# Split data into training set (2/3) and testing set (1/3)
set.seed(16103)  # Random seed
iris.split <- sample(2, nrow(iris), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))
iris.train <- iris[iris.split == 1, ]
iris.test  <- iris[iris.split == 2, ]

# Compute random forest of decision trees
set.seed(5972)                              # Random seed
iris.rf <- randomForest(Species ~ .,        # Use all var
                        data = iris.train,  # Data
                        ntree = 500,        # Num trees
                        proximity = TRUE)   # Compute prox

# Check model on training set
print(iris.rf)       # Results with classification table
plot(iris.rf)        # Plot of error by number of trees
importance(iris.rf)  # Table of variable importance
varImpPlot(iris.rf)  # Plot of variable importance

# Use model on testing data
iris.pred <- predict(iris.rf, newdata = iris.test)
table(iris.pred, iris.test$Species)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:datasets", unload = TRUE)
detach("package:randomForest", unload = TRUE)

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
