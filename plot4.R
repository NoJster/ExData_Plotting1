household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

x <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$Datetime <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
data_subset <- household_power_consumption[which(household_power_consumption$Datetime > "2007-02-01" & household_power_consumption$Datetime < "2007-02-03"),]

png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(data_subset,plot(Datetime,Global_active_power, xlab = "", ylab = "Global Active Power", type="l"))
with(data_subset,plot(Datetime,Voltage, xlab = "datetime", ylab = "Voltage", type="l"))
with(data_subset,plot(Datetime,Sub_metering_1, xlab = "", ylab = "Energy Sub metering",type="l"))
with(data_subset, lines(Datetime,Sub_metering_2, col = "red"))
with(data_subset, lines(Datetime,Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1), bty = "n")
with(data_subset,plot(Datetime,Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l"))

dev.off()