# Read and subset data
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
powerSub <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create png file, construct graph
globalActivePower <- as.numeric(powerSub$Global_active_power)
png("plot1.png")
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Acitve Power (kilowatts)")
dev.off()
