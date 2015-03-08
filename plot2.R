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
#plot(newdata$DateTime, newData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
View(newData)

## Create plot on screen
with(newData, plot(DateTime, Global_active_power, type = "l", xlab = ""))  
#with(newData, plot(DateTime, Global_active_power)  

#create png file
dev.copy(png, file = "plot2.png",  width = 480, height = 480) 

#turnoff dev.copy
dev.off() 
