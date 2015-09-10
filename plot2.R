#First download proper data set and unzip into "plot data" folder

#Load and organize data
alldata <- read.table("./plot data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = c(rep("character",2), rep("numeric",7)))
subdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create image
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
