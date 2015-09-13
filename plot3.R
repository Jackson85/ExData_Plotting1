# Plot 3
# read the data from power consumption data set
data <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")
# concatenate the date and time columns into a timestamp
data$Timestamp <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
# Remove the date and time colums
data$Date=NULL
data$Time=NULL
# select the data set where the date start from 2007-02-01 to 2007-02-02
pData = subset(data,as.Date(data$Timestamp) >= "2007-02-01" & as.Date(data$Timestamp) < "2007-02-03") 
# start the png device 
png(filename="plot3.png", height=480, width=480, bg="transparent")
# plot the data set to line with colors
# plot first sub-meter
plot(pData$Timestamp,
     pData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
# plot second sub-meter
lines(pData$Timestamp,
      pData$Sub_metering_2,
      type="l",
      col="red")
# plot third sub-meter
lines(pData$Timestamp,
      pData$Sub_metering_3,
      type="l",
      col="blue")
# state the legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))
#save the figure
dev.off()
