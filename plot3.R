#This assignment uses data from the UC Irvine (UCI) Machine Learning Repository. 
#This program uses the "Individual household electric power consumption Dataset".
#make filename = to the UCI Dataset url
filename <- "household_power_consumption.txt"

#use read table function to read filename and indicate a header and colon seperated. 
#..use colClasses to define object types of all columns. Define NAsas "?.
data5 <- read.table(filename,  header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")

#subset the data to only include data from Feb 1, 2007 and Feb 2, 2007
subset <- data5$Date == "1/2/2007" | data5$Date == "2/2/2007"
newData <- data5[subset, ]

#paste new columns and make charater
x <- paste(newData$Date, newData$Time)

#change format to desried date
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## Create subplot Datetime, from newData
w <- newData$DateTime

#create subplot Sub_metering_1 from newData
x <- newData$Sub_metering_1

#create subplot Sub_metering_2 from newData 
y<-newData$Sub_metering_2

#create subplot Sub_metering_3 from newData 
z<-newData$Sub_metering_3
#View(z)

#create plot to screen
plot(w, x, type = "l", col = "darkblue", xlab = "", ylab = "Engineering sub metering") 

lines(w, y, type = "l", col = "red", xlab = "")

lines(w, z, type = "l", col = "blue", xlab = "")

#create legend at top right of graph
legend("topright", lty = 1, col = c("darkblue", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create png file
dev.copy(png, file = "plot3.png",  width = 480, height = 480) 

#turnoff dev.copy
dev.off() 
