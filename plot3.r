png("plot3.png")

raw.data <- read.table(file="./data/household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
raw.data <- transform(read.data, Date=as.Date(Date, format="%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
february.data <- raw.data[raw.data$Date>=as.Date("2007-02-01 ") & raw.data$Date<=as.Date("2007-02-02"),]
with(february.data, {
	plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
	points(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
	points(Time, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="blue")
	points(Time, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="red")
	})
legend("topright", lty="solid", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()