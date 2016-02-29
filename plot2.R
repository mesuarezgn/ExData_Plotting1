library(data.table)
library(plyr)

pdata <- fread("household_power_consumption.txt")

pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

pdata <- mutate(pdata, 
                    datetime = strptime(
                                      paste(pdata$Date, pdata$Time), 
                                      "%e/%m/%Y %H:%M:%S"
                                      )
                    )

pdf(file = "plot2.pdf", width = 5, height = 5)
with(pdata, 
     plot(datetime, Global_active_power, 
          type = "n", 
          xlab = "", 
          cex.axis = 0.75,
          cex.lab = 0.75,
          ylab = "Global Active Power (kilowatts)")
     )
with(pdata, lines(datetime, Global_active_power))
dev.off()
