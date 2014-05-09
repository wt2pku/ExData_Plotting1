
##load data on date 01/02/2007 and 02/02/2007
tab5class <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5class, class)
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, skip = 66637, nrows = 2880)
names(hpc) <- names(tab5class)

##convert date and time 
hpc$dateTime <- as.POSIXct(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), format='%d/%m/%Y %H:%M:%S'))

par(mfrow = c(1,1))
##create plot 3
plot(hpc$dateTime, hpc$Sub_metering_1, type = "n", ylab = "Energy sub Metering", xlab = "")
lines(hpc$dateTime, hpc$Sub_metering_1, col = "black")
lines(hpc$dateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$dateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = names(hpc)[7:9])

##Copy plot to the PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

## close the PNG device
dev.off()
