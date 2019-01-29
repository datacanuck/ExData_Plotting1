plot2 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", 
                           sep = ';', na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
    
    readData$DateTime <- strptime(paste(readData$Date, readData$Time), 
                                  "%d/%m/%Y %H:%M:%S")
    readData <- subset(readData, 
                       as.Date(DateTime) >= as.Date("2007-02-01") & 
                           as.Date(DateTime) <= as.Date("2007-02-02"))
    
    plotdata <- readData
    
    #Plot2
    png(filename = "plot2.png")
    plot(readData$DateTime, readData$Global_active_power, ylab = "Global Active Power (Kilowatts)", xlab = "", type = "l")
    dev.off()
    
}
