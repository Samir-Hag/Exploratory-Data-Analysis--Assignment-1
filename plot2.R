library(dplyr)
library(lubridate) # for manibulating date and time

# reading dataset
all_data <- read.csv("household_power_consumption.txt", sep = ";")

#subseting the data from the dates 2007-02-01 and 2007-02-02 
subdata<- all_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))

# converting Global_active_power into numeric var
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# concatenating Date and Time into new varaible "datetime"
subdata$datetime <- paste(subdata$Date, subdata$Time, sep = " ")

# Converting "datetime" variable into POSIXct format
subdata$datetime <- dmy_hms(subdata$datetime)

# Save plot as png file
png("Plot2.png", width = 480, height = 480)
with(subdata, plot(datetime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()
