# Plot 2
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
png(filename="plot2.png", height=480, width=480, bg="transparent")
# plot the data set to line 
plot(pData$Timestamp,pData$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

#save the figure
dev.off()
