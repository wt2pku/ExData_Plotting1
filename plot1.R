
##load data on date 01/02/2007 and 02/02/2007
tab5class <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5class, class)
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, skip = 66637, nrows = 2880)
names(hpc) <- names(tab5class)

##convert date and time 
hpc$dateTime <- as.POSIXct(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), format='%d/%m/%Y %H:%M:%S'))

par(mfrow = c(1,1))
##create plot 1
hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##Copy plot to the PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## close the PNG device
dev.off()
