## load/read data
guo<-read.csv( "household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE )
## change format befoer subseting
 guo$Date <- as.Date(guo$Date, format = "%d/%m/%Y"); # adjust the format
 subguo <- guo[guo$Date >= "2007-02-01" & guo$Date <= "2007-02-02", ]

## obtaining the right data
data3<-rbind(as.numeric(subguo$Sub_metering_1),as.numeric(subguo$Sub_metering_2),as.numeric(subguo$Sub_metering_3))

png('plot3.png')
## ploting
plot(td,data3[1,],ylab='Energy sub metering',xlab='', type="l",col="black")
lines(td,data3[2,],type="l",col="red")
lines(td,data3[3,],type="l",col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),bg = par("bg")) # optional legend

##  save as png
##dev.copy(png, file = "plot3.png") ## copy plot to a PNG file
dev.off() ## close the PNG device!
