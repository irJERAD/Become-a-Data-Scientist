# Charts for DSFO_05_01 "Exploratory Graphs"

require("datasets")

# Histogram
lake <- LakeHuron
hist(lake)

# LOAD DATASET
require("datasets")
data(lake)  # Annual Canadian Lynx trappings 1821-1934

# HISTOGRAM WITH OPTIONS
hist(lake,
     freq = FALSE,  # Axis shows density, not frequency
     col = "light gray",  # Color for histogram
     main = "Annual measurements of the level, in feet, of Lake Huron, 1875–1972.")

# SUPERIMPOSED KERNEL DENSITY ESTIMATES
lines(density(lake), col = "blue", lwd = 5)
lines(density(lake, adjust = 3), col = "darkgreen", lwd = 5)