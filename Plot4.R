

library(data.table)

#Read File
Data <- read.table(file="household_power.txt",header=TRUE,sep=";",na.strings="?")

#Use only specified dates

UsedData <- Data[as.character(Data$Date) %in% c('2/2/2007','1/2/2007'),]


UsedData$DateTime <- strptime(paste(UsedData$Date,UsedData$Time)
                                  ,format="%d/%m/%Y %H:%M:%S")
#Create Graph
png(filename="plot4.png",width=480,height=480,units="px",bg=NA)

par(mfrow = c(2,2))


# Plot top left chart
plot(x=UsedData$DateTime
     ,y=UsedData$Global_active_power
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Global Active Power")


# plot top right chart
plot(x=UsedData$DateTime
     ,y=UsedData$Voltage
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="Voltage")


# Plot bottom left chart
plot(x=UsedData$DateTime
     ,y=UsedData$Sub_metering_1
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Energy sub metering")

lines(x=UsedData$DateTime
      ,y=UsedData$Sub_metering_2
      ,type="l"
      ,col="red")

lines(x=UsedData$DateTime
      ,y=UsedData$Sub_metering_3
      ,type="l"
      ,col="blue")

legend("topright" # location of legend
       ,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lwd=1
       ,bty="n"
       ,col=c("black","red","blue"))

## Plot bottom right
plot(x=UsedData$DateTime
     ,y=UsedData$Global_reactive_power
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="Global_reactive_power")


dev.off()

