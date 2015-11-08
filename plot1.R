library(sqldf)
library(datasets)

#ee<-read.csv.sql(file = "household_power_consumption.txt", sql = 'select * from file where Date>="2007-02-01" and Date<="2007-02-02" limit 1000',sep = ";",eol="\n")
ee<-read.csv(file = "household_power_consumption.txt",sep=";")
ee$Date=strptime(ee$Date,"%d/%m/%Y")
ee<-subset(ee,Date>="2007-02-01" & Date<="2007-02-02")
ee$Global_active_power<-as.numeric(ee$Global_active_power)
hist(ee$Global_active_power,col=c("red"),main = "Global active power",xlab="Global active power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
