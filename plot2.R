# Read in the file
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twoDayData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create a base plot of global active power 
datetime <- strptime(paste(twoDayData$Date, twoDayData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(twoDayData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
