plot4 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", 
                           sep = ';', na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
    
    readData$DateTime <- strptime(paste(readData$Date, readData$Time), 
                                  "%d/%m/%Y %H:%M:%S")
    readData <- subset(readData, 
                       as.Date(DateTime) >= as.Date("2007-02-01") & 
                           as.Date(DateTime) <= as.Date("2007-02-02"))
    
    plotdata <- readData
    
    #Plot4
    png(filename = "plot4.png")
    par(mfrow=c(2,2))
    #Plot #1
    plot(plotdata$DateTime, plotdata$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
    #Plot #2
    plot(plotdata$DateTime, plotdata$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l")
    #Plot #3
    plot(plotdata$DateTime, plotdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(plotdata$DateTime, plotdata$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
    lines(plotdata$DateTime, plotdata$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)
    #Plot #4
    plot(plotdata$DateTime, plotdata$Global_reactive_power, xlab = "Datetime", ylab = "Global_Reactive_Power", type = "l")
    dev.off()
    
    }

