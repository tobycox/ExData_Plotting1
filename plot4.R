power_consumption <- read.csv("../data/household_power_consumption.txt", header=TRUE, sep=";")
p <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]
p$DateTime <- strptime(paste(p[,"Date"], p[,"Time"]), "%d/%m/%Y %H:%M:%S")
p$Global_active_power <- as.numeric(p$Global_active_power)
p$Global_active_power_kw <- p$Global_active_power / 1000
png("plot4.png")
par(mfrow = c(2, 2))

# Top left
plot(p$DateTime, p$Global_active_power_kw, type="n", xlab="", ylab="Global Active Power")
lines(p$DateTime, p$Global_active_power_kw)

# Top right
plot(p$DateTime, p$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(p$DateTime, p$Voltage)

# Bottom left
plot(p$DateTime, p$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(p$DateTime, p$Sub_metering_1)
lines(p$DateTime, p$Sub_metering_2, col="red")
lines(p$DateTime, p$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), col=c("black","red","blue"), bty="n", lty=c(1,1,1))

# Bottom right
plot(p$DateTime, p$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(p$DateTime, p$Global_reactive_power)

dev.off()
