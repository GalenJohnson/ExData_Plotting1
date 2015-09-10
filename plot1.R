#First download proper data set and unzip into "plot data" folder

#Load and organize data
alldata <- read.table("./plot data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = c(rep("character",2), rep("numeric",7)))
subdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create image
png(filename = "plot1.png", width = 480, height = 480)
hist(Global_active_power, main="Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
