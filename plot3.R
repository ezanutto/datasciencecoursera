# read in the data
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## transform the dates and time to better formats ##
mydata$datetime<-strptime(paste(mydata$Date,mydata$Time,sep=","),format="%d/%m/%Y,%H:%M:%S")
mydata$Date<-as.Date(mydata$Date,format = "%d/%m/%Y")
mydata$Time<-strptime(mydata$Time,format="%H:%M:%S")

## Subset to the appropriate dates ##
mydata2<-mydata[(mydata$Date=="2007-02-01")|(mydata$Date=="2007-02-02"),]


png(filename="plot3.png",width=480,height=480)


plot(mydata2$datetime,mydata2$Sub_metering_1,main="",ylab="Energy sub metering",type="l", xlab="",
ylim=c(0,38.0))

par(new=T)
plot(mydata2$datetime,mydata2$Sub_metering_2,main="",ylab="",type="l", xlab="",col="red",
ylim=c(0,38.0))


par(new=T)
plot(mydata2$datetime,mydata2$Sub_metering_3,main="",ylab="",type="l", xlab="",col="blue",
ylim=c(0,38.0))


legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()