## an script for loading and creating png figure for part1 of project1

# loading the data from working directory
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subsetting the data
data1_sub <- data1[data1$Date == "1/2/2007" | data1$Date ==  "2/2/2007",]

# making the plot to a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data1_sub$Global_active_power,xlab = "Global Active Power", main = "Global Active Power", col = "red")
dev.off()
