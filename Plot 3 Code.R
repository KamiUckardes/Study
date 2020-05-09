powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

plot(subpower$Datetime,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(subpower$Datetime,subpower$Sub_metering_1)
lines(subpower$Datetime,subpower$Sub_metering_2,col="red")
lines(subpower$Datetime,subpower$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file="plot 3.png")

dev.off()
