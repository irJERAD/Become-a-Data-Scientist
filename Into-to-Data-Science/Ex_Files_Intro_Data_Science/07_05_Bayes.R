# IDS_07_06_Bayes.R

# ==========================================================
# Example data from presentation
# ==========================================================

# Probability of disease
# Base rate or prior probability
pd  <- .01

# Probability of positive test result given disease
# Likelihood or sensitivity
pptgd <- .999

# Probability of positive test result given no disease
# False positive rate
pptgn <- .10

# probability of disease given positive test result
pdgpt <- pd * pptgd / (pd * pptgd + (1 - pd) * pptgn)
pdgpt

# ==========================================================
# Probability curve
# ==========================================================

# Percentages for X axis: Prior probabilities
xpd <- 0:100/100

# Sensitivity = .999
# False Positive = .10
ypdgpt <- xpd * .999 / (xpd * .999 + (1 - xpd) * .10)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .999\nFalse Pos = .10",
     cex = 2)

abline(v = .01)    # Vertical line at .01 prior probability
abline(h = .0917)  # Horizontal line at .09 post. prob.

# ==========================================================
# Matrix of probability curves
# ==========================================================

# Make 9 graphs in 3 rows and 3 columns
par(mfrow=c(3, 3))

# 3 levels of sensitivity: .999, .95, .80
# 3 levels of false positives: .01, .10, .25

# PLOT 1
# Sensitivity = .999
# False Positive = .01
ypdgpt <- xpd * .999 / (xpd * .999 + (1 - xpd) * .01)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .999\nFalse Pos = .01",
     cex = 2)

# PLOT 2
# Sensitivity = .999
# False Positive = .10
ypdgpt <- xpd * .999 / (xpd * .999 + (1 - xpd) * .10)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .999\nFalse Pos = .10",
     cex = 2)

# PLOT 3
# Sensitivity = .999
# False Positive = .25
ypdgpt <- xpd * .999 / (xpd * .999 + (1 - xpd) * .25)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .999\nFalse Pos = .25",
     cex = 2)

# PLOT 4
# Sensitivity = .95
# False Positive = .01
ypdgpt <- xpd * .95 / (xpd * .95 + (1 - xpd) * .01)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .95\nFalse Pos = .01",
     cex = 2)

# PLOT 5
# Sensitivity = .95
# False Positive = .10
ypdgpt <- xpd * .95 / (xpd * .95 + (1 - xpd) * .10)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .95\nFalse Pos = .10",
     cex = 2)

# PLOT 6
# Sensitivity = .95
# False Positive = .25
ypdgpt <- xpd * .95 / (xpd * .95 + (1 - xpd) * .25)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .95\nFalse Pos = .25",
     cex = 2)

# PLOT 7
# Sensitivity = .80
# False Positive = .01
ypdgpt <- xpd * .80 / (xpd * .80 + (1 - xpd) * .01)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .80\nFalse Pos = .01",
     cex = 2)

# PLOT 8
# Sensitivity = .80
# False Positive = .10
ypdgpt <- xpd * .80 / (xpd * .80 + (1 - xpd) * .10)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .80\nFalse Pos = .10",
     cex = 2)

# PLOT 9
# Sensitivity = .80
# False Positive = .25
ypdgpt <- xpd * .80 / (xpd * .80 + (1 - xpd) * .25)
plot(xpd, ypdgpt, pch = 19, col = "#E38942",
     xlab = "Prior Probability", 
     ylab = "Posterior Probability")
lines(xpd, ypdgpt, lwd = 3, col = "#E38942")
text(0.6, 0.2, 
     "Sensitivity = .80\nFalse Pos = .25",
     cex = 2)

#Restore graphical parameters
par(mfrow=c(1, 1))

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
rm(list = ls()) 

# Clear plots
dev.off()

# Clear console
cat("\014")  # ctrl+L
