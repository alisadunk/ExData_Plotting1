#R usefull commands
#file.list() #how files
#file.show() #open text file with default windows editor


#reading files in
#read.csv()
#read.table()
#how to filter records
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                 , destfile = "C:/Users/alext/OneDrive/Apps/R/Coursera R Data Exploration/power_consumtion.zip")
unzip(zipfile = "C:/Users/alext/OneDrive/Apps/R/Coursera R Data Exploration/power_consumtion.zip"
      ,exdir = "C:/Users/alext/OneDrive/Apps/R/Coursera R Data Exploration")

setwd("C:/Users/alext/OneDrive/Apps/R/Coursera R Data Exploration")
pc<-read.csv2("household_power_consumption.txt",sep=";", na.strings = c("?"), as.is = c("Date","Time"))
#combine records
pc$DateTime <- strptime(paste(pc$Date,pc$Time), "%d/%m/%Y %T") 
pc$Date = as.Date(pc$Date,"%d/%m/%Y")
pc$Global_active_power = as.numeric(pc$Global_active_power)
pc$Voltage = as.numeric(pc$Voltage)
pc_sub <- subset(pc, pc$Date >= '2007-02-01' & pc$Date <= '2007-02-02')

#plotting 4
#split the screen 

png(filename = "PlotR4.png", width = 480, height = 480)

par(mfrow=c(2,2))

hist(pc_sub$Global_active_power/1000
     , col = 'red'
     , freq = TRUE
     , main = "Global Active Power"
     , xlab = "Global Active Power(kilowatts)")

plot(x=pc_sub$DateTime
     , y=pc_sub$Voltage
     , col ='black'
     , type = 'l'
     , xlab = "datetime")

##################plot 3
plot(y = pc_sub$Sub_metering_3
     , x = pc_sub$DateTime,main = ""
     , xlab = ""
     , ylab ="Energy sub metering"
     , type = 'l', col = 'blue'
) 
lines(y = pc_sub$Sub_metering_2
      , x = pc_sub$DateTime,main = ""
      , xlab = ""
      , ylab ="Energy sub metering"
      , type = 'l'
      , col='red')
lines(y = pc_sub$Sub_metering_1
      , x = pc_sub$DateTime,main = ""
      , xlab = ""
      , ylab ="Energy sub metering"
      , type = 'l'
      , col = 'black')
################

plot(y = pc_sub$Global_reactive_power
     , x = pc_sub$DateTime,main = ""
     , xlab = "datetime"
     , ylab ="Gloval Reactive Power(kilowats)"
     , type = 'l')

dev.off()
