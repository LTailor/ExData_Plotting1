library(sqldf)
library(datasets)

#ee<-read.csv.sql(file = "household_power_consumption.txt", sql = 'select * from file where Date>="2007-02-01" and Date<="2007-02-02" limit 1000',sep = ";",eol="\n")
ee<-read.csv(file = "household_power_consumption.txt",sep=";")
ee$Date=strptime(ee$Date,"%d/%m/%Y")
ee<-subset(ee,Date>="2007-02-01" & Date<="2007-02-02")
ee$Sub_metering_1<-as.numeric(ee$Sub_metering_1)
ee$Sub_metering_2<-as.numeric(ee$Sub_metering_2)
ee$Sub_metering_3<-as.numeric(ee$Sub_metering_3)

plot(ee$Time,ee$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(ee$Time, ee$Sub_metering_2,col="red")
lines(ee$Time, ee$Sub_metering_3,col="blue")


dev.copy(png,file="plot3.png")
dev.off()
