
d_raw <- read.table("household_power_consumption.txt", header=T, sep=";")
d <- d_raw[d_raw$Date == "1/2/2007" | d_raw$Date == "2/2/2007",]
d$DateTime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480)

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
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
)


dev.off()

