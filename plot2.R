library("sqldf")

#load data from txt file within current working directory
mydata<-read.csv.sql("household_power_consumption.txt",
                     sep=";",
                     sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#Convert Date and Time variable to DateTime in POSIXct format
mydata$DateTime <- as.POSIXct(strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S"))

#open graphic device png
png(filename = "plot2.png",
    width = 480, height = 480, units = "px",
    bg = "white")

#plot data
plot(mydata$DateTime, mydata$Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)", col="black")

#close graphic device
dev.off()