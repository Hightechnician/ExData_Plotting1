filename<-"household_power_consumption.txt"

# Uses sql query to choose target dates
DF <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# Creates dest file
png(filename="plot3.png",width=480,height=480,units="px")

# Calculates the x-axis
time<-strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

# Draws the plot and overwrite lines on it
plot(time, DF$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(time, DF$Sub_metering_2, col="red")
lines(time, DF$Sub_metering_3, col="blue")

# Draws the legend
legend("topright", col=c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Closes the dev
dev.off()