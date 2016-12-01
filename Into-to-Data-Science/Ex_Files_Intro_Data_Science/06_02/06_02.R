# DSFO_06_02

# ======================================================================
# Unimodal distribution
# ======================================================================

library("ggplot2")
xnorm <- rnorm(10000)
ggplot(NULL, aes(x = xnorm)) + 
  geom_histogram(binwidth = 0.5,
                 fill = "firebrick3",
                 colour = "white") +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24))

# ======================================================================
# Bimodal distributions
# ======================================================================

library("reshape2")
# - Individual distributions
nd1 <- rnorm(1000, mean = 100, sd = 10)
nd2 <- rnorm(1000, mean = 150, sd = 15)
df12   <- data.frame(nd1, nd2)
melt12 <- melt(df12)
hist(melt12$value)
ggplot(melt12, aes(x = value)) + 
  geom_histogram(binwidth = 5, fill = "firebrick3", colour = "white") +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24))

# ======================================================================
# Bimodal distributions with normal curves superimposed
# ======================================================================

ggplot(melt12, aes(x = value)) + 
  geom_histogram(aes(y = ..density.. * 2),
                 binwidth = 5,
                 fill = "gray",
                 colour = "white") +
  stat_function(fun = dnorm,
                colour = "firebrick3",
                size = 1.5,
                arg = list(mean = 100, sd = 10)) +
  stat_function(fun = dnorm,
                colour = "blue",
                size = 1.5,
                arg = list(mean = 150, sd = 15)) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24))

# ======================================================================
# Scatterplot Matrix for Correlations
# ======================================================================

require("MASS")

# 1: r = 1.00
sigma1 <- matrix(c(1, 1, 1, 1), 2, 2)
scatter1 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma1))

# 2. r = 0.75
sigma2 <- matrix(c(1, .75, .75, 1), 2, 2)
scatter2 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma2))

# 3. r = 0.50
sigma3 <- matrix(c(1, .5, .5, 1), 2, 2)
scatter3 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma3))

# 4. r = 0.25
sigma4 <- matrix(c(1, .25, .25, 1), 2, 2)
scatter4 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma4))

# 5. r = 0.00
sigma5 <- matrix(c(1, 0, 0, 1), 2, 2)
scatter5 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma5))

# 6. r = -0.25
sigma6 <- matrix(c(1, -.25, -.25, 1), 2, 2)
scatter6 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma6))

# 7. r = -0.50
sigma7 <- matrix(c(1, -.5, -.5, 1), 2, 2)
scatter7 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma7))

# 8. r = -0.75
sigma8 <- matrix(c(1, -.75, -.75, 1), 2, 2)
scatter8 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma8))

# 9. r = -1.00
sigma9 <- matrix(c(1, -1, -1, 1), 2, 2)
scatter9 <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma9))

# Now join data frames
# Joine data frames with cbind()
sps <- cbind(scatter1, scatter2, scatter3,
             scatter4, scatter5, scatter6,
             scatter7, scatter8, scatter9)

# Empty data frame
sp <- data.frame()  # sp = "scatterplot"


# Fill in sp data frame
rnames <- c("r = +1.00", "r = +0.75", "r = +0.50",
            "r = +0.25", "r = 0.00", "r = -0.25",
            "r = -0.50", "r = -0.75", "r = -1.00")
for(i in 1:9)
  sp <- rbind(sp, 
              data.frame(set = rnames[i], 
                         x = sps[, i * 2 - 1], 
                         y = sps[, i * 2]))

# Plot data
ggplot(sp, aes(x, y)) + 
  # Regression line
  geom_smooth(method="lm",
              color = "gray70",
              size = 2,
              fill = NA,
              fullrange = TRUE) + 
  # Points
  geom_point(size=3, 
             color = "firebrick3", 
             fill = "firebrick3", 
             shape = 21) +
  # Set scale
  theme(text = element_text(size = 18)) +
  # Panels
  facet_wrap(~set, ncol = 3)