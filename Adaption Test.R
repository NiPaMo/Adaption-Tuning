#Import Data
library(readxl)
testOld <- read_excel("C:/Users/E20269/Documents/RStudio/Adaption Tuning/Input/Adaption Test.xlsx", sheet = "Old")
testNew <- read_excel("C:/Users/E20269/Documents/RStudio/Adaption Tuning/Input/Adaption Test.xlsx", sheet = "New")

plot(testOld$Gauge, testOld$DevHd, col = "red", ylim = c(-3.5, 2.5), xlim = c(0.12, 0.22), pch = 16,
     main = "40910 Head Gauge Deviation", xlab = "Gauge (mil)", ylab = "Deviation (mil)")
points(testNew$Gauge, testNew$DevHd, col = "blue", pch = 16)
abline(lm(testOld$DevHd ~ testOld$Gauge), col = "red")
abline(lm(testNew$DevHd ~ testNew$Gauge), col = "blue")
abline(h = 0, col = ("green"))
legend("topright", c("Old Adaption", "New Adaption"), col = c("red", "blue"), pch = 16)

plot(testOld$Gauge, testOld$DevBd, col = "red", ylim = c(-0.5, 0), xlim = c(0.12, 0.22), pch = 16,
     main = "40910 Body Gauge Deviation", xlab = "Gauge (mil)", ylab = "Deviation (mil)")
points(testNew$Gauge, testNew$DevBd, col = "blue", pch = 16)
abline(lm(testOld$DevBd ~ testOld$Gauge), col = "red")
abline(lm(testNew$DevBd ~ testNew$Gauge), col = "blue")
abline(h = 0, col = ("green"))
legend("bottomright", c("Old Adaption", "New Adaption"), col = c("red", "blue"), pch = 16)

