data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
day1 <- strptime("2007-02-01", "%Y-%m-%d")
day2 <- strptime("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date >= day1 & Date <= day2)
data3 <- na.omit(data2)
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time))

plot(data3$DateTime, data3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy(png, "plot2.png")
dev.off()
