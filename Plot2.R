library(data.table)

#Read File
Data <- read.table(file="household_power.txt",header=TRUE,sep=";",na.strings="?")

#Use only specified dates

UsedData <- Data[as.character(Data$Date) %in% c('2/2/2007','1/2/2007'),]


UsedData$DateTime <- strptime(paste(UsedData$Date,UsedData$Time)
                                  ,format="%d/%m/%Y %H:%M:%S")
#Create Graph
png(filename="plot2.png",width=480,height=480,units="px",bg=NA)
plot(x=UsedData$DateTime,y=UsedData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",axes=TRUE)

dev.off()
