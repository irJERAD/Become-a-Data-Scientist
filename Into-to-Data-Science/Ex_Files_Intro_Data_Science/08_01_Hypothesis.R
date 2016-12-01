# DSFO_08_02: Hypothesis Testing

# For PowerPoint, save graphics as 9" x 4" (2700 x 1200) using
# width = 13.5, height = 6, dpi = 200. 
# But for book use 12 x 6 @ 300

# Color palette:
# - Red:   firebrick3 (#136)
# - Blue:  #1D76B5
# - White: white      (#1)
# - Black: black      (#24)
# - Tan:   wheat      (#646)

# Use ggplot2 as much as possible
library("ggplot2")

# ======================================================================
# Figure_08_02_01_Normal_distribution.png
# ======================================================================

# Shade region of a normal density plot
# Adapted from https://gist.github.com/jrnold/6799152

px <- 1.4   # X coordinate for point on graph
lb <- -1.4  # Lower bounds for marked region
ub <- 1.4   # Upper bounds for marked region
mean = 0    # Mean of distribution
sd = 1      # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 300)
area <- data.frame(x = areax, 
                   ymin = 0,
                   ymax = dnorm(areax, mean = mean, sd = sd))
ggplot() +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure_08_02_01_Normal_distribution.png",
       width = 13.5, height = 6, dpi = 200)


# ======================================================================
# Figure_08_02_02_Central_region.png
# ======================================================================

# Shade region of a normal density plot
# Adapted from https://gist.github.com/jrnold/6799152

llb <- -3    # Lower bounds for left marked region
lub <- -1.96 # Upper bounds for left marked region
rlb <- 1.96  # Lower bounds for left marked region
rub <- 3     # Upper bounds for left marked region
mean = 0     # Mean of distribution
sd = 1       # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)

xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = mean, sd = sd))

xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = mean, sd = sd))

ggplot() +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure_08_02_02_Central_region.png",
       width = 13.5, height = 6, dpi = 200)


# ======================================================================
# Figure 08.01. Observed p-Value, Part 1.png
# ======================================================================

# Shade region of a normal density plot
# Adapted from https://gist.github.com/jrnold/6799152

px <- 1.4   # X coordinate for point on graph
lb <- -1.4  # Lower bounds for marked region
ub <- 1.4   # Upper bounds for marked region
mean = 0    # Mean of distribution
sd = 1      # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 300)
area <- data.frame(x = areax, 
                   ymin = 0,
                   ymax = dnorm(areax, mean = mean, sd = sd))
ggplot() +
  geom_ribbon(data = area,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")
  
ggsave("Figure 08.01. Observed p-Value, Part 1.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.02. Observed p-Value, Part 2.png
# ======================================================================

px <- 1.4    # X coordinate for point on graph
llb <- -3    # Lower bounds for left marked region
lub <- -1.4  # Upper bounds for left marked region
rlb <- 1.4   # Lower bounds for left marked region
rub <- 3     # Upper bounds for left marked region
mean = 0     # Mean of distribution
sd = 1       # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)

xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = mean, sd = sd))

xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = mean, sd = sd))

ggplot() +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.02. Observed p-Value, Part 2.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)


# ======================================================================
# Figure 08.03. Null Distribution for One-Tailed Test on High End.png
# ======================================================================

px <- 2.25  # X coordinate for point on graph
lb <- 1.68  # Lower bounds for marked region
ub <- 3     # Upper bounds for marked region
mean = 0    # Mean of distribution
sd = 1      # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 300)
area <- data.frame(x = areax, 
                   ymin = 0,
                   ymax = dnorm(areax, mean = mean, sd = sd))
