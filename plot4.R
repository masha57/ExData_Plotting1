mydata <- fread("household_power_consumption.txt", sep = ";", header = TRUE, 
                na.strings = "?")
mydata_n <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot4.png")
par(mfcol = c(2,2))
times <- as.POSIXct(strptime(paste(mydata_n$Date, mydata_n$Time), 
                             '%d/%m/%Y %H:%M:%S'))
plot(Global_active_power ~ times, mydata_n, type = "l", 
     xlab="", ylab = "Global Active Power")
plot(Sub_metering_1 ~ times, mydata_n, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ times, mydata_n, col = "red")
lines(Sub_metering_3 ~ times, mydata_n, col = "blue")
legend("topright", col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(Voltage ~ times, mydata_n, type = "l", 
     xlab = "datetime")
plot(Global_reactive_power ~ times, mydata_n, type = "l", 
     xlab = "datetime")
dev.off()