library(dplyr)

#Load Full File
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Use only Feb 1 and Feb 2 data
myData <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

#Create DateTime
myData$DateTime <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

#make column numeric
myData[, 4]  <- as.numeric(myData[, 4])
myData[, 5]  <- as.numeric(myData[, 5])
myData[, 7]  <- as.numeric(myData[, 7])
myData[, 8]  <- as.numeric(myData[, 8])
myData[, 9]  <- as.numeric(myData[, 9])

#open PNG
png(filename="plot4.png", width = 480, height = 480)

#set 2x2 canvas
par(mfrow = c(2,2))

#add chart 1
plot(myData$DateTime, myData$Global_active_power, type="l",ylab = "Global Active Power", xlab="")

#add chart 2
plot(myData$DateTime, myData$Voltage, type="l",ylab = "Voltage", xlab="datetime")

#add chart 3
plot(myData$DateTime, myData$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab="", ylim = c(0, max(myData$Sub_metering_1, myData$Sub_metering_2, myData$Sub_metering_3)))

#add submetering2 line
lines(myData$DateTime, myData$Sub_metering_2, type = "l", col = "red")
#add submtering3 line
lines(myData$DateTime, myData$Sub_metering_3, type = "l", col = "blue")

#add legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#add chart 4
plot(myData$DateTime, myData$Global_reactive_power, type="l", ylab="Global_reactive_Power", xlab="datetime")

#close PNG
dev.off()