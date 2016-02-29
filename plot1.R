library(data.table)

pdata <- fread("household_power_consumption.txt")


pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

class(pdata$Global_active_power) <- "numeric"

pdf(file = "plot1.pdf", width = 5, height = 5)
hist(pdata$Global_active_power, col = "red", 
     cex.axis = 0.75,
     cex.lab = 0.75,
     ylim = c(0, 1200),
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )
dev.off()