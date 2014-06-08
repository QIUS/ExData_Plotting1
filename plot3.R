## this is a script for plotting the 3rd figure of project1

# reading the data from working dir
data_<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subset the dataset
data3_sub <- data3[data3$Date == "1/2/2007" | data3$Date ==  "2/2/2007",]
dandt3 <- paste(data3_sub$Date, data3_sub$Time)
dandt3 <- strptime(dandt3, "%d/%m/%Y %T")

# making the plots
png(filename="plot3.png", width=480, height=480, units="px")
plot(dandt3, data3_sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")

lines(dandt3, data3_sub$Sub_metering_1)
lines(dandt3, data3_sub$Sub_metering_2, col="red")
lines(dandt3, data3_sub$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=2)

dev.off()
