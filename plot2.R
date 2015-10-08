
data <- read.table("household_power_consumption.txt",header=TRUE,sep=';',stringsAsFactors=FALSE,na.strings='?')

sub_data <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

sub_data$Date_Time <- paste(sub_data$Date, sub_data$Time, sep=" ")

sub_data$Date_Time <- strptime(sub_data$Date_Time, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(sub_data$Date_Time, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()