data(ToothGrowth)
View(ToothGrowth)
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose == 0.5)

arrange(filtered_tg, len)
#print(arrange(filtered_tg, len))
View(arrange(filtered_tg, len))
arrange(filter(ToothGrowth, dose == 0.5), len)

filtered_toothgrowth <- ToothGrowth %>%
    filter(dose == 0.5) %>%
    arrange(len) %>%
    group_by(supp) %>%
    summarize(mean_len = mean(len, na.rm = T), .groups = "drop")
#print(filtered_toothgrowth)
View(filtered_toothgrowth)


# When using pipes:
# Add the pipe operator at the end of each line of the piped
# operation except the last one
# Check your code after you've programmed your pipe