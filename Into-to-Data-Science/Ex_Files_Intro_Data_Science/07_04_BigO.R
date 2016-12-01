# IDS_07_04_BigO.R

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("RColorBrewer")
library(RColorBrewer)

# ==========================================================
# Set up graph
# ==========================================================

# The x & y limits for the plot
xl <- c(0, 50)
yl <- c(0, 250)

# Use the "Dark2" palette from RColorBrewer
pal <- brewer.pal(7, "Dark2")

# ==========================================================
# Graph functions
# ==========================================================

# FAST
# 1. O(1) Constant
# Ex: Determine if a binary number is even or odd
plot(function(n) (rep(1, length(n))), xlim = xl, ylim = yl, 
     col = pal[7], 
     lwd = 2,
     xlab = "Elements (N)", 
     ylab = "Time (Operations)")

# 2. O(log(n)): Logarithmic
# Ex: Find an item in a sorted array
plot(function(n) (log(n)), xlim = xl, ylim = yl, 
     col = pal[6], lwd = 2, add = TRUE)

# 3. O(n): Linear
# Ex: Find an item in an unsorted list
plot(function(n) (n), xlim = xl, ylim = yl, 
     col = pal[5], lwd = 2, add = TRUE)

# MODERATE
# 4. O(n log(n)): Loglinear
# Ex: Do a fast Fourier transform
plot(function(n) (n*log(n)), xlim = xl, ylim = yl, 
     col = pal[4], lwd = 2, add = TRUE)

# SLOW
# 5. O(n^2): Quadratic
# Ex: Multiply two n-digit numbers
plot(function(n) (n^2), xlim = xl, ylim = yl, 
     col = pal[3], lwd = 2, add = TRUE)

# 6. O(2^n): Exponential
# Ex: Find an (exact) solution to the traveling salesman
#     problem using dynamic programming
plot(function(n) (2^n), xlim = xl, ylim = yl, 
     col = pal[2], lwd = 2, add = TRUE)

# 7. O(n!): Factorial
# Ex: Solve the traveling salesman problem via 
#     brute-force search
plot(function(n) (factorial(n)), xlim = xl, ylim = yl, 
     col = pal[1], lwd = 2, add = TRUE)

# Legend
legend("topright",  
       c("O(n!)", expression(O(2^n)), expression(O(n^2)),
         "O(n log(n))", "O(n)", "O(log(n))", "O(1)"),
       lty = 1, lwd = 2,  col = pal,  bty = 'n',  cex = .75)

# Vertical reference line at 10 elements
abline(v = 10, lty = 2, lwd = 3)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Unload packages
detach("package:RColorBrewer", unload = TRUE)

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
