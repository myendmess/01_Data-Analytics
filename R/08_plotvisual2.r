# Install and load required packages
# install.packages('datasauRus')
# install.packages('ggplot2')

library(datasauRus)
library(ggplot2)

# Create a folder to store plots (if it doesn't exist)
if (!dir.exists("plots")) {
  dir.create("plots")
}

# ---- Plot: Datasaurus Dozen ----
plot_datasaurus <- ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset)) +
  geom_point(size = 1.5) +
  theme_void() +
  theme(
    legend.position = "none",
    strip.text = element_text(size = 10, face = "bold")
  ) +
  facet_wrap(~dataset, ncol = 3) +
  labs(
    title = "Datasaurus Dozen",
    subtitle = "Datasets with nearly identical summary statistics but very different distributions",
    caption = "Source: datasauRus package"
  )

# Display the plot
print(plot_datasaurus)

# ---- Save the plot as PNG ----
ggsave(
  filename = "plots\\08.2_datasaurus_dozen.png",
  plot = plot_datasaurus,
  width = 10,
  height = 8,
  dpi = 300
)

# Optional: confirm the save location
getwd()
