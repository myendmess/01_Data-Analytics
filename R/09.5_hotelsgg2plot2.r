# =============================================
# C7M4L2A1: You and GGPlot
# =============================================

# Step 1: Set working directory (if needed)
setwd("C:/Users/Maboi/OneDrive/02_Education/02_ProCert/01_Coursera/Data-Analystics/R")

# Step 2: Load required packages
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Step 3: Import your data
hotel_bookings <- read.csv("C:/Users/Maboi/OneDrive/02_Education/02_ProCert/01_Coursera/Data-Analystics/R/datasets/05.5_hotel_bookings.csv")

# Step 4: Explore your data
head(hotel_bookings)          # Preview first rows
colnames(hotel_bookings)      # Check column names

# Step 5: Scatterplot of lead_time vs children
p1 <- ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children)) +
  theme_minimal() +
  labs(title = "Lead Time vs Number of Children",
       x = "Lead Time (days)",
       y = "Number of Children")

# Display the plot
print(p1)

# Save the plot as PNG
ggsave(filename = "plots/09.5_leadtime_children.png", plot = p1, width = 8, height = 6, dpi = 300)

# Step 6: Scatterplot of stays_in_weekend_nights vs children
p2 <- ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = stays_in_weekend_nights, y = children)) +
  theme_minimal() +
  labs(title = "Weekend Nights vs Number of Children",
       x = "Weekend Nights Stayed",
       y = "Number of Children")

# Display the plot
print(p2)

# Save the plot as PNG
ggsave(filename = "plots/09.5_weekend_children.png", plot = p2, width = 8, height = 6, dpi = 300)

