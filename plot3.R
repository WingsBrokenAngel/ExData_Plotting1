data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
day1 <- strptime("2007-02-01", "%Y-%m-%d")
day2 <- strptime("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date >= day1 & Date <= day2)
data3 <- na.omit(data2)
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time))

with(data3, 
     {plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l") 
     lines(DateTime, Sub_metering_2, col = "red")
     lines(DateTime, Sub_metering_3, col = "blue")})

legend("topright", lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                                        "Sub_metering_2", 
                                                                                        "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()

