##  Exploratory Data Analysis Proj 1
##  Code for creating plot4.png
##  based on data file being in current wd
fname <- "household_power_consumption.txt"
dfile <- read.table(fname, header = TRUE, sep = ";", stringsAsFactors=F, na.strings = "?")  
## read the data into dfile
as.Date(dfile$Date, "%d/%m/%Y")
## convert Date to correct date class
dfile_use <- subset(dfile, Date == "1/2/2007" | Date == "2/2/2007")
## subset the data for the 2 days needed for this plot
date_time <- paste(dfile_use$Date, dfile_use$Time)
## combine Date and Time variables into a new one for use in the plot
dfile_plot <- mutate(dfile_use, date_time)
## add date_time variable to dataset
dfile_plot$date_time <- strptime(dfile_plot$date_time, "%d/%m/%Y %H:%M:%S")
## transform date_time to POSIX format for use in plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")
## set up the output file with specified dimensions
par(mfrow = c(2, 2))
## set up the plot area for 4 plots in 2 x 2 configuration
with(dfile_plot, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
### draw top left panel plot
with(dfile_plot, plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
### draw top right panel plot
with(dfile_plot, plot(date_time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
## create a blank frame to add the 3 plots
with(dfile_plot, points(date_time, Sub_metering_1, type = "l", col = "black"))
with(dfile_plot, points(date_time, Sub_metering_2, type = "l", col = "red"))
with(dfile_plot, points(date_time, Sub_metering_3, type = "l", col = "blue"))
## plot the 3 plots with specified colors
legend("topright", bty = "n", xjust = 1, yjust = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## add the legend at specified location, type and color
### draw bottom left panel plot
with(dfile_plot, plot(date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
### draw bottom right panel plot
dev.off()
## create the plot, output to the file and close the png file device