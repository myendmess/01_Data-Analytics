# Load libraries ------------------------------------------------------------
library(tidyverse)
library(lubridate)

# Import data ---------------------------------------------------------------
bookings_df <- read.csv("C:\\Users\\Maboi\\OneDrive\\02_Education\\02_ProCert\\Coursera\\Data-Analystics\\R\\05.5_hotel_bookings.csv")

# Quick inspection ----------------------------------------------------------
glimpse(bookings_df)
summary(bookings_df)

# Convert date columns properly ---------------------------------------------
bookings_df <- bookings_df %>%
    mutate(
    reservation_status_date = ymd(reservation_status_date),
    arrival_date_month = factor(arrival_date_month, 
                                levels = month.name, ordered = TRUE)
    )

# 1 Cancellations overview -------------------------------------------------
cancel_summary <- bookings_df %>%
    group_by(hotel) %>%
    summarise(
    total_bookings = n(),
    canceled = sum(is_canceled),
    cancel_rate = round(mean(is_canceled) * 100, 2)
    )

print(cancel_summary)

# Plot cancellation rate by hotel type
ggplot(cancel_summary, aes(x = hotel, y = cancel_rate, fill = hotel)) +
    geom_col() +
    labs(title = "Cancellation Rate by Hotel Type",
        x = "Hotel Type", y = "Cancellation Rate (%)") +
    theme_minimal()

# 2 Average Daily Rate (ADR) by month --------------------------------------
adr_by_month <- bookings_df %>%
    group_by(arrival_date_month, hotel) %>%
    summarise(mean_adr = mean(adr, na.rm = TRUE))

ggplot(adr_by_month, aes(x = arrival_date_month, y = mean_adr, color = hotel, group = hotel)) +
    geom_line(linewidth = 1.2) +
    geom_point(size = 3) +
    labs(title = "Average Daily Rate by Month",
        x = "Month", y = "Average Daily Rate (ADR)")

View(head(adr_by_month, 100))
