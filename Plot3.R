

library(data.table)

#Read File
Data <- read.table(file="household_power.txt",header=TRUE,sep=";",na.strings="?")

#Use only specified dates

UsedData <- Data[as.character(Data$Date) %in% c('2/2/2007','1/2/2007'),]

UsedData$DateTime <- strptime(paste(UsedData$Date,UsedData$Time)
                                  ,format="%d/%m/%Y %H:%M:%S")
#Create Graph
png(filename="plot3.png",width=480,height=480,units="px",bg=NA)

# Plot Submetering_1
plot(x=UsedData$DateTime
     ,y=UsedData$Sub_metering_1
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Energy sub metering"
)

# Plot sub_metering_2
lines(x=UsedData$DateTime
      ,y=UsedData$Sub_metering_2
      ,type="l"
      ,col="red")

# Plot sub_metering_3
lines(x=UsedData$DateTime
      ,y=UsedData$Sub_metering_3
      ,type="l"
      ,col="blue")
      
#Create Legend
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lwd=1
       ,col=c("black","red","blue"))

dev.off()
