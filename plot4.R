data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   colClasses=c(NA, NA, rep("numeric", 7)), na.strings=c("?"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"), ]

data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, format="%Y-%m-%d %H:%M:%S")

png("plot4.png", 480, 480)

par(mfrow = c(2, 2))

plot(x=data$Datetime, y=data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

plot(x=data$Datetime, y=data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

plot(x=data$Datetime, y=data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub-metering", col="#000000")
lines(x=data$Datetime, y=data$Sub_metering_2, type="l", col="#ff0000")
lines(x=data$Datetime, y=data$Sub_metering_3, type="l", col="#0000ff")
legend("topright", lty="solid", bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x=data$Datetime, y=data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()