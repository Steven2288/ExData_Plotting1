#program uses "Individual household electric power consumption data, fronmthe UCI Dataset url
filename <- "household_power_consumption.txt"

#use read table 
data5 <- read.table(filename,  header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")

#subset the data to only include data from Feb 1, 2007 and Feb 2, 2007
subset <- data5$Date == "1/2/2007" | data5$Date == "2/2/2007"
newData <- data5[subset, ]

#paste new columns and make charater
x <- paste(newData$Date, newData$Time)

#change format to desried date
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#create 4 quadrantes, to dispaly 4 graphs on one single plot
par(mfrow = c(2, 2), mar = c(2, 4, 2, 1)) 

## Create plot Golbal Active Power
with(newData, plot(DateTime, Global_active_power, type = "l", xlab = ""))  

#Create plot Voltage
with(newData, plot(DateTime, Voltage, type = "l", xlab = "")) 

## Create subplot Datetime, from newData
w <- newData$DateTime

#create subplot Sub_metering_1 from newData
x <- newData$Sub_metering_1

#create subplot Sub_metering_2 from newData 
y<-newData$Sub_metering_2

#create subplot Sub_metering_3 from newData 
z<-newData$Sub_metering_3
#View(z)

#Create plot Sub mettering1
plot(w, x, type = "l", col = "darkblue", xlab = "", ylab = "Engineering sub metering") 

lines(w, y, type = "l", col = "red", xlab = "")

lines(w, z, type = "l", col = "blue", xlab = "")

par(mar = c(2, 6, 1, 1)) 

#create legend at top right of graph
legend("topright", lty = 1, col = c("darkblue", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create plot Reactive
with(newData, plot(DateTime, Global_reactive_power, type = "l", xlab = ""))   

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")

#close the PNG device
dev.off()

