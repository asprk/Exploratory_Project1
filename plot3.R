fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="exdata-data-household_power_consumption.zip",mode="wb")
unzip("exdata-data-household_power_consumption.zip")
power_consumption=read.table("household_power_consumption.txt",skip=66637,nrows=2880,stringsAsFactors=F,sep=";")
names(power_consumption)[1]="Date"
names(power_consumption)[2]="Time"
names(power_consumption)[3]="Global_active_power"
names(power_consumption)[4]="Global_reactive_power"
names(power_consumption)[5]="Voltage"
names(power_consumption)[6]="Global_intensity"
names(power_consumption)[7]="Sub_metering_1"
names(power_consumption)[8]="Sub_metering_2"
names(power_consumption)[9]="Sub_metering_3"
power_consumption$comb=paste(power_consumption$Date,power_consumption$Time,sep=" ")
power_consumption$comb=strptime(power_consumption$comb,format="%d/%m/%Y %H:%M:%S")
power_consumption$diff=as.numeric(power_consumption$comb-power_consumption[1,10])

plot3=with(power_consumption,plot(diff,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n"))
with(power_consumption,lines(diff,Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red",xaxt="n"))
with(power_consumption,lines(diff,Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue",xaxt="n"))
axis(1,at=c(0,86400,172800),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
