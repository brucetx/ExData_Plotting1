##   Exploratory Data Analysis
## Week 1 - Project 1 - Plot 2
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
pwrData <- EPData[EPData$Date >= as.Date("2007-02-01") & EPData$Date <= as.Date("2007-02-02"),]
pwrData$date_time = ymd_hms(paste(pwrData$Date, pwrData$Time))
## Plot 2
## Set graphics device
dev.set(4)
png("plot2.png", bg="transparent", width=480, height=480)
##
with (pwrData, plot(date_time, Global_active_power, 
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)" ))
## Close device
dev.off()
#####
##### End Plot 2
