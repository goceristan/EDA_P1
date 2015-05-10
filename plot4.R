#Exploratory Data Analysis
#Project 1, plot 4

#Getting the data
dataFileName <- "household_power_consumption.txt"
originalData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data we need for the plot
data <- subset(originalData, originalData$Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
dateTimeData <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePowerData <- as.numeric(data$Global_active_power)
globalReactivePowerData <- as.numeric(data$Global_reactive_power)
voltageData<-as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

#Making the plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dateTimeData, globalActivePowerData, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTimeData , voltageData, type="l", xlab="datetime", ylab="Voltage")
plot(dateTimeData, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTimeData, subMetering2, type="l", col="red")
lines(dateTimeData, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTimeData, globalReactivePowerData, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()