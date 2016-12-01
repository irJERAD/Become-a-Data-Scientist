# IDS_07_02_Systems.R

# ==========================================================
# Example data from presentation
# ==========================================================

# Number of iPhone cases sold 
# x + y = 1000
# Total earnings 
# $20x + $5y = $5900

# Enter coefficients on left side as a matrix
# Q = Quantity
Q <- rbind(c( 1, 1), 
           c(20, 5))
Q

# Enter outcomes in vector
# r = revenue
r <- c(1000, 5900)
r

# Use R's "solve" function
?solve

solve(Q, r)
# [1]  60 940
# x = 60 cases at $20
# y = 940 cases at $5

# Check answers
 1*(60) + 1*(940)  # = 1000
20*(60) + 5*(940)  # = 5900

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
