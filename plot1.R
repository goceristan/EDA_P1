#Exploratory Data Analysis
#Project 1, plot 1

#Getting the data
dataFileName <- "household_power_consumption.txt"
originalData <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data we need for the plot
data <- subset(originalData, originalData $Date %in% c("1/2/2007","2/2/2007"))

#Formatting the data
globalActivePowerData <- as.numeric(data$Global_active_power)

#Making the plot
png("plot1.png", width=480, height=480)
hist(globalActivePowerData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()