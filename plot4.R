#First download proper data set and unzip into "plot data" folder

#Load and organize data
alldata <- read.table("./plot data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = c(rep("character",2), rep("numeric",7)))
subdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create images
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#1st graph
plot(datetime, subdata$Global_active_power, xlab = "", ylab = "Global Active Power",type = "l")

#2nd graph
plot(datetime, subdata$Voltage, xlab = "", ylab = "Voltage", type = "l")

#3rd graph
plot(datetime, subdata$Sub_metering_1, col = "black",xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, subdata$Sub_metering_2, col = "red")
lines(datetime, subdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

#4th graph
plot(datetime, subdata$Global_reactive_power, col = "black", xlab = "", ylab = "Global_reactive_power", type = "l", )
dev.off()