ggplot() +
  geom_ribbon(data = area,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave(paste("Figure 08.03. Null Distribution for One-Tailed Test",
             "on High End.png"),
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.04. Null Distribution for One-Tailed Test on Low End.png
# ======================================================================

px <- -2.25 # X coordinate for point on graph
lb <- -3    # Lower bounds for marked region
ub <- -1.68 # Upper bounds for marked region
mean = 0    # Mean of distribution
sd = 1      # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 300)
area <- data.frame(x = areax, 
                   ymin = 0,
                   ymax = dnorm(areax, mean = mean, sd = sd))
ggplot() +
  geom_ribbon(data = area,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave(paste("Figure 08.04. Null Distribution for One-Tailed Test",
             "on Low End.png"),
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.05. Null Distribution for Two-Tailed Test.png
# ======================================================================

px <- 2.25   # X coordinate for point on graph
llb <- -3    # Lower bounds for left marked region
lub <- -1.96 # Upper bounds for left marked region
rlb <- 1.96  # Lower bounds for left marked region
rub <- 3     # Upper bounds for left marked region
mean = 0     # Mean of distribution
sd = 1       # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)

xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = mean, sd = sd))

xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = mean, sd = sd))

ggplot() +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.05. Null Distribution for Two-Tailed Test.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.06. Null Distribution for Two-Tailed Test.png
# ======================================================================

# Same as 08.05 but with no dot for mean

llb <- -3    # Lower bounds for left marked region
lub <- -1.96 # Upper bounds for left marked region
rlb <- 1.96  # Lower bounds for left marked region
rub <- 3     # Upper bounds for left marked region
mean = 0     # Mean of distribution
sd = 1       # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)

xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = mean, sd = sd))

xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = mean, sd = sd))

ggplot() +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.06. Null Distribution for Two-Tailed Test.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.07. Alpha and Beta Regions.png
# ======================================================================

llb <- 1.68   # Lower bounds for left distribution's marked region
lub <- 5      # Upper bounds for left distribution's marked region
rlb <- -3     # Lower bounds for right distribution's marked region
rub <- 1.68   # Upper bounds for right distribution's marked region
meanl = 0     # Mean of left distribution
sdl = 1       # SD of left distribution
meanr = 2     # Mean of right distribution
sdr = 1       # SD of right distribution
limits = c(meanl - 3 * sdl, meanr + 3 * sdr)

x <- seq(limits[1], limits[2], length.out = 300)

# Left distribution
xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = meanl, sd = sdl))

# Right distribution
xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = meanr, sd = sdr))

ggplot() +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "dodgerblue3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanl, sd = sdl)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "firebrick3") + 
  geom_segment(aes(x = meanl, xend = meanl,
                   y = 0, yend = dnorm(meanl, mean = meanl, sd = sdl)),
               linetype = "dotted", color = "firebrick3", size = 3) +
  geom_point(aes(x = 2.25, y = 0), size = 10, color = "darkred") +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanr, sd = sdr)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "dodgerblue3") + 
  geom_segment(aes(x = meanr, xend = meanr,
                   y = 0, yend = dnorm(meanr, mean = meanr, sd = sdr)),
               linetype = "dotted", color = "dodgerblue3", size = 3) +
  geom_point(aes(x = 1, y = 0), size = 10, color = "dodgerblue3") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.07. Alpha and Beta Regions.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.08. Effect of Effect Size on Beta.png
# ======================================================================

llb <- 1.68   # Lower bounds for left distribution's marked region
lub <- 6      # Upper bounds for left distribution's marked region
rlb <- -3     # Lower bounds for right distribution's marked region
rub <- 1.68   # Upper bounds for right distribution's marked region
meanl = 0     # Mean of left distribution
sdl = 1       # SD of left distribution
meanr = 3     # Mean of right distribution
sdr = 1       # SD of right distribution
limits = c(meanl - 3 * sdl, meanr + 3 * sdr)

x <- seq(limits[1], limits[2], length.out = 300)

# Left distribution
xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = meanl, sd = sdl))

# Right distribution
xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = meanr, sd = sdr))

