## load/read data
guo<-read.csv( "household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE )
## change format befoer subseting
 guo$Date <- as.Date(guo$Date, format = "%d/%m/%Y"); # adjust the format
 subguo <- guo[guo$Date >= "2007-02-01" & guo$Date <= "2007-02-02", ]

## obtaining the right data
hdata<-(as.numeric(subguo$Global_active_power))

## ploting
hist(hdata, main='Global Active Power',xlab='Global Active Power (kilowatts)',col=2)

##  save as png
dev.copy(png, file = "plot1.png") ## copy plot1 to a PNG file
dev.off() ## close the PNG device!
