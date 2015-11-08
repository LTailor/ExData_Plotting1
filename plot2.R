library(sqldf)
library(datasets)

#ee<-read.csv.sql(file = "household_power_consumption.txt", sql = 'select * from file where Date>="2007-02-01" and Date<="2007-02-02" limit 1000',sep = ";",eol="\n")
ee<-read.csv(file = "household_power_consumption.txt",sep=";")
ee$Date=strptime(ee$Date,"%d/%m/%Y")
ee<-subset(ee,Date>="2007-02-01" & Date<="2007-02-02")
ee$Global_active_power<-as.numeric(ee$Global_active_power)

plot(ee$Time, ee$Global_active_power, type = "l",ylab="Global active power (kilowatts)",xaxt="n")
axis(1, c(0, 720, 1440), c("Thu", "Fri", "Sat"))
dev.copy(png,file="plot2.png")
dev.off()