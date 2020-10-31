data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
day1 <- strptime("2007-02-01", "%Y-%m-%d")
day2 <- strptime("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date >= day1 & Date <= day2)
data3 <- na.omit(data2)
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time))


par(mfcol = c(2, 2), mar = c(4, 4, 0, 0), oma = c(0, 0, 2, 0))

plot(data3$DateTime, data3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

with(data3, 
     {plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l") 
         lines(DateTime, Sub_metering_2, col = "red")
         lines(DateTime, Sub_metering_3, col = "blue")})
legend("topright", lty = 1, lwd = 0.5, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                                 "Sub_metering_2", 
                                                                                 "Sub_metering_3"))


with(data3, plot(DateTime, Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage"))


with(data3, plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.copy(png, "plot4.png")
dev.off()

