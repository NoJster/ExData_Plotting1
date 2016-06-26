household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

x <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$Datetime <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
data_subset <- household_power_consumption[which(household_power_consumption$Datetime > "2007-02-01" & household_power_consumption$Datetime < "2007-02-03"),]

png(filename="plot2.png", width = 480, height = 480)

with(data_subset,plot(Datetime,Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l"))

dev.off()