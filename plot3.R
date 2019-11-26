# The file "household_power_consumption.txt" has 2,075,259 lines & 9 columns
# approximate required memory is 2,075,259x9x8 bytes/numeric
# = 149,418,648 bytes = 149,418,648/2 power 20 MB = 142.5 MB

# line chart of three variables "sub metering-1, 2 & 3
plot3 <- function(){
  # read complete file
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  #subset required data from date 1/2/2007 to 2/2/2007
  data = subset(data, Date == c("1/2/2007", "2/2/2007"))
  
  # convert sub metering data to numeric
  energy_sub_1 <- as.numeric(data$Sub_metering_1)
  energy_sub_2 <- as.numeric(data$Sub_metering_2)
  energy_sub_3 <- as.numeric(data$Sub_metering_3)
  
  # combine string date & time column & convert them to actual date & time data
  date_time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  #open png plot
  png("plot3.png", width = 480, height = 480)
  #opens empty plot area
  plot(date_time, energy_sub_1, type = 'n', xlab="", ylab = "Energy sub metering")
  # Add lines for sub metering1
  lines(date_time, energy_sub_1, type = 'l', col= "black", lwd=2)
  # Add lines for sub metering2
  lines(date_time, energy_sub_2, type = 'l', col="red", lwd=2)
  # Add lines for sub metering3
  lines(date_time, energy_sub_3, type = 'l', col= "blue", lwd=2)
  #adding legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  # off plot device
  dev.off()
}