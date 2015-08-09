library("sqldf")

#load data from txt file within current working directory
mydata<-read.csv.sql("household_power_consumption.txt",
                     sep=";",
                     sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#Convert Date and Time variable to DateTime in POSIXct format
mydata$DateTime <- as.POSIXct(strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S"))

#open graphic device png
png(filename = "plot4.png",
    width = 480, height = 480, units = "px",
    bg = "white")

#set up plotting in 2 rows and 2 cols
par(mfrow=c(2,2),"bg")

#plot data
plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="black")

plot(mydata$DateTime, mydata$Voltage, type="l", xlab="datetime",ylab="Voltage", col="black")

plot(mydata$DateTime,  mydata$Sub_metering_1,type="l", col="black", xlab="", ylab="Energy sub metering")
lines(mydata$DateTime, mydata$Sub_metering_2,type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3,type="l", col="blue")
legend('topright', col=c("black","red","blue"), lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(mydata$DateTime, mydata$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power", col="black")

#close graphic device
dev.off()