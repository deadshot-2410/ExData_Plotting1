my_data<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(my_data)
names(my_data)
summary(my_data)

#Creating required dataset
my_data$Date<-as.Date(my_data$Date,format='%d/%m/%Y')
dataset<-subset(my_data,Date>as.Date("2007-01-31") & Date<as.Date("2007-02-03"))

#Creating fouth plot as png file
png(file="plot4.png",height=480,width=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(dataset,{
  plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
       ,dataset$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab=" ",type='l')
  plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
       ,dataset$Voltage,ylab = "Voltage",xlab="datetime",type='l')
  plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
       dataset$Sub_metering_1)+lines(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
                                     col="red",dataset$Sub_metering_2)+lines(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S"),
                                                                             col="blue",dataset$Sub_metering_3)
  plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
       ,dataset$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type='l')
  
})
dev.off()