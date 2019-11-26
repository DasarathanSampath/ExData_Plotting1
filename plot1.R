# The file "household_power_consumption.txt" has 2,075,259 lines & 9 columns
# approximate required memory is 2,075,259x9x8 bytes/numeric
# = 149,418,648 bytes = 149,418,648/2 power 20 MB = 142.5 MB


# Histogram chart for "global_active_power"
plot1 <- function(){
  #read complete file
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  #subset required data from date 1/2/2007 to 2/2/2007
  data = subset(data, Date == c("1/2/2007", "2/2/2007"))
  
  #convert "global_active_power" to numeric
  global_active_power <- as.numeric(data$Global_active_power)
  
  #open png plot device
  png("plot1.png", width = 480, height = 480)
  #plot histogram
  hist(global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
  #off graphic device
  dev.off()
}