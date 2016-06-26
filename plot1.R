household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

x <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$Datetime <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
data_subset <- household_power_consumption[which(household_power_consumption$Datetime > "2007-02-01" & household_power_consumption$Datetime < "2007-02-03"),]

png(filename="plot1.png", width = 480, height = 480)

with(data_subset,hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off()