ggplot() +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "dodgerblue3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanl, sd = sdl)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "firebrick3") + 
  geom_segment(aes(x = meanl, xend = meanl,
                   y = 0, yend = dnorm(meanl, mean = meanl, sd = sdl)),
               linetype = "dotted", color = "firebrick3", size = 3) +
  geom_point(aes(x = 2.25, y = 0), size = 10, color = "darkred") +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanr, sd = sdr)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "dodgerblue3") + 
  geom_segment(aes(x = meanr, xend = meanr,
                   y = 0, yend = dnorm(meanr, mean = meanr, sd = sdr)),
               linetype = "dotted", color = "dodgerblue3", size = 3) +
  geom_point(aes(x = 1, y = 0), size = 10, color = "dodgerblue3") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.08. Effect of Effect Size on Beta.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.09. Effect of Alpha on Beta.png
# ======================================================================

llb <- 0.84   # Lower bounds for left distribution's marked region
lub <- 5      # Upper bounds for left distribution's marked region
rlb <- -3     # Lower bounds for right distribution's marked region
rub <- 0.84   # Upper bounds for right distribution's marked region
meanl = 0     # Mean of left distribution
sdl = 1       # SD of left distribution
meanr = 2     # Mean of right distribution
sdr = 1       # SD of right distribution
limits = c(meanl - 3 * sdl, meanr + 3 * sdr)

x <- seq(limits[1], limits[2], length.out = 300)

# Left distribution
xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = meanl, sd = sdl))

# Right distribution
xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = meanr, sd = sdr))

ggplot() +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "dodgerblue3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanl, sd = sdl)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "firebrick3") + 
  geom_segment(aes(x = meanl, xend = meanl,
                   y = 0, yend = dnorm(meanl, mean = meanl, sd = sdl)),
               linetype = "dotted", color = "firebrick3", size = 3) +
  geom_point(aes(x = 2.25, y = 0), size = 10, color = "darkred") +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanr, sd = sdr)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "dodgerblue3") + 
  geom_segment(aes(x = meanr, xend = meanr,
                   y = 0, yend = dnorm(meanr, mean = meanr, sd = sdr)),
               linetype = "dotted", color = "dodgerblue3", size = 3) +
  geom_point(aes(x = 1, y = 0), size = 10, color = "dodgerblue3") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.09. Effect of Alpha on Beta.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.10. Effect of Standard Error on Beta.png
# ======================================================================

llb <- 0.84   # Lower bounds for left distribution's marked region
lub <- 5      # Upper bounds for left distribution's marked region
rlb <- -3     # Lower bounds for right distribution's marked region
rub <- 0.84   # Upper bounds for right distribution's marked region
meanl = 0     # Mean of left distribution
sdl = .5       # SD of left distribution
meanr = 2     # Mean of right distribution
sdr = .5       # SD of right distribution
limits = c(meanl - 6 * sdl, meanr + 6 * sdr)

x <- seq(limits[1], limits[2], length.out = 500)

# Left distribution
xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 500)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = meanl, sd = sdl))

# Right distribution
xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 500)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = meanr, sd = sdr))

ggplot() +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "dodgerblue3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanl, sd = sdl)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "firebrick3") + 
  geom_segment(aes(x = meanl, xend = meanl,
                   y = 0, yend = dnorm(meanl, mean = meanl, sd = sdl)),
               linetype = "dotted", color = "firebrick3", size = 3) +
  geom_point(aes(x = 2.25, y = 0), size = 10, color = "darkred") +
  geom_line(data.frame(x = x, y = dnorm(x, mean = meanr, sd = sdr)), 
            mapping = aes(x = x, y = y),
            size = 2, color = "dodgerblue3") + 
  geom_segment(aes(x = meanr, xend = meanr,
                   y = 0, yend = dnorm(meanr, mean = meanr, sd = sdr)),
               linetype = "dotted", color = "dodgerblue3", size = 3) +
  geom_point(aes(x = 1, y = 0), size = 10, color = "dodgerblue3") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.10. Effect of Standard Error on Beta.png",
