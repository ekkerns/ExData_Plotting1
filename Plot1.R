setwd("U:/General/Data_Scientist_Course/Course4/Project1")
data<-read.delim(file="household_power_consumption.txt",header=TRUE,#read in data with var names
                 sep=";",na.strings="?")#sep ; and NA ='?'
data$Date<-as.Date(data$Date,'%d/%m/%Y')#correct date format
finaldata<-subset(data,format(as.Date(Date), "%Y-%m")=="2007-02" & 
                          as.numeric(format(as.Date(Date), "%d")) <=2)#subset to 2/1-2/2/2007

png(filename = "plot1.png",width=480,height=480)#setup png file

hist(finaldata$Global_active_power,col="red",
     main ="Global Active Power",xlab="GloablActive Power (kilowats)")

dev.off()#close png file