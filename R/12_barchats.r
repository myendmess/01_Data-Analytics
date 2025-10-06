# =============================================
# Bar chart with diamonds dataset (ggplot2)
# =============================================

# Install and load ggplot2
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# The diamonds dataset is built into ggplot2
# So you can use it directly

# Create a bar chart of cut filled by clarity
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) +
  theme_minimal() +
  labs(
    title = "Diamond Cuts by Clarity",
    x = "Cut Quality",
    y = "Count of Diamonds"
  )

# Create folder 'plots' if it doesn't exist
# if(!dir.exists("plots")) dir.create("plots")

# Save the last plot as a PNG file
ggsave(
  filename = "plots/12_barcharts.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)
