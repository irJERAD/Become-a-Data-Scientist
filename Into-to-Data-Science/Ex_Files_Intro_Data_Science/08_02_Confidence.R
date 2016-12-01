# DSFO_08_03: Estimation

# As a note, save graphics as 1165 x 500, as that is the proportion
# for the images in the PowerPoint template I'm using
# For saving, using width = 13.5, height = 6, dpi = 200

# Color palette:
# - Red:   firebrick3 (#136)
# - White: white      (#1)
# - Black: black      (#24)
# - Tan:   wheat      (#646)

# Use ggplot2 as much as possible
library("ggplot2")

# ======================================================================
# Figure_DSFO_08_03_01_Precision_and_Accuracy_1.png
# ======================================================================

# Histogram that is neither accurate nor precise
x1 <- rnorm(10000, 45, 10)
ggplot(NULL, aes(x = x1)) + 
  geom_histogram(binwidth = 2, fill = "#1D76B5", colour = "white") +
  xlim(10, 90) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24)) +
  geom_vline(xintercept = 55, linetype = "dotted", size = 3) +
  geom_vline(xintercept = 50, linetype = "solid", size = 2)

ggsave("Figure_DSFO_08_03_01_Precision_and_Accuracy_1.png",
       width = 13.5, height = 6, dpi = 200)
# ======================================================================
# Figure_DSFO_08_03_02_Precision_and_Accuracy_2.png
# ======================================================================

# Histogram that is accurate but not precise
x2 <- rnorm(10000, 55, 10)
ggplot(NULL, aes(x = x2)) + 
  geom_histogram(binwidth = 2, fill = "#1D76B5", colour = "white") +
  xlim(10, 90) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24)) +
  geom_vline(xintercept = 55, linetype = "dotted", size = 3) +
  geom_vline(xintercept = 50, linetype = "solid", size = 2)

ggsave("Figure_DSFO_08_03_02_Precision_and_Accuracy_2.png",
       width = 13.5, height = 6, dpi = 200)
# ======================================================================
# Figure_DSFO_08_03_03_Precision_and_Accuracy_3.png
# ======================================================================

# Histogram that is precise but not accurate
x3 <- rnorm(10000, 45, 2)
ggplot(NULL, aes(x = x3)) + 
  geom_histogram(binwidth = 2, fill = "#1D76B5", colour = "white") +
  xlim(10, 90) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24)) +
  geom_vline(xintercept = 55, linetype = "dotted", size = 3) +
  geom_vline(xintercept = 50, linetype = "solid", size = 2)

ggsave("Figure_DSFO_08_03_03_Precision_and_Accuracy_3.png",
       width = 13.5, height = 6, dpi = 200)
# ======================================================================
# Figure_DSFO_08_03_04_Precision_and_Accuracy_4.png
# ======================================================================

# Histogram that is both accurate and precise
x4 <- rnorm(10000, 55, 2)
ggplot(NULL, aes(x = x4)) + 
  geom_histogram(binwidth = 2, fill = "#1D76B5", colour = "white") +
  xlim(10, 90) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24)) +
  geom_vline(xintercept = 55, linetype = "dotted", size = 3) +
  geom_vline(xintercept = 50, linetype = "solid", size = 2)

ggsave("Figure_DSFO_08_03_04_Precision_and_Accuracy_4.png",
       width = 13.5, height = 6, dpi = 200)
# ======================================================================
# Figure_DSFO_08_03_05_Precision_and_Accuracy_5.png
# ======================================================================

# Create variables
x1 <- rnorm(10000, 45, 10)
x2 <- rnorm(10000, 55, 10)
x3 <- rnorm(10000, 45, 2)
x4 <- rnorm(10000, 55, 2)

# Join variables
xbind <- cbind(x1, x2, x3, x4)

# Create empty dataframe
xdf <- data.frame()  # xdf = "X dataframe"

# Fill in data frame
rnames <- c("Neither Accurate nor Precise",
            "Accurate but Not Precise",
            "Precise but Not Accurate",
            "Both Accurate and Precise")

