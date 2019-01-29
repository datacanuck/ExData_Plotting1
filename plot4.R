plot4 <- function(){
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
    globalactivepower <- subset(x = plotdata, subset = (Global_active_power != "?"), select = Global_active_power)
    globalactivepower <- as.numeric(globalactivepower$Global_active_power)
    globalreactivepower <- subset(x = plotdata, subset = (Global_reactive_power != "?"), select = Global_reactive_power)
    globalreactivepower <- as.numeric(globalreactivepower$Global_reactive_power)
    voltage <- subset(x = plotdata, subset = (Voltage != "?"), select = Voltage)
    voltage <- as.numeric(voltage$Voltage)
    
    #Plot4
    png(filename = "plot4.png")
    par(mfrow=c(2,2))
    #Plot #1
    plot(globalactivepower, ylab = "Global Active Power (Kilowatts)", type = "l", axes = FALSE)
    axis(side = 1, at = c(1, length(globalactivepower)/2, length(globalactivepower)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0,2,4,6), labels = c(0,2,4,6))
    box()
    #Plot #2
    plot(voltage, xlab = "Datetime", ylab = "Voltage", type = "l", axes = FALSE)
    axis(side = 1, at = c(1, length(voltage)/2, length(voltage)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(234,238,242,246), labels = c(234,238,242,246))
    box()
    #Plot #3
    plot(abs(submetering1), type = "l", col = "black", xlab = "", ylab = "Energy sub metering", axes = FALSE)
    par(new = TRUE)
    plot(abs(submetering2), type = "l", col = "red", xlab = "", ylab = "Energy sub metering", axes = FALSE)
    par(new = TRUE)
    plot(abs(submetering3), type = "l", col = "blue", xlab = "", ylab = "Energy sub metering", axes = FALSE)
    #title(xlab = "Energy sub metering")
    axis(side = 1, at = c(1, length(submetering1)/2, length(submetering1)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0,10,20,30), labels = c(0,10,20,30))
    box()
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #Plot #4
    plot(globalreactivepower, xlab = "Datetime", ylab = "Global_Reactive_Power", type = "l", axes = FALSE)
    axis(side = 1, at = c(1, length(globalreactivepower)/2, length(globalreactivepower)), labels = c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0.1,0.2,0.3,0.4,0.5), labels = c(0.1,0.2,0.3,0.4, 0.5))
    box()
    dev.off()
    
    }

