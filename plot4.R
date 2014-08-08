filename<-"household_power_consumption.txt"

# Uses sql query to choose target dates
DF <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# Creates dest file
png(filename="plot4.png",width=480,height=480,units="px")

# Sets 2*2 form
par(mfrow=c(2,2))

# Draws top-left
plot(time,DF$Global_active_power,type="l",ylab="Global Acvtive Power", xlab = "")

# Draws top-right
plot(time,DF$Voltage,type="l",ylab="Voltage", xlab = "datetime")

# Draws bottom-left
plot(time, DF$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(time, DF$Sub_metering_2, col="red")
lines(time, DF$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex = 0.8)

# Draws bottom-right
plot(time,DF$Global_reactive_power,type="l",ylab="Global_reAcvtive_power", xlab = "datetime")

# Closes the dev
dev.off()