## This is my Assignment: Course Project 1 for Exploratory-data-analysis
## copy/download the dataset from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" URL
## 
##

## make sure your working direcoty is correct
getwd()

##make sure the dataset file is downloaded on correct directory
dataSetFileName <- "./household_power_consumption.txt"

##File Name
fileName <- "plot3.png"

## copy dataset from file to memeory 
originalData <- read.table(dataSetFileName, stringsAsFactors=F, dec=".", header = T, sep=";")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than 
# reading in the entire dataset and subsetting to those dates.
filteredData <- originalData[originalData$Date %in% c("1/2/2007","2/2/2007"), ]

## separte data for Sub_Metering 1, 2 and 3
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

## convert the Date and Time variables to Date/Time classes in R using 
##the strptime() and as.Date() functions.
dateTime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Get only Global active power data
globalActivePowerData <- as.numeric(filteredData$Global_active_power)

##Construct the plot and save it to a PNG file with a width of 480 pixels and 
##a height of 480 pixels and write
png(fileName, width=480, height=480)

## plot graph with proper color and Labaling. 
##Constructed using the base plotting system 
##for subMetering 1
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy Submetering")

##for subMetering 2
lines(dateTime, subMetering2, type="l", col="red")

##for subMetering 3
lines(dateTime, subMetering3, type="l", col="blue")

## add Legend to this graph so peoble will understand this graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


##Close off the ploting device
dev.off()
