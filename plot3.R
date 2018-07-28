#install.packages(sqldf)
library(sqldf)

#reading relevant data
my_sub_table <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', 
                             header = TRUE, sep = ";")

#plot
plot(my_file$Sub_metering_1, col="black", type = "o", pch = ".", xaxt = "n", ylab = "Energy sub metering", xlab = "")
points(my_file$Sub_metering_2, col="red", type = "o", pch = ".")
points(my_file$Sub_metering_3, col = "blue", type = "o", pch=".")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copying to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()