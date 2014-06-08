## this is the script for figure4 of project1

# reading data from working dir
data4 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subset the data using date limits
data4_sub <- data4[data4$Date == "1/2/2007" | data4$Date ==  "2/2/2007",]
dandt4 <- paste(data4_sub$Date, data4_sub$Time)
dandt4 <- strptime(dandt4, "%d/%m/%Y %T")

# plotting to a png file
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

# first subplotting
plot(dandt4, data4_sub$Global_active_power, ylab="Global Active Power", xlab="", type="n") ##with nothing on the plotting
lines(dandt4, data4_sub$Global_active_power) ##adding lines to the figure1

# second subplotting
plot(dandt4, data4_sub$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(dandt4, data4_sub$Voltage)

# third subplotting
plot(dandt4, data4_sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(dandt4, data4_sub$Sub_metering_1)
lines(dandt4, data4_sub$Sub_metering_2, col="red")
lines(dandt4, data4_sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=2, bty="n")

# fourth subplotting
plot(dandt4, data4_sub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(dandt4, data4_sub$Global_reactive_power)

dev.off()
