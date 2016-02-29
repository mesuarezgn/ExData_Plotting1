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

# Using the numeric format
class(pdata$Sub_metering_1) <- "numeric"
class(pdata$Sub_metering_2) <- "numeric"

# Selecting the PNG format
png('plot3.png',width=480,height=480) 

# Creating the graphic
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

# Closing the graphic
dev.off()
