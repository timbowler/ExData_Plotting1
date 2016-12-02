# Read and subset data
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
powerSub <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# Format date & time, create png file, construct graph
dateTime <- strptime(paste(powerSub$Date, powerSub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(powerSub$Global_active_power)
png("plot2.png")
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
