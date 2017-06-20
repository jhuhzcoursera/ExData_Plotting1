#read the data
datafile <- "D://household_power_consumption.txt"
powerdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#extracting data between 1/2/2007 to 2/2/2007
subpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subpowerdata$Date, subpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpowerdata$Global_active_power)
#Plot
png(filename = 'D:\\coursera summer2017\\plot1.png', width = 480, height = 480, units='px')
# plot figure
with(subpowerdata, hist(globalActivePower, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
# close device
dev.off()


