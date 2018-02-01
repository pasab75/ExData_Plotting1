library("lubridate")
library("dplyr")

dataFile <- "./data/household_power_consumption.txt";
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".");
data$DateDate <- as.Date(data$Date, format="%d/%m/%Y")
subsetdata <- subset(data, DateDate == "2007-02-01" | DateDate =="2007-02-02")

subsetdata$DateTime <- strptime(paste(subsetdata$Date, " ", subsetdata$Time), "%d/%m/%Y %H:%M:%S")
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
subsetdata$Time <- format(subsetdata$Time, format="%H:%M:%S")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)
subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
subsetdata$Global_intensity <- as.numeric(subsetdata$Global_intensity)
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)
print(head(subsetdata, n=10))
png("plot2.png", width=480, height=480)
with(subsetdata, plot(DateTime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()