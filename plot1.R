png("plot1.png")

raw.data <- read.table(file="./data/household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
raw.data <- transform(read.data, Date=as.Date(Date, format="%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
february.data <- raw.data[raw.data$Date>=as.Date("2007-02-01 ") & raw.data$Date<=as.Date("2007-02-02"),]
hist(february.data$Global_active_power, xlab="Global Active Power (kilowatts)")

dev.off()