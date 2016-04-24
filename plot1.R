# Read in the file
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twoDayData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create a hostogram plot of the global active power
globalActivePower <- as.numeric(twoDayData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
