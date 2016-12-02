# Read and subset data
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
powerSub <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# Format date & time, create png file, construct graph
dateTime <- strptime(paste(powerSub$Date, powerSub$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(powerSub$Global_active_power)
subMetering1 <- as.numeric(powerSub$Sub_metering_1)
subMetering2 <- as.numeric(powerSub$Sub_metering_2)
subMetering3 <- as.numeric(powerSub$Sub_metering_3)
voltage <- as.numeric(powerSub$Voltage)
globalReactivePower <- as.numeric(powerSub$Global_reactive_power)

png("plot4.png")
par(mfrow = c(2, 2))

plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTime, subMetering2, type = "l", col = "red")
lines(dateTime, subMetering3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()