#First download proper data set and unzip into "plot data" folder

#Load and organize data
alldata <- read.table("./plot data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = c(rep("character",2), rep("numeric",7)))
subdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create image
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, subdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, subdata$Sub_metering_2, col = "red")
lines(datetime, subdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
