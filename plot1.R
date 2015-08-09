library("sqldf")

#load data from txt file within current working directory
mydata<-read.csv.sql("household_power_consumption.txt",
                     sep=";",
                     sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#open graphic device png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",
    bg = "white")

#plot data
hist(mydata$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

#close graphic device
dev.off()