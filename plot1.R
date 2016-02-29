# Loading the packages
library(data.table)

# Loading the data
pdata <- fread("household_power_consumption.txt")

# Subsetting the data
pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Using the numeric format
class(pdata$Global_active_power) <- "numeric"

# Selecting the PNG format
png('plot1.png',width=480,height=480)  

# Creating the graphic
hist(pdata$Global_active_power, col = "red", 
     cex.axis = 0.75,
     cex.lab = 0.75,
     ylim = c(0, 1200),
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

# Closing the graphic
dev.off()