# Ergast.com has historical data for Formula 1 races
# 1957 race data is available in JSON format at:
# http://ergast.com/api/f1/1957/results.json
# Use jsonlite for this example

install.packages(c("jsonlite", "curl"))
require("jsonlite")

f1 <- fromJSON('http://ergast.com/api/f1/1957/results.json')
f1
str(f1)

# Convert R list to data.frame
dr <- f1$MRData$RaceTable$Races$Results[[1]]$Driver
colnames(dr)
dr[1:5, c("givenName", "familyName", 
         "dateOfBirth", "nationality")]
