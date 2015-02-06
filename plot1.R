
d_raw <- read.table("household_power_consumption.txt", header=T, sep=";")
d <- d_raw[d_raw$Date == "1/2/2007" | d_raw$Date == "2/2/2007",]
d$DateTime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot1.png", width=480, height=480)

hist(
  as.numeric(d$Global_active_power)/1000*2,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)"
  )

dev.off()


