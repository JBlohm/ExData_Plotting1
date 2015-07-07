##
## plot1.R 07.07.2015 JBlohm
##
## Arguments: none
## Output: ./plot1.png
##
## Uses data from file: ./household_power_consumption.txt
## Place this script in same directory as the data file
##

## Read only the data required for this plot
df <- read.csv("./household_power_consumption.txt", header = FALSE, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings= "?", skip=66637, nrows=60*48)

## Open png graphics device 480 x 480 pixel
png(filename = "./plot1.png", width = 480, height = 480, units = "px")
## Create the plot
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Close graphics device
dev.off()
