dataFile <- "/home/gonzalo/Documentos/Coursera/4-ExploratoryDataAnalysis/Project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subdata)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subdata$Global_active_power)
submettering1 <- as.numeric(subdata$Sub_metering_1)
submettering2 <- as.numeric(subdata$Sub_metering_2)
submettering3 <- as.numeric(subdata$Sub_metering_3)
globalReactive <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#Global active power plot
plot(datetime, globalActivePower, type="l", xlab = "", ylab ="Global Active Power (kilowatts)")

#Voltage plot
plot(datetime, voltage, type="l", xlab = "datetime", ylab ="Voltage")

#energy submetering plot
plot(datetime, submettering1, type = "l", xlab=" ", ylab = "Energy sbumetering")
lines(datetime, submettering2, type = "l", col="red")     
lines(datetime, submettering3, type = "l", col="blue")
legend("topright", c("Submetering 1", "Submetering 2", "Submetering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Global reactive power plot
plot(datetime, globalReactive, type="l", xlab = "datetime", ylab ="Global Reactive Power")

dev.off()