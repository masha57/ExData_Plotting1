URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "household_power_consumption.zip")
unzip("household_power_consumption.zip", "household_power_consumption.txt")
mydata <- fread("household_power_consumption.txt", sep = ";", header = TRUE, 
                na.strings = "?")
mydata_n <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot3.png")
times <- as.POSIXct(strptime(paste(mydata_n$Date, mydata_n$Time), 
                             '%d/%m/%Y %H:%M:%S'))
plot(Sub_metering_1 ~ times, mydata_n, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ times, mydata_n, col = "red")
lines(Sub_metering_3 ~ times, mydata_n, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()