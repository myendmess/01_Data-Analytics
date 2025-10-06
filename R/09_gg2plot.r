install.packages("ggplot2")
install.packages("palmerpenguins")
library(ggplot2)
library(palmerpenguins)

data(penguins)
View(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))
# x = body_mass_g, y = flipper_length_mm
ggsave(
  filename = "plots\\09_gg2plot.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)

# x = species, y = body_mass_g

ggplot(data = penguins) +
  geom_boxplot(aes(x = species, y = body_mass_g, fill = species)) +
  theme_minimal() +
  labs(
    title = "Penguin Body Mass by Species",
    x = "Species",
    y = "Body Mass (g)"
  )

ggsave(
  filename = "plots/09_gg2plot2.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)
?ggplot