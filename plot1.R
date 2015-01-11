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

#plot the histogram and save to png
#----------------------------------
png('plot1.png', width = 480, height= 480)
hist(requiredDates$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
