# Loading the packages
library(data.table)
library(plyr)

# Loading the data
pdata <- fread("household_power_consumption.txt")

# Subsetting the data
pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Using the date format
pdata <- mutate(pdata, 
                    datetime = strptime(
                                      paste(pdata$Date, pdata$Time), 
                                      "%e/%m/%Y %H:%M:%S"
                                      )
                    )

# Selecting the PNG format
png('plot2.png',width=480,height=480) 

# Creating the graphic
with(pdata, 
     plot(datetime, Global_active_power, 
          type = "n", 
          xlab = "", 
          cex.axis = 0.75,
          cex.lab = 0.75,
          ylab = "Global Active Power (kilowatts)")
     )
with(pdata, lines(datetime, Global_active_power))

# Closing the graphic
dev.off()
