library(palmerpenguins)
library(ggplot2)

# Just to inspect the data if you want
# View(penguins)  # optional

# Scatter plot
print(ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = species)) +
    labs(
        title = "Flipper Length vs Body Mass of Penguins",
        x = "Flipper Length (mm)",
        y = "Body Mass (g)",
        color = "Species"
    ) +
    theme_minimal())