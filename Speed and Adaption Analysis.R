names <- c("Speed", "Thickness", "Previous Adaption", "New Adaption") 

#Data Import
library(readxl)
Jan_2018_Speed_Thick_Adapt <- read_excel("C:/Users/E20269/Documents/RStudio/Adaption Tuning/Input/Jan 2018 Speed Thick Adapt.xlsx", 
                                         col_names = FALSE)

data <- Jan_2018_Speed_Thick_Adapt

colnames(data) <- names

speed_4  <- subset.data.frame(data, data$Speed < 500, select = names)
speed_5  <- subset.data.frame(data, (data$Speed > 499)  & (data$Speed < 600),  select = names)
speed_6  <- subset.data.frame(data, (data$Speed > 599)  & (data$Speed < 700),  select = names)
speed_7  <- subset.data.frame(data, (data$Speed > 699)  & (data$Speed < 800),  select = names)
speed_8  <- subset.data.frame(data, (data$Speed > 799)  & (data$Speed < 900),  select = names)
speed_9  <- subset.data.frame(data, (data$Speed > 899)  & (data$Speed < 1000), select = names)
speed_10 <- subset.data.frame(data, (data$Speed > 999)  & (data$Speed < 1100), select = names)
speed_11 <- subset.data.frame(data, (data$Speed > 1099) & (data$Speed < 1200), select = names)
speed_12 <- subset.data.frame(data, (data$Speed > 1199) & (data$Speed < 1300), select = names)
speed_13 <- subset.data.frame(data, (data$Speed > 1299), select = names)

mean(speed_4$'New Adaption')
mean(speed_5$'New Adaption')
mean(speed_6$'New Adaption')
mean(speed_7$'New Adaption')
mean(speed_8$'New Adaption')
mean(speed_9$'New Adaption')
mean(speed_10$'New Adaption')
mean(speed_11$'New Adaption')
mean(speed_12$'New Adaption')
mean(speed_13$'New Adaption')

average <- c(mean(speed_4$'New Adaption'),
             mean(speed_5$'New Adaption'),
             mean(speed_6$'New Adaption'),
             mean(speed_7$'New Adaption'),
             mean(speed_8$'New Adaption'),
             mean(speed_9$'New Adaption'),
             mean(speed_10$'New Adaption'),
             mean(speed_11$'New Adaption'),
             mean(speed_12$'New Adaption'),
             mean(speed_13$'New Adaption'))

nums <- c(4:13)

nls_fit <- nls(average ~ a * nums + b * nums^(2) + c * nums^(3) + d * nums^(4) + e * nums^(5), 
               start = list(a = 0, b = 0, c = 0, d = 0, e = 0))
nls_fit
  
plot(c(4:13), average, pch = 16, main = "January 2018 Average Adaption",
     xlab = "Speed (fpm*100)", ylab = "Adaption (in)")
lines(nums, predict(nls_fit), col = "blue")
abline(h = 0, col = "red")

#plot(data$Speed, data$`New Adaption`, pch = 16, main = "January 2018 Average Adaption",  xlab = "Speed (fpm)", ylab = "Adaption (in)")
#points(data$Speed, predict(nls_fit), col = "blue", pch = 16)
