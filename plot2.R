power_consumption <- read.csv("../data/household_power_consumption.txt", header=TRUE, sep=";")
p <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]
p$DateTime <- strptime(paste(p[,"Date"], p[,"Time"]), "%d/%m/%Y %H:%M:%S")
p$Global_active_power <- as.numeric(p$Global_active_power)
p$Global_active_power_kw <- p$Global_active_power / 1000
png("plot2.png")
plot(p$DateTime, p$Global_active_power_kw, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(p$DateTime, p$Global_active_power_kw)
dev.off()
