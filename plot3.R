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

pdf(file = "plot3.pdf", width = 5, height = 5)
with(pdata, 
     plot(datetime, Sub_metering_1, 
          cex.axis = 0.75,
          cex.lab = 0.75,
          type = "n", 
          xlab = "", 
          ylab = "Energy sub metering")
)
with(pdata, lines(datetime, Sub_metering_1))
with(pdata, lines(datetime, Sub_metering_2, col = "red"))
with(pdata, lines(datetime, Sub_metering_3, col = "blue"))
legend(
      "topright",
      col = c("black", "red", "blue"),
      cex = 0.75,
      lty = 1,
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
dev.off()
