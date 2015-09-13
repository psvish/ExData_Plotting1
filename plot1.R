##  Exploratory Data Analysis Proj 1
##  Code for creating plot1.png
##  based on data file being in current wd
fname <- "household_power_consumption.txt"
dfile <- read.table(fname, header = TRUE, sep = ";", stringsAsFactors=F, na.strings = "?")  
## read the data into dfile
as.Date(dfile$Date, "%d/%m/%Y")
## convert Date to correct date class
dfile_use <- subset(dfile, Date == "1/2/2007" | Date == "2/2/2007")
## subset the data for the 2 days needed for this plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
## set up the output file with specified dimensions
with(dfile_use, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))
dev.off()
## create the plot, output to the file and close the png file device