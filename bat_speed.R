library(dplyr)
# Unfortunately Baseballr seems to struggle with some statcast stats, so I have manually made a custom leader board for bat speed and swing length in Savant

bat_speed <- read.csv("C:/Users/hanke/Downloads/bat_speed.csv")
bat_speed = bat_speed %>% mutate(time = sqrt((225*(avg_swing_length)^2)/(121*(avg_swing_speed)^2)))