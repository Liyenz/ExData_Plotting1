## Exploratory Data Analysis Assignment 1
## Plot No.1
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

## Build Plot No.1
hist(wanted_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

## Save plot in PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

