library(dplyr)

#Load Full File
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Use only Feb 1 and Feb 2 data
myData <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

#make column numeric
myData[, 3]  <- as.numeric(myData[, 3])

png(filename="plot1.png", width = 480, height = 480)

hist(myData$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

dev.off()