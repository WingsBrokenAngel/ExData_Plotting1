data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
day1 <- strptime("2007-02-01", "%Y-%m-%d")
day2 <- strptime("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date >= day1 & Date <= day2)
data3 <- na.omit(data2)

hist(data3$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.copy(png, "plot1.png")
dev.off()
