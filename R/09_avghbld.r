#########################################
# Lesson 3: Change Solutions
#########################################

## Step 1: Load packages ----
# Install required packages (only the first time)
# install.packages("tidyverse")
# install.packages("skimr")
# install.packages("janitor")

# Load packages
library(tidyverse)
library(skimr)
library(janitor)

#########################################
## Step 2: Import data ----
#########################################

# Import dataset (make sure hotel_bookings.csv is in your working directory)
hotel_bookings <- read_csv("C:\\Users\\Maboi\\OneDrive\\02_Education\\02_ProCert\\01_Coursera\\Data-Analystics\\R\\datasets\\05.5_hotel_bookings.csv")

# Quick data preview
head(hotel_bookings)

#########################################
## Step 3: Getting to know your data ----
#########################################

# Structure of data
str(hotel_bookings)

# Horizontal glimpse
glimpse(hotel_bookings)

# Column names
colnames(hotel_bookings)

# Visualization: simple count of hotels by type
ggplot(hotel_bookings, aes(x = hotel, fill = hotel)) +
  geom_bar() +
  theme_minimal() +
  labs(
    title = "Number of Bookings by Hotel Type",
    x = "Hotel Type",
    y = "Count"
  )

#########################################
## Step 4: Manipulating data ----
#########################################

# Arrange by ascending lead time
arrange(hotel_bookings, lead_time) %>% head()

# Arrange by descending lead time
arrange(hotel_bookings, desc(lead_time)) %>% head()

# Visualization: distribution of lead times
ggplot(hotel_bookings, aes(x = lead_time)) +
  geom_histogram(binwidth = 20, fill = "skyblue", color = "white") +
  theme_minimal() +
  labs(
    title = "Distribution of Lead Time",
    x = "Lead Time (days)",
    y = "Number of Bookings"
  )

#########################################
## Step 5: Save arranged data ----
#########################################

ggsave(
  filename = "plots\\09_avghbld.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)

hotel_bookings_v2 <- arrange(hotel_bookings, desc(lead_time))
head(hotel_bookings_v2)

#########################################
## Step 6: Summary statistics ----
#########################################

# Maximum and minimum lead time
max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)

# Average lead time
mean(hotel_bookings$lead_time)

# Check that v2 gives the same mean
mean(hotel_bookings_v2$lead_time)

#########################################
## Step 7: Filtering data ----
#########################################

# Filter to city hotels only
hotel_bookings_city <- filter(hotel_bookings, hotel == "City Hotel")

# Check filtered data
head(hotel_bookings_city)

# Average lead time for city hotels
View(mean(hotel_bookings_city$lead_time))

# Visualization: comparison of lead time distributions between hotel types
ggplot(hotel_bookings, aes(x = lead_time, fill = hotel)) +
  geom_histogram(binwidth = 20, alpha = 0.7, position = "identity") +
  theme_minimal() +
  labs(
    title = "Lead Time Distribution by Hotel Type",
    x = "Lead Time (days)",
    y = "Count"
  )

#########################################
## Step 8: Grouping and summarizing ----
#########################################

hotel_summary <- hotel_bookings %>%
  group_by(hotel) %>%
  summarise(
    average_lead_time = mean(lead_time),
    min_lead_time = min(lead_time),
    max_lead_time = max(lead_time)
  )

# View summary
head(hotel_summary)

# Visualization: summary comparison
ggplot(hotel_summary, aes(x = hotel, y = average_lead_time, fill = hotel)) +
  geom_col() +
  geom_text(aes(label = round(average_lead_time, 1)), vjust = -0.3) +
  theme_minimal() +
  labs(
    title = "Average Lead Time by Hotel Type",
    x = "Hotel Type",
    y = "Average Lead Time (days)"
  )

#########################################
## Step 9: Quick summary report ----
#########################################

skim(hotel_bookings)
