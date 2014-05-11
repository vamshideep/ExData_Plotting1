## The below code reads data from household_power_consumption.txt file and creates a plot1.png file
## After the data hass been read in to the householdpower variable, the columns are converted into date and time fields
## This data is filtered on Date field and then sent to png graphic device for plotting the histogram

  householdpwr <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  newdata <- paste(householdpwr$Date,householdpwr$Time)
  newtime <- strptime(newdata, "%d/%m/%Y %H:%M:%S")
  householdpwr$Time <- newtime
  householdpwr$Date <- as.Date(householdpwr$Date,format="%d/%m/%Y")
  householdpwr2 <- subset(householdpwr, Date == "2007-02-01" | Date == "2007-02-02")
  
  # At First a plot is created without any points, then lines are used to annotate it.
  png(filename="plot3.png",width=480,height=480)
  with(householdpwr2,plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
  with(householdpwr2,lines(Time,Sub_metering_1,col="black"))
  with(householdpwr2,lines(Time,Sub_metering_2,col="red"))
  with(householdpwr2,lines(Time,Sub_metering_3,col="blue"))
  legend("topright", lty = 1 , col = c("black","Red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  dev.off()
