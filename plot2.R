
d_raw <- read.table("household_power_consumption.txt", header=T, sep=";")
d <- d_raw[d_raw$Date == "1/2/2007" | d_raw$Date == "2/2/2007",]
d$DateTime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)

plot(d$DateTime, as.numeric(d$Global_active_power)/1000,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()


