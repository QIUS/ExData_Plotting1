## this is a script about plotting the second figure of project1.

## read the dataset from working dir
data2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subset the dataset with the data constraint
data2_sub <- data2[data2$Date == "1/2/2007" | data2$Date ==  "2/2/2007",]
dandt2 <- paste(data2_sub$Date, data2_sub$Time)
dandt2 <- strptime(dandt2, "%d/%m/%Y %T")

# plot the figure to a png file
png(filename="plot2.png", width=480, height=480, units="px")
plot(dandt2, data2_sub$Global_active_power, ylab="Global Active Power", xlab="", type="n")
lines(dandt2, data2_sub$Global_active_power)
dev.off()
