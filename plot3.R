
data <- read.table("household_power_consumption.txt",header=TRUE,sep=';',stringsAsFactors=FALSE,na.strings='?')

sub_data <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

sub_data$Date_Time <- paste(sub_data$Date, sub_data$Time, sep=" ")

sub_data$Date_Time <- strptime(sub_data$Date_Time, format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(sub_data$Date_Time, sub_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub_data$Date_Time, sub_data$Sub_metering_2, col="red", type="l")
lines(sub_data$Date_Time, sub_data$Sub_metering_3, col="blue", type="l")
legend("topright", col = c("black", "blue", "red"), lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()