# Assignment 1, Exploratory Data Analysis
# Uses electric power consumption data for period of 4 years

setwd ("D:/Training/Exploratory Data Analysis")
power_data <- read.table ("household_power_consumption.txt", 
                          header = TRUE, sep = ";", na.strings = c("?"),
                          colClasses = c ("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power_data$Date <- as.Date (power_data$Date, "%d/%m/%Y")

power_data <- power_data [power_data$Date >= as.Date ("2007-02-01") & power_data$Date < as.Date ("2007-02-03"),]

power_data$dt <- as.POSIXlt (paste (as.character (power_data$Date), power_data$Time))

png ("plot2.png")
plot (power_data$dt, power_data$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off ()
