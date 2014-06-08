#Read data from file in working directory: 
data <- read.table("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric",
                   "numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE, na.strings="?")


#Create logical vector for subsetting:
DatesOfInterest <- data$Date %in% c("1/2/2007","2/2/2007")

#Subset data:
data <- data[DatesOfInterest,]

#Convert Date and Time columns:
data$dateTime <- paste(data$Date,data$Time)
data$dateTime = strptime(data$dateTime,"%d/%m/%Y %H:%M:%S")

#Set locale to english to fix x-axis labels:
Sys.setlocale("LC_TIME", "English_United States.1252")

#Open device:
png("plot3.png")

#Execute plot:
plot(data$dateTime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$dateTime,data$Sub_metering_1)
lines(data$dateTime,data$Sub_metering_2,col="red")
lines(data$dateTime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#Close device
dev.off()