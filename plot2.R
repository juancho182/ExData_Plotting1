library(dplyr)

#Load Full File
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Use only Feb 1 and Feb 2 data
myData <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

#Create DateTime
myData$DateTime <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

#make column numeric
myData[, 3]  <- as.numeric(myData[, 3])

#open PNG
png(filename="plot2.png", width = 480, height = 480)

#Draw line chart
plot(myData$DateTime, myData$Global_active_power, type="l",ylab = "Global Active Power (kilowatts)", xlab="")

#Close PNG
dev.off()