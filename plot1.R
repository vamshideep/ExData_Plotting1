## The below code reads data from household_power_consumption.txt file and creates a plot1.png file
## After the data hass been read in to the householdpower variable, the columns are converted into date and time fields
## This data is filtered on Date field and then sent to png graphic device for plotting the histogram

  householdpwr <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  newdata <- paste(householdpwr$Date,householdpwr$Time)
  newtime <- strptime(newdata, "%d/%m/%Y %H:%M:%S")
  householdpwr$Time <- newtime
  householdpwr$Date <- as.Date(householdpwr$Date,format="%d/%m/%Y")
  householdpwr2 <- subset(householdpwr, Date == "2007-02-01" | Date == "2007-02-02")
  
  png(filename="plot1.png",width=480,height=480)
  hist(householdpwr2$Global_active_power,main = "Global active Power",xlab="Global Active Power(kilowats)",ylab="Frequency",col="Red")
  dev.off()
