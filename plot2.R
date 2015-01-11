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

png('plot2.png', height = 480, width = 480)
plot(requiredDates$Global_active_power~ requiredDates$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
