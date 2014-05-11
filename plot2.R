
  householdpwr <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  newdata <- paste(householdpwr$Date,householdpwr$Time)
  newtime <- strptime(newdata, "%d/%m/%Y %H:%M:%S")
  householdpwr$Time <- newtime
  householdpwr$Date <- as.Date(householdpwr$Date,format="%d/%m/%Y")
  householdpwr2 <- subset(householdpwr, Date == "2007-02-01" | Date == "2007-02-02")
  
  png(filename="plot2.png",width=480,height=480)
  plot(householdpwr2$Time,householdpwr2$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
  dev.off()
