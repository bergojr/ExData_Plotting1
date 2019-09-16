# Plot the first graphic os Assignment for week 1

library(lubridate)
library(dplyr)
library(ggplot2)

if(!file.exists("hpc_feb.txt")){
  source("./arrangeData.R")
}

hpc_data <- read.table("hpc_feb.txt",header=TRUE)


par(mfrow = c(2,2))

# Plot Graphic 1

plot(hpc_data$Global_active_power, type="l", xaxt='n', ylab = "Global Active Power"
     , xlab ="", main = "Global Active Power")
axis(1,at = c(0,length(hpc_data$Global_active_power)/2,length(hpc_data$Global_active_power)),c("Thu","Fri","Sat"))


# Plot Graphic 2

plot(hpc_data$Voltage ,type='l', xaxt='n', ylab = "Voltage", xlab = "datetime")
axis(1,at = c(0,length(hpc_data$Voltage)/2,length(hpc_data$Voltage)),c("Thu","Fri","Sat"))

# Plot Graphic 3

sub_met1 <- hpc_data$Sub_metering_1
sub_met2 <- hpc_data$Sub_metering_2
sub_met3 <- hpc_data$Sub_metering_3

plot(sub_met1,type="l", xaxt='n', col = "gray", ylab = "Energy sub Metering", xlab="")
axis(1,at = c(0,length(sub_met1)/2,length(sub_met1)),c("Thu","Fri","Sat"))
lines(sub_met2,col="red")
lines(sub_met3,col="blue")

legend(x=length(sub_met1)/4, y=max(sub_met1)*1.2, bty = "n", cex = 0.9, y.intersp = 0.5,  
       lty=1, col= c("gray","red","blue"),legend=c("Sub_metering_1" 
                                                   ,"Sub_metering_2"
                                                   ,"Sub_metering_3"))

# Plot Graphic 4

plot(hpc_data$Global_reactive_power, type ="l",xaxt='n', ylab = "Global_Rective_Power", xlab="datetime")
axis(1,at = c(0,length(hpc_data$Global_reactive_power)/2,length(hpc_data$Global_reactive_power)),c("Thu","Fri","Sat"))

dev.copy(png,"plot4.png")
dev.off()

