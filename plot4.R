# Plot 4
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
png(filename="plot4.png", height=480, width=480, bg="transparent")

# plot the 4 graph in 2x2
par(mfrow=c(2,2))

# PLOT 1
plot(pData$Timestamp,
     pData$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# PLOT 2 - voltage vs time

plot(pData$Timestamp,
     pData$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# PLOT 3 
## Plot first sub-meter
plot(pData$Timestamp,
     pData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

## Plot second sub-meter
lines(pData$Timestamp,
      pData$Sub_metering_2,
      type="l",
      col="red")

## Plot third sub-meter
lines(pData$Timestamp,
      pData$Sub_metering_3,
      type="l",
      col="blue")

## state the legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")

# PLOT 4
plot(pData$Timestamp,
     pData$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
#save the figure
dev.off()
