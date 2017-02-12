##   Exploratory Data Analysis
## Week 1 - Project 1 - Plot 3
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
###
### Plot 3
## Set graphics device
dev.set(4)
png("plot1.png", bg="transparent", width=480, height=480)
##
plot(pwrData$date_time, pwrData$Sub_metering_1,type="l",col="black", ylab = "Energy sub metering", xlab = "" )
lines(pwrData$date_time, pwrData$Sub_metering_2,type="l",col="red", xlab = "" )
lines(pwrData$date_time, pwrData$Sub_metering_3,type="l",col="blue", xlab = "" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       col=c("black","red","blue"), pch = 21, cex = 0.8, pt.cex=0.2)
## Close device
dev.off()
##### End Plot 3
