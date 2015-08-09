## Exploratory Data Analysis Assignment 1
## Plot No.3
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
with(wanted_data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save plot in PGN file
dev.copy(png, file="plot3.png")
dev.off()

