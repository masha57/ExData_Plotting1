mydata <- fread("household_power_consumption.txt", sep = ";", header = TRUE, 
                na.strings = "?")
mydata_n <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot2.png")
plot(as.POSIXct(strptime(paste(mydata_n$Date, mydata_n$Time), '%d/%m/%Y %H:%M:%S')),
     mydata_n$Global_active_power, type = "l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()

