library(tidyverse)
library(skimr)
library(janitor)


bookings_df <- read.csv("C:\\Users\\Maboi\\OneDrive\\02_Education\\02_ProCert\\Coursera\\Data-Analystics\\R\\05.5_hotel_bookings.csv")

View(head(bookings_df, 100))
View(head(glimpse(bookings_df), 100))
View(head(summary(bookings_df), 100))
View(head(str(bookings_df), 100))
View(head(colnames(bookings_df), 100))
View(head(skim_without_charts(bookings_df), 100))

trimmed_df <- bookings_df %>% 
    select(hotel, is_canceled, lead_time)
View(head(trimmed_df, 100))

generation_df <- bookings_df %>%
    mutate(guests = adults + children + babies)

head(generation_df)
View(head(generation_df, 100))

cancellation_df <- bookings_df %>%
  summarize(
    number_canceled = sum(is_canceled),
    average_lead_time = mean(lead_time, na.rm = TRUE)
  )

head(cancellation_df)
View(head(cancellation_df, 100))
