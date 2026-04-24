library(dplyr)
library(ggplot2)

# Downloading two sets for my comparison
# Need to download the data set online. It downloads as savant_data. will be changing name to hoerner_2025 and schwarber_2025

hoerner_2025 <- read.csv("C:/Users/hanke/Downloads/hoerner_2025.csv")
schwarber_2025 <- read.csv("C:/Users/hanke/Downloads/schwarber_2025.csv")

# There is a lot of data here. I will condense it
columns = c("pitch_type","pitch_name", "release_speed", "events", "bb_type", "hc_x", "hc_y",
            "hit_distance_sc", "launch_speed", "launch_angle", "release_pos_y",
            "bat_speed", "swing_length")

hoerner_2025 = hoerner_2025[, columns]
schwarber_2025 = schwarber_2025[, columns]

# Hoerner
count(hoerner_2025, events, sort = TRUE)

nrow(hoerner_2025[hoerner_2025$events == "double" | hoerner_2025$events == "triple" , ])

nrow(hoerner_2025[hoerner_2025$events == "double" & hoerner_2025$hit_distance_sc < 200
          | hoerner_2025$events == "triple" & hoerner_2025$hit_distance_sc < 200, ])

nrow(hoerner_2025[hoerner_2025$events == "single" & hoerner_2025$hit_distance_sc > 200, ])

# Schwarber
count(schwarber_2025, events, sort = TRUE)

nrow(schwarber_2025[schwarber_2025$events == "double" | schwarber_2025$events == "triple" , ])

nrow(schwarber_2025[schwarber_2025$events == "double" & schwarber_2025$hit_distance_sc < 200
          | schwarber_2025$events == "triple" & schwarber_2025$hit_distance_sc < 200, ])

nrow(schwarber_2025[schwarber_2025$events == "single" & schwarber_2025$hit_distance_sc > 200, ])
