
my_data<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(my_data)
names(my_data)
summary(my_data)

#Creating required dataset
my_data$Date<-as.Date(my_data$Date,format='%d/%m/%Y')
dataset<-subset(my_data,Date>as.Date("2007-01-31") & Date<as.Date("2007-02-03"))

#Creating second plot as png file
png(file="plot2.png",height=480,width=480)
plot(as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")
     ,dataset$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab=" ",type='l')
dev.off()