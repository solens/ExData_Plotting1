full_data<-read.table("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")

Date<-as.POSIXct(full_data$Date,format="%d/%m/%Y")
Date_Time<-paste(Date,full_data$Time,sep = " ")
Date_Time<-strptime(Date_Time,format="%Y-%m-%d %H:%M:%S")

full_data2<-cbind(Date,Date_Time,full_data[,-c(1,2)])

start_date<-as.POSIXct("2007-02-01",tz="GMT")
end_date<-as.POSIXct("2007-02-03",tz="GMT")

data<-subset(full_data2,full_data2$Date_Time>=start_date)
data<-subset(data,data$Date_Time<end_date)

png(file="plot2.png")
plot(data$Date_Time,data$Global_active_power,type = "l",col="black",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()