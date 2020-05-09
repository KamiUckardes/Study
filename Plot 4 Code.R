powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(subpower$Datetime,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power") 

plot(subpower$Datetime,as.numeric(as.character(subpower$Voltage)),type="l",xlab="datetime",ylab="Voltage") 

plot(subpower$Datetime,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(subpower$Datetime,subpower$Sub_metering_1)
lines(subpower$Datetime,subpower$Sub_metering_2,col="red")
lines(subpower$Datetime,subpower$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subpower$Datetime,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_Reactive_Power") 

dev.copy(png,file="plot 4.png")

dev.off()