for(i in 1:4)
  xdf <- rbind(xdf, 
               data.frame(set = rnames[i], 
                          x = xbind[, i]))

# Plot Data
ggplot(xdf, aes(x = x)) + 
  geom_histogram(binwidth = 2, fill = "#1D76B5", colour = "white") +
  xlim(10, 90) +
  xlab("Scores on Outcome Variable") +  # Title on Y axis
  ylab("Frequency") +
  theme(text = element_text(size = 24)) +
  geom_vline(xintercept = 55,
             linetype = "dotted",
             size = 3) +
  geom_vline(xintercept = 50,
             linetype = "solid",
             size = 2, 
             color = "gray70") +
# Four panels
  facet_wrap(~set, ncol=2, scales = "free")

ggsave("Figure_DSFO_08_03_05_Precision_and_Accuracy_5.png",
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure_DSFO_08_03_06_Confidence_interval_variation.png
# ======================================================================

# Trying an example from 
# http://yihui.name/en/2007/10/
# demonstration-of-confidence-intervals-using-r/
# Also http://www.rforge.net/doc/packages/animation/conf.int.html
# Interesting but not what I need
# require("animation")
# conf.int
# conf.int(0.95, size = 20, cl = c("red", "black"))

# Instead, use this:
# Simulated data for 20 groups
m <- 55  # Mean for simulation
s <- 7   # Standard deviation
n <- 20  # Sample size
k <- 20  # Number of samples

llim <- rep(NA,k)
mean <- rep(NA,k)
ulim <- rep(NA,k)
outlier <- rep(FALSE,k)
sn  <- c("1", "2", "3", "4", "5", 
         "6", "7", "8", "9", "10",
         "11", "12", "13", "14", "15",
         "16", "17", "18", "19", "20")
sn <- factor(sn, as.character(sn))


for(i in 1:k) {
  x <- rnorm(n, m, s)
  llim[i] <- mean(x) - qnorm(0.975) * sqrt(s^2 / n)
  mean[i] <- mean(x)
  ulim[i] <- mean(x) + qnorm(0.975) * sqrt(s^2 / n)
  if((llim[i] > m) || (ulim[i] < m)) {
    outlier[i] <- TRUE
  }
}

# Combine vectors into data frame and show results
cl.df <- data.frame(sn, llim, mean, ulim, outlier)
names(cl.df) <- c("sample", "lower", "mean", "upper", "outlier")
# cl.df

# Manually set colors for plot
colors <- c("black", "#1D76B5")
names(colors) <- levels(cl.df$outlier)
colScale <- scale_colour_manual(name = "outlier",values = colors)

# Create plot using "pointrange"
ggplot(cl.df, aes(sample, mean, ymin = lower, ymax = upper )) +
  scale_y_continuous(breaks = c(45, 50, 55, 60, 65)) +
  geom_hline(yintercept = 55, linetype = "dotted", size = 2) +
  geom_pointrange(size = 1, aes(color = outlier)) +
  xlab("Samples 1-20") +
  ylab("Confidence Interval") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none") + 
  colScale

ggsave("Figure_DSFO_08_03_06_Precision_and_Accuracy_6.png",
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure_DSFO_08_03_07_Confidence_level_and_CI.png
# ======================================================================

# Varying the Confidence Level
m <- 55  # Mean for simulation
k <- 6   # Number of samples
s <- 7   # Standard deviation
n <- 20  # Sample size

conf <- c(.50, .80, .90, .95, .99, .999)
llim <- rep(NA, k)
mean <- rep(NA, k)
ulim <- rep(NA, k)
samp <- c(".50", ".80", ".90", ".95", ".99", ".999")
# x <- rnorm(10000, m, s)

for(i in 1:k) {
  llim[i] <- m - qnorm(1 - ((1 - conf[i])/2)) * s/sqrt(n)
  mean[i] <- m
  ulim[i] <- m + qnorm(1 - ((1 - conf[i])/2)) * s/sqrt(n)
}

# Combine vectors into data frame and show results
cl.df <- data.frame(samp, llim, mean, ulim)
names(cl.df) <- c("confidence_level", "lower", "mean", "upper")
cl.df

# Create plot using "pointrange"
ggplot(cl.df, aes(confidence_level,
                  mean,
                  ymin = lower,
                  ymax = upper)) +
  scale_y_continuous(breaks = c(45, 50, 55, 60, 65)) +
  geom_hline(yintercept = 55, linetype = "dotted", size = 3) +
  geom_pointrange(size = 2, colour = "#1D76B5") +
  xlab("Confidence Level") +
  ylab("Confidence Interval") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure_DSFO_08_03_07_Confidence_level_and_CI.png",
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure_DSFO_08_03_08_Confidence_level_and_SD.png
# ======================================================================

# Varying the Confidence Level
m <- 55  # Mean for simulation
k <- 5   # Number of samples
# s <- 7   # Standard deviation
n <- 20  # Sample size

conf <- rep(.95, k)
s  <- c(1, 2, 4, 8, 16)
llim <- rep(NA, k)
mean <- rep(NA, k)
ulim <- rep(NA, k)
samp <- c("s = 1", "s = 2", "s = 4", "s = 8", "s = 16")
samp <- factor(samp, as.character(samp))
# x <- rnorm(10000, m, s)

for(i in 1:k) {
  llim[i] <- m - qnorm(1 - ((1 - conf[i])/2)) * s[i]/sqrt(n)
  mean[i] <- m
  ulim[i] <- m + qnorm(1 - ((1 - conf[i])/2)) * s[i]/sqrt(n)
}

# Combine vectors into data frame and show results
cl.df <- data.frame(samp, llim, mean, ulim)
names(cl.df) <- c("standard_deviation", "lower", "mean", "upper")
cl.df

# Create plot using "pointrange"
ggplot(cl.df, aes(standard_deviation,
                  mean,
                  ymin = lower,
                  ymax = upper,
                  order = upper)) +
  scale_y_continuous(breaks = c(45, 50, 55, 60, 65)) +
  geom_hline(yintercept = 55, linetype = "dotted", size = 3) +
  geom_pointrange(size = 2,
                  colour = "#1D76B5") +
  xlab("Sample Standard Deviation") +
  ylab("Confidence Interval") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure_DSFO_08_03_08_Confidence_level_and_SD.png",
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure_DSFO_08_03_09_Confidence_level_and_n.png
# ======================================================================

# Varying the Confidence Level
m <- 55  # Mean for simulation
k <- 9   # Number of samples

conf <- rep(.95, k)
s <- rep(7, k)
n <- c(2, 4, 8, 16, 32, 64, 128, 256, 512)
llim <- rep(NA, k)
mean <- rep(NA, k)
ulim <- rep(NA, k)
samp <- c("n = 2", "n = 4", "n = 8", 
          "n = 16", "n = 32", "n = 64",
          "n = 128", "n = 256", "n = 512")
samp <- factor(samp, as.character(samp))
# x <- rnorm(10000, m, s)

for(i in 1:k) {
  llim[i] <- m - qnorm(1 - ((1 - conf[i])/2)) * s[i]/sqrt(n[i])
  mean[i] <- m
  ulim[i] <- m + qnorm(1 - ((1 - conf[i])/2)) * s[i]/sqrt(n[i])
}

# Combine vectors into data frame and show results
cl.df <- data.frame(samp, llim, mean, ulim)
names(cl.df) <- c("sample_size", "lower", "mean", "upper")
cl.df

# Create plot using "pointrange"
ggplot(cl.df, aes(sample_size,
                  mean,
                  ymin = lower,
                  ymax = upper)) +
  scale_y_continuous(breaks = c(45, 50, 55, 60, 65)) +
  geom_hline(yintercept = 55, linetype = "dotted", size = 3) +
  geom_pointrange(size = 2,
                  colour = "#1D76B5") +
  xlab("Sample Size") +
  ylab("Confidence Interval") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure_DSFO_08_03_09_Confidence_level_and_n.png",
       width = 13.5, height = 6, dpi = 200)

