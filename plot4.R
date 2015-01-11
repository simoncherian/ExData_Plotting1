#download the dataset and unzip it- uncomment to run
#---------------------------------------------------

#download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 
'powerConsumption.zip')
#unzip('powerConsumption.zip')


#load the dataset
#----------------

powerConsumptionDataset <- read.table('household_power_consumption.txt', sep = ';', 
                                      na.strings = '?', header= TRUE, as.is = TRUE)

powerConsumptionDataset$Date <- as.Date(powerConsumptionDataset$Date, "%d/%m/%Y")


#subset the data for the required dates
#--------------------------------------

requiredDates <- subset(powerConsumptionDataset, powerConsumptionDataset$Date >= "2007-02-01" 
                        & powerConsumptionDataset$Date <= "2007-02-02")

rm(powerConsumptionDataset)

#Create a datetime column to create the graph
#--------------------------------------------

dateTime <- paste(requiredDates$Date, requiredDates$Time)
requiredDates$dateTime <- as.POSIXct(dateTime)

#create the plot
#---------------

png('plot4.png', height = 480, width = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(requiredDates$Global_active_power ~ requiredDates$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(requiredDates$Voltage ~ requiredDates$dateTime, type="l",
     ylab="Voltage (volt)", xlab="")

plot(requiredDates$Sub_metering_1 ~ requiredDates$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

lines(requiredDates$Sub_metering_2 ~ requiredDates$dateTime,col='Red')
lines(requiredDates$Sub_metering_3 ~ requiredDates$dateTime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(requiredDates$Global_reactive_power ~ requiredDates$dateTime, type="l",
     ylab="Global Rective Power (kilowatts)",xlab="")

dev.off()