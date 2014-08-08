library(sqldf)

filename<-"household_power_consumption.txt"

# Uses sql query to choose target dates
DF <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# Creates dest file
png(filename="plot1.png",width=480,height=480,units="px")

# Draws hist
hist(DF$Global_active_power, col="red", breaks=12,ylim=range(0,1200), main ="Global Active Power", xlab="Global Active Power (kilowatts)")

# Closes the dev
dev.off()