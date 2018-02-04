setwd("U:/General/Data_Scientist_Course/Course4/Project1")
data<-read.delim(file="household_power_consumption.txt",header=TRUE,#read in data with var names
                 sep=";",na.strings="?")#sep ; and NA ='?'
data$Date<-as.Date(data$Date,'%d/%m/%Y')#correct date format
finaldata<-subset(data,format(as.Date(Date), "%Y-%m")=="2007-02" & 
                          as.numeric(format(as.Date(Date), "%d")) <=2)#subset to 2/1-2/2/2007
#create date plus time var for graphing
finaldata$datetime<-as.POSIXct(paste(finaldata$Date, finaldata$Time), 
                               format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width=480,height=480)#setup png file

with(finaldata,plot(datetime,Global_active_power,xlab='',
                    ylab="Global Active Power (kilowats)",type = "n"))#setup plot
lines(finaldata$datetime,finaldata$Global_active_power)#graph line

dev.off()#close png file