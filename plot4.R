directory <- "./household_power_consumption.txt"
data <- read.table(directory, sep=";", head=TRUE, stringsAsFactors = F)
str(data)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data1 <- subset(data, data$Datetime >= as.POSIXct("2007-02-01 00:00:00") & data$Datetime <= as.POSIXct("2007-02-02 23:59:59"))
data1$Global_active_power <- as.numeric(data1$Global_active_power)
plot(type="n")
par(mfrow=c(2,2))
#Global Active Power
plot(data1$Datetime, data1$Global_active_power, type = "l", xaxt="n", xlab = "", ylab = "Global Active Power")
axis(1, c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00")), c("Thu", "Fri", "Sat"))
#Voltage
plot(data1$Datetime, data1$Voltage, type = "l", xaxt="n", xlab = "datetime", ylab = "Voltage")
axis(1, c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00")), c("Thu", "Fri", "Sat"))
#Sub_metering
plot(data1$Datetime, data1$Sub_metering_1, type = "l", xaxt="n", xlab = "", ylab = "Energy sub metering")
points(data1$Datetime, data1$Sub_metering_2, type = "l", xaxt="n", col = "red", xlab = "", ylab = "")
points(data1$Datetime, data1$Sub_metering_3, type = "l", xaxt="n", col = "blue", xlab = "", ylab = "")
axis(1, c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00")), c("Thu", "Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
#Global_reactive_power
plot(data1$Datetime, data1$Global_reactive_power, type = "l", xaxt="n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00")), c("Thu", "Fri", "Sat"))
dev.copy(png,'plot4.png')
dev.off()