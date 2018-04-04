names <- c("Footage", "Meas Gauge", "Aim Gauge", "Max Gauge", "Min Gauge", "Delta Time", "Gauge Dev")

#Data Import
library(readxl)
B32538 <- read_excel("C:/Users/E20269/Documents/RStudio/Adaption Tuning/Input/B32538.xls", 
                     sheet = "Gauge Data", col_names = FALSE, 
                     col_types = c("blank", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric", 
                                   "blank", "blank", "blank"))

#Variables to adjust for each slab 
speed      <- 439
adaptStart <- 0.8
adaptEnd   <- 3.6
newStart   <- 3.5
newEnd     <- 6.5
rate       <- 0.6
adaptorOld <- -0.0042
dispMin    <- 0.380
dispMax    <- 0.410
data       <- B32538
####################

data[,6] <- 0
data[,7] <- 0

colnames(data) <- names

deltaTime <- (data[["Footage"]]/speed)*60
measGauge <- data[["Meas Gauge"]]

data["Delta Time"] <- deltaTime
data["Gauge Dev"]  <- data["Meas Gauge"] - data["Aim Gauge"]

plot(deltaTime, measGauge, type = "l", ylim = c(dispMin, dispMax), xlim = c(0, 15), main = "B32538 Gauge", 
     ylab = "Gauge (in)", xlab = "Time (s)")
lines(deltaTime, data[["Aim Gauge"]], col = "green")
lines(deltaTime, data[["Min Gauge"]], col = "red")
lines(deltaTime, data[["Max Gauge"]], col = "red")
abline(v = adaptStart, col = "blue")
abline(v = adaptEnd, col = "blue")
abline(v = newStart, col = "orange")
abline(v = newEnd, col = "orange")

adaptGauge <- data[data[,6] > adaptStart, 6:7]
adaptGauge <- adaptGauge[adaptGauge[,1] < adaptEnd, 1:2]
meanOld <- mean(adaptGauge[["Gauge Dev"]])

adaptGaugeNew <- data[data[,6] > newStart, 6:7]
adaptGaugeNew <- adaptGaugeNew[adaptGaugeNew[,1] < newEnd, 1:2]
meanNew <- mean(adaptGaugeNew[["Gauge Dev"]])

old_adaptorNew <- adaptorOld + rate * meanOld
new_adaptorNew <- adaptorOld + rate * meanNew

meanOld
meanNew
adaptorOld
old_adaptorNew
new_adaptorNew
old_adaptorNew - new_adaptorNew


