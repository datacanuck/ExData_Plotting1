plot1 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", 
                           sep = ';', na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
    
    readData$DateTime <- strptime(paste(readData$Date, readData$Time), 
                                  "%d/%m/%Y %H:%M:%S")
    readData <- subset(readData, 
                       as.Date(DateTime) >= as.Date("2007-02-01") & 
                           as.Date(DateTime) <= as.Date("2007-02-02"))
    
    plotdata <- readData
    
    #Plot1
    #Histogram
    
    png(filename = "plot1.png")
    hist(plotdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red")
    dev.off()
    
    }
