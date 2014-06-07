data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   colClasses=c(NA, NA, rep("numeric", 7)), na.strings=c("?"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & 
                 data$Date <= as.Date("2007-02-02"), ]

png("plot1.png", 480, 480)

hist(data$Global_active_power, xlab="Global active power (kilowatts)", 
     main="Global Active power", col="#ff0000")

dev.off()