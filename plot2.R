##  Exploratory Data Analysis Proj 1
##  Code for creating plot2.png
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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
## set up the output file with specified dimensions
par(mar=c(3.1,4.1,4.1,2.1))
with(dfile_plot, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
## create the plot, output to the file and close the png file device