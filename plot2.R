# Plot the first graphic os Assignment for week 1

library(lubridate)
library(dplyr)

if(!file.exists("hpc_feb.txt")){
  source("./arrangeData.R")
}

hpc_data <- read.table("hpc_feb.txt",header=TRUE)


plot(hpc_data$Global_active_power,type='l', xaxt='n', ylab = "Global Active Power (kilowatts)")
axis(1,at = c(0,length(hpc_data$Global_active_power)/2,length(hpc_data$Global_active_power)),c("Thu","Fri","Sat"))
dev.copy(png,"plot2.png")
dev.off()

