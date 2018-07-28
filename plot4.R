#install.packages(sqldf)
library(sqldf)

#reading relevant data
my_sub_table <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', 
                             header = TRUE, sep = ";")

par(mfrow = c(2,2), mar = c(4,4,1,1))
#plot [1,1]
plot(my_sub_table$Global_active_power, type = "o", pch = ".", xaxt = "n", ylab = "Global Active Power", xlab = "")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#plot[1,2]
plot(my_sub_table$Voltage, type = "o", pch = ".", xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#plot[2,1]
plot(my_sub_table$Sub_metering_1, col="black", type = "o", pch = ".", xaxt = "n", ylab = "Energy sub metering", xlab = "")
points(my_sub_table$Sub_metering_2, col="red", type = "o", pch = ".")
points(my_sub_table$Sub_metering_3, col = "blue", type = "o", pch=".")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, bty="n")

#plot[2,2]
plot(my_sub_table$Global_reactive_power, type = "o", pch = ".", xaxt = "n", ylab = "Global_Rective_Power", xlab = "datetime")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#copying to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
