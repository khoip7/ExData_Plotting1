#This function will load the data and create the global variable to hold this data

loadData <- function() {
        if (!exists("dataPower")){
                # Load necessary library
                library(RSQLite)
                
                # Download and unzip
                print("Dowloading...")
                dir.create("temp", showWarnings = FALSE)
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "temp/Electric_power_consumption.zip")
                unzip("temp/Electric_power_consumption.zip", exdir = "temp")
                
                #Pre-processing
                print("Pre-processing...")
                dataFileCon <- file("temp/household_power_consumption.txt")
                dataFile <- readLines(dataFileCon)
                filteredDataFile <- gsub( "\\?", "-1", dataFile)
                writeLines(filteredDataFile, con="temp/filteredData.txt")
                close(dataFileCon)
                remove(dataFile, filteredDataFile, dataFileCon)
                
                # Reading and filtering data
                print("Importing data to sql database...")
                sqlLiteCon <- dbConnect(RSQLite::SQLite(), dbname = "temp/electric-power-consumption.sqlite")
                dbWriteTable(conn = sqlLiteCon, name = "data", value = "temp/filteredData.txt", row.names = FALSE, header=TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
                dataPower <<- dbGetQuery(sqlLiteCon, "SELECT * FROM data WHERE Date = '1/2/2007' OR Date = '2/2/2007' and Global_active_power > -1 and Global_reactive_power > -1 and Voltage > -1 and Global_intensity > -1 and Sub_metering_1 > -1 and Sub_metering_2 > -1 and Sub_metering_3 > -1")
                dbDisconnect(sqlLiteCon)
                remove(sqlLiteCon)
                
                #Now we got a nice clean data for ploting
                #Cleanning temp file
                print("Cleanning remaining files...")
                unlink("temp", recursive = TRUE, force = TRUE)
                
        }
        print("Done.")
}