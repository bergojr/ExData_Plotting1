# This script reads a data set from UC Irvine Machine Learning Repository about
# “Individual household electric power consumption.
# After this script the selected data set is recorded in a text file.


library(lubridate)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "exdata_data_household_power_consumption.zip"
fileNameTxt <- "household_power_consumption.txt"

if(!file.exists(fileName)){
  download.file(fileURL,fileName)
  unzip(fileName, files = NULL, exdir=".")
}

# Estimate the memory size  necessary to read the data

top.rows <- object.size(read.table(fileNameTxt, nrow=1000))
lines <- as.numeric(gsub("[^0-9]", "", system("wc -l household_power_consumption.txt", intern=T)))
size.estimate <- lines / 1000 * top.rows
size.estimate.Mb <- format(size.estimate, units = "MB", standard = "auto", digits = 1L)
print(paste("Estimated memory:", size.estimate.Mb))


# Subseting the required data
alldata <- read.table(fileNameTxt, header = TRUE, sep = ";", na.strings = "NA") 
alldata$Date <- as.Date(alldata$Date,tryFormats = c("%d-%m-%Y", "%d/%m/%Y"))
selected_data <- subset(alldata, Date >= as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

write.table(selected_data, "hpc_feb.txt",row.names = FALSE)
rm(list=ls())
