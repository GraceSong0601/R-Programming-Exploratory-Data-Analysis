directory <- "./household_power_consumption.txt"
data <- read.table(directory, sep=";", head=TRUE, stringsAsFactors = F)
str(data)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data1 <- subset(data, data$Datetime >= as.POSIXct("2007-02-01 00:00:00") & data$Datetime <= as.POSIXct("2007-02-02 23:59:59"))
data1$Global_active_power <- as.numeric(data1$Global_active_power)
par(mfrow = c(1,1))
plot(data1$Datetime, data1$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xaxt="n", xlab = "")
axis(1, c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00")), c("Thu", "Fri", "Sat"))
dev.copy(png,'plot2.png')
dev.off()