grades <- unique(Jan_2018_Stat$Grade)

i = 1
gradesMean <- 0
gaugesMean <- 0

for (num in grades){
  gradesSub <- subset.data.frame(Jan_2018_Stat, Jan_2018_Stat$Grade== num, select = c("DevHd", "Gauge"))
  gradesMean[i] <- mean(gradesSub[[1]], na.rm = T)
  gaugesMean[i] <- mean(gradesSub[[2]], na.rm = T)
  i = i + 1
}

names(gradesMean) <- grades
gradesMean <- sort(gradesMean)

names(gaugesMean) <- grades
gaugesMean <- sort(gaugesMean, decreasing = T)

barplot(gradesMean[1:10], axisnames = T)

gradesMean
gaugesMean <- gaugesMean * 1000
gaugesMean

gaugesSpeed <- 7e-8 * gaugesMean^4 - 0.0001 * gaugesMean^3 + 0.0626 * gaugesMean^2 - 17.994 * gaugesMean + 2563.4

gaugesSpeed <- sort(gaugesSpeed)

barplot(gaugesSpeed[1:10], axisnames = T, xlab = "Grade", ylab = "Speed (fpm)")
