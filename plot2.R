data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   colClasses=c(NA, NA, rep("numeric", 7)), na.strings=c("?"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"), ]

data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, format="%Y-%m-%d %H:%M:%S")

png("plot2.png", 480, 480)

plot(x=data$Datetime, y=data$Global_active_power, type="l", 
     xlab="", ylab="Global active power (kilowatts)")

dev.off()