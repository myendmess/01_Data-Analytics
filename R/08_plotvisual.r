# Install and load required packages
# install.packages('Tmisc')
# install.packages('ggplot2')
# install.packages('dplyr')

library(Tmisc)
library(ggplot2)
library(dplyr)

# Load the dataset
data(quartet)

# View summary statistics
quartet_summary <- quartet %>%
  group_by(set) %>%
  summarize(
    mean_x = mean(x),
    sd_x = sd(x),
    mean_y = mean(y),
    sd_y = sd(y),
    correlation = cor(x, y)
  )

print(quartet_summary)

# ---- Plot 1: Scatterplots of Anscombe's Quartet ----
plot1 <- ggplot(quartet, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  facet_wrap(~set) +
  labs(
    title = "Scatterplots of Anscombe's Quartet",
    subtitle = "Each dataset has identical summary statistics but different distributions",
    x = "X values",
    y = "Y values"
  ) +
  theme_minimal()

# Display Plot 1
print(plot1)

# Save Plot 1 as PNG
ggsave(
  filename = "plots\\08_anscombe_quartet_detailed.png",
  plot = plot1,
  width = 8,
  height = 6,
  dpi = 300
)

# ---- Plot 2: Simplified version ----
plot2 <- ggplot(quartet, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~set) +
  theme_minimal() +
  labs(
    title = "Anscombe's Quartet (Simplified)",
    x = "X values",
    y = "Y values"
  )

# Display Plot 2
print(plot2)

# Save Plot 2 as PNG
ggsave(
  filename = "plots\\08_anscombe_quartet_simple.png",
  plot = plot2,
  width = 8,
  height = 6,
  dpi = 300
)

# Optional: check where files are saved
getwd()







