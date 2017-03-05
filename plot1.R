# Load the data
loadData()

#PLOT 1:
dev.off()
png("plot1.png", width = 480, height = 480)
hist(dataPower$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
