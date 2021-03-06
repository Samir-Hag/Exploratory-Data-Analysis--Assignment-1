library(dplyr)
library(lubridate) # for manibulating date and time

# reading dataset
all_data <- read.csv("household_power_consumption.txt", sep = ";")

#subseting the data from the dates 2007-02-01 and 2007-02-02 
subdata<- all_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))

# concatenating Date and Time into new varaible "datetime"
subdata$datetime <- paste(subdata$Date, subdata$Time, sep = " ")

# Converting "datetime" variable into POSIXct format
subdata$datetime <- dmy_hms(subdata$datetime)

# converting variables into numeric var
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))


# plotting

png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(subdata$datetime, subdata$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

plot(subdata$datetime, subdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subdata$datetime,subdata$Sub_metering_1, type ="l", ylab="Energy sub metering", xlab="")
lines(subdata$datetime,subdata$Sub_metering_2, type ="l", col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, type ="l", col = "blue")
legend("topright", legend = c("Submetering_1", "Submetering_2", "Submetering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")

plot(subdata$datetime,subdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")

dev.off()





