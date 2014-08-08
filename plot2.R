filename<-"household_power_consumption.txt"

# Usus sql query to choose target dates
DF <- read.csv.sql(filename, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

#create dest file
png(filename="plot2.png",width=480,height=480,units="px")

#calculate the x-axis
time<-strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

#draw the plot
plot(time,DF$Global_active_power,type="l",ylab="Global Acvtive Power (kilowatts)", xlab = "")

#close the dev
dev.off()