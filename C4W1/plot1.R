my_data<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(my_data)
names(my_data)
summary(my_data)

#Creating required dataset
my_data$Date<-as.Date(my_data$Date,format='%d/%m/%Y')
dataset<-subset(my_data,Date>as.Date("2007-01-31") & Date<as.Date("2007-02-03"))

#Creating first plot as png file
png(file="plot1.png",height=480,width=480)
hist(as.numeric(dataset$Global_active_power),col="red",main="Global Active Power",
     xlab = "Global Active Power(kilowatts)")
dev.off()