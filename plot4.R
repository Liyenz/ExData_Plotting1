## Exploratory Data Analysis Assignment 1
## Plot No.4
## Getting the data

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Use data from date 2007-02-01 and 2007-02-02
## Subsetting data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
wanted_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting date
datetime <- paste(as.Date(wanted_data$Date), wanted_data$Time)
wanted_data$Datetime <- as.POSIXct(datetime)
##head(wanted_data)

## Build Plot No.3
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(wanted_data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving Plot in PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()