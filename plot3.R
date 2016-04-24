# Read in the file
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twoDayData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create a base blot with sub metering 1, 2, and 3, with different colors
#Set up the data
datetime <- strptime(paste(twoDayData$Date, twoDayData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(twoDayData$Global_active_power)
subMetering1 <- as.numeric(twoDayData$Sub_metering_1)
subMetering2 <- as.numeric(twoDayData$Sub_metering_2)
subMetering3 <- as.numeric(twoDayData$Sub_metering_3)

# Create the plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()