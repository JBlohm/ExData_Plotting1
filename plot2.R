##
## plot2.R 07.07.2015 JBlohm
##
## Arguments: none
## Output: ./plot2.png
##
## Uses data from file: ./household_power_consumption.txt
## Place this script in same directory as the data file
##
require(data.table)

## Switch locale to English to get the correct labeling language. 
## (Otherwise there would be local language labels in the plot.)
Sys.setlocale("LC_TIME","en_US.UTF-8")

## Read only the data required for this plot
dt <- data.table(read.csv("./household_power_consumption.txt", header = FALSE, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings= "?", skip=66637, nrows=60*48))

## Create a days vector for the X-axis
days <- dt[, strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")]

## Open png graphics device 480 x 480 pixel
png(filename = "./plot2.png", width = 480, height = 480, units = "px")
## Create the plot
plot(days, dt$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
## Close graphics device
dev.off()
