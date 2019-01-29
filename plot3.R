plot3 <- function(){
    readData <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt", sep = ';', header = TRUE, colClasses = "character")
    head(readData, n= 100)
    
    readDataSubsetted1 <- readData[readData$Date == "2/1/2007",]
    readDataSubsetted2 <- readData[readData$Date == "2/2/2007",]         
    
    readDataSubsetted <- rbind(readDataSubsetted1,readDataSubsetted2)                              
    head(readDataSubsetted)
    
    plotdata <- readDataSubsetted
    
    #Clean data
    submetering1 <- subset(x = plotdata, subset = (Sub_metering_1 != "?"), select = Sub_metering_1)
    submetering1 <- as.numeric(submetering1$Sub_metering_1)
    submetering2 <- subset(x = plotdata, subset = (Sub_metering_2 != "?"), select = Sub_metering_2)
    submetering2 <- as.numeric(submetering2$Sub_metering_2)
    submetering3 <- subset(x = plotdata, subset = (Sub_metering_3 != "?"), select = Sub_metering_3)
    submetering3 <- as.numeric(submetering3$Sub_metering_3)
    
    #Plot3
    png(filename = "plot3.png")
    plot(submetering1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "", axes = FALSE)
    par(new = TRUE)
    plot(submetering2, type = "l", col = "red", ylab = "Energy sub metering", xlab = "", axes = FALSE)
    par(new = TRUE)
    plot(submetering3, type = "l", col = "blue", ylab = "Energy sub metering", xlab = "", axes = FALSE)
    #title(xlab = "Energy sub metering")
    axis(side = 1, at = c(1, length(submetering1)/2, length(submetering1)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0,10,20,30), labels = c(0,10,20,30))
    box()
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    
    }
