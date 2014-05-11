## The below code reads data from household_power_consumption.txt file and creates a plot1.png file
## After the data hass been read in to the householdpower variable, the columns are converted into date and time fields
## This data is filtered on Date field and then sent to png graphic device for plotting

  householdpwr <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  newdata <- paste(householdpwr$Date,householdpwr$Time)
  newtime <- strptime(newdata, "%d/%m/%Y %H:%M:%S")
  householdpwr$Time <- newtime
  householdpwr$Date <- as.Date(householdpwr$Date,format="%d/%m/%Y")
  householdpwr2 <- subset(householdpwr, Date == "2007-02-01" | Date == "2007-02-02")
  
  # First a png device is initialized with 480 by 480 size and then plot creates graph with a type=l parameter
  png(filename="plot2.png",width=480,height=480)
  plot(householdpwr2$Time,householdpwr2$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
  dev.off()
