
# -----------------------------------------------------------
# Step 1: Import your data
# -----------------------------------------------------------

# Read the CSV file into a data frame
hotel_bookings <- read.csv("C:/Users/Maboi/OneDrive/02_Education/02_ProCert/01_Coursera/Data-Analystics/R/datasets/05.5_hotel_bookings.csv")

# -----------------------------------------------------------
# Step 2: Refresh Your Memory
# -----------------------------------------------------------

# View the first few rows of the data
head(hotel_bookings)

# View all column names
colnames(hotel_bookings)

# -----------------------------------------------------------
# Step 3: Install and load the 'ggplot2' package
# -----------------------------------------------------------

install.packages("ggplot2")
library(ggplot2)

# -----------------------------------------------------------
# Step 4: Making a Bar Chart
# -----------------------------------------------------------

# Simple bar chart of distribution_channel
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel))

# Practice quiz answer:
# A: TA/TO distribution type has the most number of bookings.

# -----------------------------------------------------------
# Step 5: Diving deeper into bar charts
# -----------------------------------------------------------

# Bookings by distribution_channel, colored by deposit_type
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill = deposit_type))

# Bookings by distribution_channel, colored by market_segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill = market_segment))

# -----------------------------------------------------------
# Step 6: Facets galore
# -----------------------------------------------------------

# Separate charts for each deposit type
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# Separate charts for each market segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment)

# Using facet_grid (includes empty plots)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type)

# Combine facets by deposit_type and market_segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# Create 'plots' folder if it doesn’t exist
if (!dir.exists("plots")) dir.create("plots")

# save the last plot
ggsave(
  filename = "plots/13.5_faceted_chart.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)
