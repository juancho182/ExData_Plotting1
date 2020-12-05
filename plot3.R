library(dplyr)

#Load Full File
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Use only Feb 1 and Feb 2 data
myData <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

#Create DateTime
myData$DateTime <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

#make column numeric
myData[, 7]  <- as.numeric(myData[, 7])
myData[, 8]  <- as.numeric(myData[, 8])
myData[, 9]  <- as.numeric(myData[, 9])

png(filename="plot3.png", width = 480, height = 480)

plot(myData$DateTime, myData$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab="", ylim = c(0, max(myData$Sub_metering_1, myData$Sub_metering_2, myData$Sub_metering_3)))

lines(myData$DateTime, myData$Sub_metering_2, type = "l", col = "red")
lines(myData$DateTime, myData$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()