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

# plot(data$Speed, data$'New Adaption')
# nls_fit <- nls(data$'New Adaption' ~ a + b * data$Speed^(-c), data, start = list(a = 0.005, b = 20, 
#                                                       c = 0.2))
# lines(data$Speed, predict(nls_fit), col = "red")

plot(c(4:13), average)
abline(h = 0, col = "red")
