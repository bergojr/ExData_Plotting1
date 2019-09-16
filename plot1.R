# Plot the first graphic os Assignment for week 1

library(lubridate)
library(dplyr)

if(!file.exists("hpc_feb.txt")){
  source("./arrangeData.R")
}

hpc_data <- read.table("hpc_feb.txt",header=TRUE)


hist(hpc_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()

