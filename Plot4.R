##   Exploratory Data Analysis
## Week 1 - Project 1 - Plot 4
## Prepare environment
rm(list=ls())
library(readr)
library(lubridate)
## Use read.csv to load household_power_consumption
EPData <- read.csv("Elect Pwr dataset/household_power_consumption.txt", 
                    sep = ";",
                    na.strings = "?")

##
## Check dimensions
dim(EPData)
## [1] 2075259       9
##
head(EPData)
str(EPData)
## Filter out all dates except 2/1/07 and 2/2/07
## Parse date into y-m-d
EPData$Date <- dmy(EPData$Date)
pwrData <- pwrData[pwrData$Date >= as.Date("2007-02-01") & pwrData$Date <= as.Date("2007-02-02"),]
pwrData$date_time = ymd_hms(paste(pwrData$Date, pwrData$Time))
##
## Plot 4
## Set graphics device
dev.set(4)
png("plot1.png", bg="transparent", width=480, height=480)
##
par(mfrow = c(2,2))
par(mar = c(4.5,4.5,2.5,2.5))
## Plot 4-1
with (pwrData, plot(date_time, Global_active_power, 
                     type="l",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)" ))
## Plot 4-2
with (pwrData, plot(date_time, Voltage, 
                     type="l",
                     xlab = "Date-Time",
                     ylab = "Voltage" ))
## Plot 4-3
plot(pwrData$date_time, pwrData$Sub_metering_1,type="l",col="black", ylab = "Energy sub metering", xlab = "" )
lines(pwrData$date_time, pwrData$Sub_metering_2,type="l",col="red", xlab = "" )
lines(pwrData$date_time, pwrData$Sub_metering_3,type="l",col="blue", xlab = "" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"), pch = 21, cex = 0.8, pt.cex=0.2)
## Plot 4-4
with (pwrData, plot(date_time, Global_reactive_power, 
                     type="l",
                     xlab = "Date-Time",
                     ylab = "Global Reactive Power" ))
## Close device
dev.off()
##### End Plot 4
#####
