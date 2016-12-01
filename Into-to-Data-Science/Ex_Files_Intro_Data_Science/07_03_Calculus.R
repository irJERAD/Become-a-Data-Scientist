# IDS_07_03_Calculus.R

# ==========================================================
# Example data from presentation
# ==========================================================

# Formula for sales as a function of price
sales <- function(price) { 480 - 0.6 * price }

# Formula for revenue as a function of price and sales
revenue <- function(price) { price * sales(price) }

# Make two graphs side-by-side
par(mfrow=c(1, 2))

# Graph of sales as a function of price
curve(sales, from = 100, to = 700, 
      xname = "Price", ylab = "Sales", 
      main = "Sales")

# Graph revenue as a function of price and sales
curve(revenue, from = 100, to = 700, 
      xname = "Price", ylab = "Revenue", 
      main = "Revenue")

# Draw line at price for maximum revenue
abline(v = 400)

# Draw line where slope of revenue curve is zero
abline(h = 96000)

# Draw dot at intersection
points(400, 96000, pch = 19, col = "#E38942", cex = 2)

#Restore graphical parameters
par(mfrow=c(1, 1))

# Print sale price and revenue for optimal model
optimize(revenue, interval = c(100, 700), maximum = TRUE)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
