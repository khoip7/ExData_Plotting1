# Load the data
loadData()

#Create suitable data
plotData <- data.frame(strptime(paste(dataPower$Date, dataPower$Time), "%d/%m/%Y %H:%M:%S"), dataPower$Sub_metering_1, dataPower$Sub_metering_2,dataPower$Sub_metering_3)
colnames(plotData) <- c("Date", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#PLOT 3:
dev.off()
png("plot3.png", width = 480, height = 480)
plot(x = plotData$Date, y = plotData$Sub_metering_1, ylab = "Energy sub metering",type = "l", xlab = '')
lines(x = plotData$Date,y = plotData$Sub_metering_2,col="red")
lines(x = plotData$Date,y = plotData$Sub_metering_3,col="blue") 
legend("topright", lwd = c(2,2,2),col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
remove(plotData)

