#install.packages(sqldf)
library(sqldf)

#reading relevant data
my_sub_table <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" OR Date == "2/2/2007"', 
                             header = TRUE, sep = ";")

#histogram
hist(my_sub_table$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#copying to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
