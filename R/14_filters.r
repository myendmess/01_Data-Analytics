# Lesson 3: Filters Solutions

# -----------------------------------------------------------
# Step 1: Import your data
# -----------------------------------------------------------

# Read the CSV file into a data frame
hotel_bookings <- read.csv("C:/Users/Maboi/OneDrive/02_Education/02_ProCert/01_Coursera/Data-Analystics/R/datasets/05.5_hotel_bookings.csv")

# -----------------------------------------------------------
# Step 2: Refresh Your Memory
# -----------------------------------------------------------

# Look at a sample of the data
head(hotel_bookings)

# Preview all column names
colnames(hotel_bookings)

# -----------------------------------------------------------
# Step 3: Install and load the 'ggplot2' package
# -----------------------------------------------------------

install.packages("ggplot2")
library(ggplot2)

# -----------------------------------------------------------
# Step 4: Making many different charts
# -----------------------------------------------------------

# Scatter plot of lead_time vs children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Bar chart showing hotel type and market segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

# Facet by market segment (one chart per segment)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

# -----------------------------------------------------------
# Step 5: Filtering
# -----------------------------------------------------------

# Install and load the 'tidyverse' package
install.packages("tidyverse")
library(tidyverse)

# Create a filtered dataset for City Hotels with market_segment = Online TA
onlineta_city_hotels <- filter(
  hotel_bookings,
  hotel == "City Hotel" & hotel_bookings$market_segment == "Online TA"
)

# View the new filtered data frame
View(onlineta_city_hotels)

# Create the same filtered dataset using the pipe operator
onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel == "City Hotel") %>%
  filter(market_segment == "Online TA")

# View the second version
View(head(onlineta_city_hotels_v2, 1000))

# -----------------------------------------------------------
# Step 6: Use your new dataframe
# -----------------------------------------------------------

# Create a scatter plot using the filtered data
ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Optional: create the same plot using onlineta_city_hotels_v2
ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = children))

# -----------------------------------------------------------
# Optional: Save plots to the 'plots' folder
# -----------------------------------------------------------

# Create 'plots' folder if it doesn’t exist
if (!dir.exists("plots")) dir.create("plots")

# Save the last plot
ggsave(
  filename = "plots/14_filters_scatter.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)
