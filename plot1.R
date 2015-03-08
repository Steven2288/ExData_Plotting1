
#This assignment uses data from the UC Irvine (UCI) Machine Learning Repository. 
#This program uses the "Individual household electric power consumption Dataset".
#make fileurl = to the UCI Dataset url
fileurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

#download the fileurl and name it sensor_data2.txt
download.file(url=fileurl, destfile="sensor_data2.txt")

# calculate dataset memory, before reading into R. 
file.info("sensor_data2.txt")

#use read table function to read the sensor_data2.txt file and indicate a header
#..and colon seperated.  Also skip lines and only read a certain numbere of rows, to 
#...get the desired sub dataset.
data5 <- read.table("sensor_data.txt", header=T, sep = ";", skip = 66638, nrows = 2880)

#use str function to get a structure of the file
str(data5)

#verify and reset the column names
colnames(data5) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering1", "Sub_metering2", "Sub_metering3")

#load package
library(datasets)

#create histogram with R Base Plot. Define the color to the be red, the x-axis title and the 
#y-axis title to 
hist(data5$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power") 
                      )
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

#close the PNG device
dev.off()

