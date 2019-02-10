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

# converting Sub_metering variables into numeric var
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))

png("Plot3.png", width = 480, height = 480)
with(subdata, {
        plot(Sub_metering_1~datetime, type ="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime, type ="l", col = "red")
        lines(Sub_metering_3~datetime, type ="l", col = "blue")
        })
legend("topright", legend = c("Submetering_1", "Submetering_2", "Submetering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)

dev.off()
