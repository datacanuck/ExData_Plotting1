plot3 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", 
                           sep = ';', na.strings = "?", header = TRUE, 
                           colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
    head(readData, n= 100)
    
    readData$DateTime <- strptime(paste(readData$Date, readData$Time), 
                                "%d/%m/%Y %H:%M:%S")
    readData <- subset(readData, 
                     as.Date(DateTime) >= as.Date("2007-02-01") & 
                         as.Date(DateTime) <= as.Date("2007-02-02"))
    
   plotdata <- readData
    
    submetering1 <- plotdata$Sub_metering_1
    submetering2 <- plotdata$Sub_metering_2
    submetering3 <- plotdata$Sub_metering_3
    
    #Plot3
    png(filename = "plot3.png")
    plot(plotdata$DateTime, submetering1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
    lines(plotdata$DateTime, submetering2, col = "red")
    lines(plotdata$DateTime, submetering3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    
    }
