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

class(pdata$Sub_metering_1) <- "numeric"
class(pdata$Sub_metering_2) <- "numeric"

pdf(file = "plot4.pdf", width = 5, height = 5)

opar = par()

par(mfrow = c(2, 2), 
    cex.axis = 0.75,
    cex.lab = 0.75,
    mar = c(4, 4, 3, 2),
    oma = c(1, 1, 1, 1))
####################################### Graph 1
with(pdata, 
     plot(datetime, Global_active_power, 
          type = "n", 
          xlab = "", 
          ylab = "Global Active Power")
)
with(pdata, lines(datetime, Global_active_power))


####################################### Graph 2
with(pdata, 
     plot(datetime, Voltage, type = "n", ylab = "Voltage")
)
with(pdata, lines(datetime, Voltage))


####################################### Graph 3
with(pdata, 
     plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
)
with(pdata, lines(datetime, Sub_metering_1))
with(pdata, lines(datetime, Sub_metering_2, col = "red"))
with(pdata, lines(datetime, Sub_metering_3, col = "blue"))
legend(
  "topright",
  col = c("black", "red", "blue"),
  cex = 0.50,
  lty = 1,
  bty = "n",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)


####################################### Graph 4
with(pdata, 
     plot(datetime, Global_reactive_power, type = "n", xlab = "datetime")
)
with(pdata, lines(datetime, Global_reactive_power))

par(opar)

dev.off()

