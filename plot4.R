
## load/read data
guo<-read.csv( "household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE )
## change format befoer subseting
 guo$Date <- as.Date(guo$Date, format = "%d/%m/%Y"); # adjust the format
 subguo <- guo[guo$Date >= "2007-02-01" & guo$Date <= "2007-02-02", ]

## obtaining the right data(3)
data3<-rbind(as.numeric(subguo$Sub_metering_1),as.numeric(subguo$Sub_metering_2),as.numeric(subguo$Sub_metering_3))

## obtaining the right data(1)
hdata<-(as.numeric(subguo$Global_active_power))
subguo$dt<-paste(subguo$Date,subguo$Time)## creating new variable: datetime
td<-(as.POSIXct(subguo$dt))

## layout
par(mfrow=c(2,2))
plot(td,hdata, ylab='Global Active Power (kilowatts)',xlab='', type="l")
plot(td,as.numeric(subguo$Voltage),ylab='Voltage',xlab='datetime',type="l")

## ploting (3)
plot(td,data3[1,],ylab='Energy sub metering',xlab='', type="l",col="black")
lines(td,data3[2,],type="l",col="red")
lines(td,data3[3,],type="l",col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),inset=0.01,box.col= "white",bg = par("bg")) # optional legend
plot(td,as.numeric(subguo$Global_reactive_power),ylab='Global_reactive_power',xlab='datetime',type="l")


##  save as png
dev.copy(png, file = "plot4.png") ## copy plot to a PNG file
dev.off() ## close the PNG device!
