## The below code reads data from household_power_consumption.txt file and creates a plot1.png file
## After the data hass been read in to the householdpower variable, the columns are converted into date and time fields
## This data is filtered on Date field and then sent to png graphic device for plotting

  householdpwr <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  newdata <- paste(householdpwr$Date,householdpwr$Time)
  newtime <- strptime(newdata, "%d/%m/%Y %H:%M:%S")
  householdpwr$Time <- newtime
  householdpwr$Date <- as.Date(householdpwr$Date,format="%d/%m/%Y")
  householdpwr2 <- subset(householdpwr, Date == "2007-02-01" | Date == "2007-02-02")

  ## png device is divided into 2 rows and 2 columns by using mfrow parameter and then 4 plots are drawn
  png(filename="plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  plot(householdpwr2$Time,householdpwr2$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(householdpwr2$Time,householdpwr2$Voltage,type="l",ylab="Voltage",xlab="datetime")
  with(householdpwr2,plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
  with(householdpwr2,lines(Time,Sub_metering_1,col="black"))
  with(householdpwr2,lines(Time,Sub_metering_2,col="red"))
  with(householdpwr2,lines(Time,Sub_metering_3,col="blue"))
  legend("topright", lty = 1 , col = c("black","Red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(householdpwr2$Time,householdpwr2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  dev.off()
