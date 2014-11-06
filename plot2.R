## load/read data
guo<-read.csv( "household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE )
## change format befoer subseting
 guo$Date <- as.Date(guo$Date, format = "%d/%m/%Y"); # adjust the format
 subguo <- guo[guo$Date >= "2007-02-01" & guo$Date <= "2007-02-02", ]

## obtaining the right data
hdata<-(as.numeric(subguo$Global_active_power))
subguo$dt<-paste(subguo$Date,subguo$Time)## creating new variable: datetime
td<-(as.POSIXct(subguo$dt))


## ploting
 
plot(td,hdata, ylab='Global Active Power (kilowatts)',xlab='', type="l")

##  save as png
dev.copy(png, file = "plot2.png") ## copy plot to a PNG file
dev.off() ## close the PNG device!
