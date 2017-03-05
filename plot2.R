# Load the data
loadData()

#Create suitable data
plotData <- data.frame(strptime(paste(dataPower$Date, dataPower$Time), "%d/%m/%Y %H:%M:%S"), dataPower$Global_active_power)
colnames(plotData) <- c("Date", "Global_active_power")

#PLOT 2:
dev.off()
png("plot2.png", width = 480, height = 480)
plot(x = plotData$Date, y = plotData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = '')
dev.off()
remove(plotData)
