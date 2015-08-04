# read in the data
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## transform the dates and time to better formats ##
mydata$datetime<-strptime(paste(mydata$Date,mydata$Time,sep=","),format="%d/%m/%Y,%H:%M:%S")
mydata$Date<-as.Date(mydata$Date,format = "%d/%m/%Y")
mydata$Time<-strptime(mydata$Time,format="%H:%M:%S")

## Subset to the appropriate ates ##
mydata2<-mydata[(mydata$Date=="2007-02-01")|(mydata$Date=="2007-02-02"),]

## Make the time series plot ##

png(filename="plot2.png",width=480,height=480)

plot(mydata2$datetime,mydata2$Global_active_power,main="",ylab="Global Active Power (kilowatts)",type="l", xlab="")

dev.off()