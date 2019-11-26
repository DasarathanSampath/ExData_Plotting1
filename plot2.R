# The file "household_power_consumption.txt" has 2,075,259 lines & 9 columns
# approximate required memory is 2,075,259x9x8 bytes/numeric
# = 149,418,648 bytes = 149,418,648/2 power 20 MB = 142.5 MB

# Line chart of "global_active_power" against date & time
plot2 <- function(){
  #read complete file
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  #subset required data from date 1/2/2007 to 2/2/2007
  data = subset(data, Date == c("1/2/2007", "2/2/2007"))
  
  #convert "global_active_power" to numeric
  global_active_power <- as.numeric(data$Global_active_power)
  
  # combine string date & time column & convert them to actual date & time data
  date_time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  #open png plot
  png("plot2.png", width = 480, height = 480)
  #plot line chart
  plot(date_time, global_active_power, type = 'l', xlab="", ylab = "Global Active Power (kilowatts)")
  # off plot device
  dev.off()
}