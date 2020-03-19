my_data<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(my_data)
names(my_data)
summary(my_data)

#Creating required dataset
my_data$Date<-as.Date(my_data$Date,format='%d/%m/%Y')
dataset<-subset(my_data,Date>as.Date("2007-01-31") & Date<as.Date("2007-02-03"))

#Creating third plot as png file
png(file="plot3.png",height=480,width=480)
plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
     dataset$Sub_metering_1)+lines(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
                                   col="red",dataset$Sub_metering_2)+lines(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
                                                                           col="blue",dataset$Sub_metering_3)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()