#        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.11. z-test, example.png
# ======================================================================

px <- -1.06    # X coordinate for point on graph
llb <- -3    # Lower bounds for left marked region
lub <- -1.96  # Upper bounds for left marked region
rlb <- 1.96   # Lower bounds for left marked region
rub <- 3     # Upper bounds for left marked region
mean = 0     # Mean of distribution
sd = 1       # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)

xminl <- max(llb, limits[1])
xmaxl <- min(lub, limits[2])
areaxl <- seq(xminl, xmaxl, length.out = 300)
areal <- data.frame(x = areaxl, 
                    ymin = 0,
                    ymax = dnorm(areaxl, mean = mean, sd = sd))

xminr <- max(rlb, limits[1])
xmaxr <- min(rub, limits[2])
areaxr <- seq(xminr, xmaxr, length.out = 300)
arear <- data.frame(x = areaxr, 
                    ymin = 0,
                    ymax = dnorm(areaxr, mean = mean, sd = sd))

ggplot() +
  geom_ribbon(data = areal,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_ribbon(data = arear,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.11. z-test, example.png",
       #        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)

# ======================================================================
# Figure 08.12. z-test, example 2.png
# ======================================================================

px <- 1  # X coordinate for point on graph
lb <- 1.65  # Lower bounds for marked region
ub <- 3     # Upper bounds for marked region
mean = 0    # Mean of distribution
sd = 1      # SD of distribution
limits = c(mean - 3 * sd, mean + 3 * sd)

x <- seq(limits[1], limits[2], length.out = 300)
xmin <- max(lb, limits[1])
xmax <- min(ub, limits[2])
areax <- seq(xmin, xmax, length.out = 300)
area <- data.frame(x = areax, 
                   ymin = 0,
                   ymax = dnorm(areax, mean = mean, sd = sd))
ggplot() +
  geom_ribbon(data = area,
              mapping = aes(x = x, ymin = ymin, ymax = ymax,
                            fill = "firebrick3", alpha = 0.5)) +
  geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), 
            mapping = aes(x = x, y = y), size = 2) + 
  geom_point(aes(x = px, y = 0), size = 10, color = "darkred") +
  scale_x_continuous(limits = limits, 
                     breaks = seq(limits[1], limits[2], 1)) +
  xlab("z-scores") +  # Title on Y axis
  ylab("Relative Frequency") +
  theme(text = element_text(size = 24)) +
  theme(legend.position = "none")

ggsave("Figure 08.12. z-test, example 2.png",
       #        width = 12, height = 6, dpi = 300)
       width = 13.5, height = 6, dpi = 200)


# ======================================================================
# False negative scatterplot
# ======================================================================

require("MASS")
require("ggplot2")

# r = 0.25
sigma4 <- matrix(c(1, .25, .25, 1), 2, 2)
scatter_pos <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma4))

ggplot(scatter_pos, aes(V1, V2)) + 
  # Regression line
  geom_smooth(method="lm",
              color = "gray70",
              size = 2,
              fill=NA,
              fullrange=TRUE) + 
  # Points
  geom_point(size=5, 
             color="#1D76B5", 
             fill="#1D76B5", 
             shape=21)

# ======================================================================
# False positive scatterplot
# ======================================================================

# r = 0.00
sigma5 <- matrix(c(1, 0, 0, 1), 2, 2)
scatter_zero <- as.data.frame(mvrnorm(n = 100, mu = rep(0, 2), sigma5))

ggplot(scatter_zero, aes(V1, V2)) + 
  # Regression line
  geom_smooth(method="lm",
              color = "gray70",
              size = 2,
              fill=NA,
              fullrange=TRUE) + 
  # Points
  geom_point(size=5, 
             color="#1D76B5", 
             fill="#1D76B5", 
             shape=21)