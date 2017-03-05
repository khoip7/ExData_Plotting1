# Load the data
loadData()


#Create suitable data
plotData <- data.frame(strptime(paste(dataPower$Date, dataPower$Time), "%d/%m/%Y %H:%M:%S"), dataPower$Global_active_power, dataPower$Voltage,dataPower$Global_reactive_power, dataPower$Sub_metering_1,dataPower$Sub_metering_2,dataPower$Sub_metering_3)
colnames(plotData) <- c("Date", "Global_active_power", "Voltage", "Global_reactive_power", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#PLOT 3:
dev.off()
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x = plotData$Date, y = plotData$Global_active_power, ylab = "Global Active Power",type = "l", xlab = '')
plot(x = plotData$Date, y = plotData$Voltage, ylab = "Voltage",type = "l", xlab = 'datetime')
plot(x = plotData$Date, y = plotData$Sub_metering_1, ylab = "Energy sub metering",type = "l", xlab = '')
lines(x = plotData$Date,y = plotData$Sub_metering_2,col="red")
lines(x = plotData$Date,y = plotData$Sub_metering_3,col="blue") 
legend("topright", bty = "n",lwd = c(2,2,2),col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9)
plot(x = plotData$Date, y = plotData$Global_reactive_power, ylab = "Global_reactive_power",type = "l", xlab = 'datetime')
dev.off()
remove(plotData)
