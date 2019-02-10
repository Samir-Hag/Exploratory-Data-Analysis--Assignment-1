url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- download.file(url, destfile = "electric_power.zip")
unzip("electric_power.zip")
library(dplyr)
all_data <- read.csv("household_power_consumption.txt", sep = ";")
# exploring the dataset structure
head(all_data)
names(all_data)
str(all_data)


#subseting the data from the dates 2007-02-01 and 2007-02-02
subdata<- all_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))

# converting Global Active power to numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# plotting Global Acive Power frequencies and saving it to png file
png("Plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red")
dev.off()

