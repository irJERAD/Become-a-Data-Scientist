# IDS_07_01_Algebra.R

# ==========================================================
# Example data from presentation
# ==========================================================

# y = Vector of outcomes
# cbind makes this a column vector
y <- cbind(c(118000, 84000))
y

# X = Matrix of scores
# rbind makes each vector a row in the matrix
X <- rbind(c(1, 10, 4, 50), 
           c(1, 16, 3, 35))
X

# b = Vector of coefficients
b <- cbind(c(30572, 1395, 5911, 382))
b

# y.pred = predicted values of y
# To multiple matrices in R, use %*% instead of just *
y.pred <- X %*% b
y.pred

# e = error terms
e <- y - y.pred
e

# Compare to presentation's answers:
# 30734
#     5

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
