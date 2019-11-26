# The file "household_power_consumption.txt" has 2,075,259 lines & 9 columns
# approximate required memory is 2,075,259x9x8 bytes/numeric
# = 149,418,648 bytes = 149,418,648/2 power 20 MB = 142.5 MB

# Create four different chart in single file
plot4 <- function(){
  # read complete file
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  #subset required data from date 1/2/2007 to 2/2/2007
  data = subset(data, Date == c("1/2/2007", "2/2/2007"))
  #converting required variables to numeric
  energy_sub_1 <- as.numeric(data$Sub_metering_1)
  energy_sub_2 <- as.numeric(data$Sub_metering_2)
  energy_sub_3 <- as.numeric(data$Sub_metering_3)
  global_active_power <- as.numeric(data$Global_active_power)
  global_reactive_power <- as.numeric(data$Global_reactive_power)
  voltage <- as.numeric(data$Voltage)
  # combine string date & time column & convert them to actual date & time data
  date_time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  # opening plot area
  png("plot4.png", width = 480, height = 480)
  # open plot area with 2 rows & 2 columns
  par(mfrow=c(2,2))
  # plots first line chart
  plot(date_time, global_active_power, type = 'l', xlab="", ylab = "Global Active Power")
  #plots second line chart
  plot(date_time, voltage, type = 'l', xlab="datetime", ylab = "Voltage")
  #plots third line chart
  plot(date_time, energy_sub_1, type = 'n', xlab="", ylab = "Energy sub metering")
  lines(date_time, energy_sub_1, type = 'l', col= "black", lwd=2)
  lines(date_time, energy_sub_2, type = 'l', col="red", lwd=2)
  lines(date_time, energy_sub_3, type = 'l', col= "blue", lwd=2)
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  #plots fourth line chart
  plot(date_time, global_reactive_power, type = 'l', xlab="datetime", ylab = "Global_reactive_power")
  #off plot device
  dev.off()
}