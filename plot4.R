
d_raw <- read.table("household_power_consumption.txt", header=T, sep=";")
d <- d_raw[d_raw$Date == "1/2/2007" | d_raw$Date == "2/2/2007",]
d$DateTime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

# plot 1
plot(d$DateTime, as.numeric(d$Global_active_power)/1000,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")


# plot 2
plot(d$DateTime, d$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")


# plot 3
plot(d$DateTime,
     d$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(d$DateTime,
      as.numeric(d$Sub_metering_2),
      col="red")

lines(d$DateTime,
      d$Sub_metering_3,
      col="blue")

legend("topright", lty=1,
       col=c("black", "blue", "red"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       box.lty=1
)


# plot 4
plot(d$DateTime, as.numeric(d$Global_reactive_power)/1000,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


dev.off()


