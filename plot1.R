directory <- "./household_power_consumption.txt"
data <- read.table(directory, sep=";", head=TRUE, stringsAsFactors = F)
str(data)
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data1 <- subset(data, data$Datetime >= as.POSIXct("2007-02-01 00:00:00") & data$Datetime <= as.POSIXct("2007-02-02 23:59:59"))
data1$Global_active_power <- as.numeric(data1$Global_active_power)
par(mfrow = c(1,1))
hist(data1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png,'plot1.png')
dev.off()


