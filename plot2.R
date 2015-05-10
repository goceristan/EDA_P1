#Exploratory Data Analysis
#Project 1, plot 2

#Getting the data
dataFileName <- "household_power_consumption.txt"
originalData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data we need for the plot
data <- subset(originalData, originalData$Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
dateTimeData <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePowerData <- as.numeric(data$Global_active_power)

#Making the plot
png("plot2.png", width=480, height=480)
plot(dateTimeData, globalActivePowerData, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()