#Class project number 1
#plot number 4
#Set the working directory
setwd("F://Coursera/ExploratoryDataAnalsyis/Week1/ExData_Plotting1/")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" #The url given in instructions
download.file(url,destfile="./zipdata")#Place the zipped file in the data directory
unzip("./zipdata",exdir="./data") #uzip the file into a data file (note the data is in text format)
DT<-read.table("./data/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") #read in the data


#Create a new column in the data frame that is in the date format

DT$Date.1<-as.Date(DT$Date,format="%d/%m/%Y")#creates a new column in the data frame with a date format

### Reduce the size of the data frame

#simplify the data frame to only dates and times for 2007-02-01 through 2007-02-02
DT1<-DT[DT$Date.1>="2007-02-01" & DT$Date.1<="2007-02-02",] #This will subset the DT data frame

#Convert the first and second column of DT1 to character
i<-sapply(DT1,is.factor)#This identifies which columns are factors
DT1[i]<-lapply(DT1[i],as.character)#Which should create a data frame with the first two columns as character

#### Create another column of dates and times
DT1$Date.2<-strptime(paste(DT1$Date,DT1$Time),"%d/%m/%Y %H:%M:%S")

##construct the plot
par(mfrow=c(2,2))
with(DT1,plot(Date.2,Global_active_power, type="l", xlab="", ylab="Global Active Power"),col=black)
with(DT1,plot(Date.2,Voltage,type="l", col="black",xlab="datetime",ylab="Voltage"))
with(DT1,plot(Date.2,Sub_metering_1,type="l", col="black", ylab="",xlab=""))
lines(DT1$Date.2, DT1$Sub_metering_2, col="red",xlab="")
lines(DT1$Date.2,DT1$Sub_metering_3,col="blue",xlab="", ylab="Energy sub metering")
title(ylab="Energy sub metering")
legend("topright", lty=c(1,1,1),col=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(DT1,plot(Date.2,Global_reactive_power,type="l",col="black",xlab="datetime"))


###Export to a png file
dev.copy(png,file="plot4.png",width=480,height=480, units="px")
dev.off()