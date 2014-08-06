#Class project number 1
#plot number 1
#Set the working directory
setwd("F://Coursera/ExploratoryDataAnalsyis/Week1/ExData_Plotting1/")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" #The url given in instructions
download.file(url,destfile="./zipdata")#Place the zipped file in the data directory
unzip("./zipdata",exdir="./data") #uzip the file into a data file (note the data is in text format)
DT<-read.table("./data/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") #read in the data

#Simplify the data frame

DT$Date.1<-as.Date(DT$Date,format="%d/%m/%Y")
DT1<-DT[DT$Date.1>="2007-02-01" & DT$Date.1<="2007-02-02",] #This will subset the DT data frame

##Construct the histogram
hist(DT1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## Create a png file with this histogram in the file.
dev.copy(png,file="plot1.png",width=480,height=480, units="px")
dev.off()
