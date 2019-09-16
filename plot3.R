# Plot the first graphic os Assignment for week 1

library(lubridate)
library(dplyr)

if(!file.exists("hpc_feb.txt")){
  source("./arrangeData.R")
}

hpc_data <- read.table("hpc_feb.txt",header=TRUE)
sub_met1 <- hpc_data$Sub_metering_1
sub_met2 <- hpc_data$Sub_metering_2
sub_met3 <- hpc_data$Sub_metering_3

plot(sub_met1,type="l", xaxt='n', col = "gray", ylab = "Energy sub Metering")
axis(1,at = c(0,length(sub_met1)/2,length(sub_met1)),c("Thu","Fri","Sat"))
lines(sub_met2,col="red")
lines(sub_met3,col="blue")
legend("topright", lty=1, col= c("gray","red","blue"),legend=c("Sub_metering_1"
                                                        ,"Sub_metering_2"
                                                        ,"Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()

