mydata <- fread("household_power_consumption.txt", sep = ";", header = TRUE, 
                na.strings = "?")
mydata_n <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png")
hist(mydata_n$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
