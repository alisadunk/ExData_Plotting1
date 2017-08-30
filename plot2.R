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


#plotting 2 and saving to png
png(filename = 'PlotR2.png', width = 480, height = 480)
plot(y = pc_sub$Global_active_power/1000
     , x = pc_sub$DateTime,main = ""
     , xlab = ""
     , ylab ="Gloval Active Power(kilowats)"
     , type = 'l')

dev.off()



