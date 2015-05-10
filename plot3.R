#Exploratory Data Analysis
#Project 1, plot 3

#Getting the data
dataFileName <- "household_power_consumption.txt"
originalData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data we need for the plot
data <- subset(originalData, originalData$Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
dateTimeData <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

#Making the plot
png("plot3.png", width=480, height=480)
plot(dateTimeData, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTimeData, subMetering2, type="l", col="red")
lines(dateTimeData, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
