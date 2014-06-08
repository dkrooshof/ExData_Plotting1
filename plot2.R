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
png("plot2.png")

#Execute plot:
plot(data$dateTime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data$dateTime,data$Global_active_power)

#Close device
dev.off()