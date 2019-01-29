plot1 <- function(){
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
    
    #Plot1
    #Histogram
    
    png(filename = "plot1.png")
    hist(globalactivepower, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red")
    dev.off()
    
    }
