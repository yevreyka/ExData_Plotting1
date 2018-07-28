#install.packages(sqldf)
library(sqldf)

#reading relevant data
my_sub_table <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', 
                             header = TRUE, sep = ";")

#plot
plot(my_file$Global_active_power, type = "o", pch = ".", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at=c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#copying to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
