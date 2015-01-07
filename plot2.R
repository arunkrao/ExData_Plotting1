# Assignment 1, Exploratory Data Analysis
# Uses electric power consumption data for period of 4 years

# Set working directory to location of power consumption data file
setwd ("D:/Training/Exploratory Data Analysis")

# Read full table as characters or numerics, not factors
power_data <- read.table ("household_power_consumption.txt", 
                          header = TRUE, sep = ";", na.strings = c("?"),
                          colClasses = c ("character", "character", "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric", "numeric"))

# Convert date field from character to date format since we will need for date comparisons
power_data$Date <- as.Date (power_data$Date, "%d/%m/%Y")

# Eliminate the data we don't need, only keep the date range we want
power_data <- power_data [power_data$Date >= as.Date ("2007-02-01") 
                          & power_data$Date < as.Date ("2007-02-03"),]

# Create a column with a consolidated date-time field which we will need for graphing
power_data$dt <- as.POSIXlt (paste (as.character (power_data$Date), power_data$Time))

# Plot the graph to the designated png file; default size is 480 x 480 pixels anyway
png ("plot2.png")

plot (power_data$dt, power_data$Global_active_power, "l", xlab = "", 
      ylab = "Global Active Power (kilowatts)")

dev.off ()
