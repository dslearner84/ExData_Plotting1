#Read all the data from the file
all_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"')
#Setting the date format
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

#Filter the required data.
data <- subset(all_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all_data)

# Convert to date classes.
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Generate plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))