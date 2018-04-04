#Import Data
library(readxl)
Jan_2018_Stat <- read_excel("C:/Users/E20269/Documents/RStudio/Adaption Tuning/Input/Jan 2018 Stat.xlsx")

data <- Jan_2018_Stat
grade <- 40910

# Test new average adaption (gaDev + old ada avg - new ada avg)
#data$DevHd <- data$DevHd + 1.438


dataGrade <- subset.data.frame(data, data$Grade == grade, select = c("SlabId","Grade", "Gauge", "DevHd"))
dataGradeNew <- subset.data.frame(data, data$Grade != grade, select = c("SlabId", "Grade", "Gauge", "DevHd"))

# Histogram
# hist(data$DevHd, breaks = 250, xlim = c(-5, 5), ylim = c(0, 90), main = "January 2018 Gauge Performance\n Modified Adaption",
#     xlab = "Gauge Deviation (mil)", col = "grey")
# hist(dataGrade$DevHd, breaks = 250, xlim = c(-5, 5), ylim = c(0, 20),
#    xlab = "Gauge Deviation (mil)", add = T, col = "blue")
# abline(v = 0, col = "red")
# legend("topright", c("Overall", grade), col = c("grey", "blue"), lwd = 5)

# Scatter Plot
plot(data$Gauge, data$DevHd, col = "red", ylim = c(-3.5, 2.5), xlim = c(0.12, 0.22), pch = 16,
     main = "40910 Head Gauge Deviation", xlab = "Gauge (mil)", ylab = "Deviation (mil)")
#points(dataGrade$Gauge, dataGrade$DevHd, col = "blue", pch = 16)
abline(lm(data$DevHd ~ data$Gauge), col = "red")
#abline(lm(dataGrade$DevHd ~ dataGrade$Gauge), col = "blue")
abline(h = 0, col = ("green"))
legend("topright", c("Old Adaption", "New Adaption"), col = c("red", "blue"), pch = 16)

gauge <- 0
  
dataGauge <- subset.data.frame(dataGradeNew, dataGrade$Gauge <= (gauge), select = c("SlabId", "Grade", "Gauge", "DevHd"))
dataGaugeNew <- subset.data.frame(dataGradeNew, dataGrade$Gauge > (gauge), select = c("SlabId", "Grade", "Gauge", "DevHd"))

mean(dataGauge$DevHd, na.rm = T)
mean(dataGaugeNew$DevHd, na.rm = T)