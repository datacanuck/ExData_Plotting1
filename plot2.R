plot2 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", sep = ';', header = TRUE, colClasses = "character")
    head(readData, n= 100)
    
    readDataSubsetted1 <- readData[readData$Date == "2/1/2007",]
    readDataSubsetted2 <- readData[readData$Date == "2/2/2007",]         
    
    readDataSubsetted <- rbind(readDataSubsetted1,readDataSubsetted2)                              
    head(readDataSubsetted)
    
    plotdata <- readDataSubsetted
    
    #Clean data
    globalactivepower <- subset(x = plotdata, subset = (Global_active_power != "?"), select = Global_active_power)
    globalactivepower <- as.numeric(globalactivepower$Global_active_power)
    
    #Plot2
    png(filename = "plot2.png")
    plot(globalactivepower, ylab = "Global Active Power (Kilowatts)", xlab = "", type = "l", axes = FALSE)
    axis(side = 1, at = c(1, length(globalactivepower)/2, length(globalactivepower)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0,2,4,6), labels = c(0,2,4,6))
    box()
    dev.off()
    
}
