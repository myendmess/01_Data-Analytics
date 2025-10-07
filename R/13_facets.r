# Install and load packages
install.packages("palmerpenguins")
install.packages("ggplot2")
library(ggplot2)
library(palmerpenguins)

# First plot facet_wrap: Penguins
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
geom_point(aes(color = species)) + labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguins Species") +
labs(caption = "Data collected by Dr. Kristen Gorman", x = "Flipper Length (mm)", y = "Body Mass (g)") +
facet_wrap(~ species) +
  geom_text(
    data = subset(penguins, species == "Gentoo"),
    aes(x = 220, y = 3000, label = "Gentoo species\nare the largest"),
    color = "blue",
    size = 4
  )

# Save penguins plot
ggsave(
  filename = "plots/13_facet_wrap_penguins.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)

# Second plot facet_grid: Penguins
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
geom_point(aes(color = species)) + labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguins Species") +
labs(caption = "Data collected by Dr. Kristen Gorman", x = "Flipper Length (mm)", y = "Body Mass (g)") +
facet_grid(sex ~ species) +
  geom_text(
    data = subset(penguins, species == "Gentoo" & sex == "female"),
    aes(x = 210, y = 2900, label = "Gentoo species\nare still the largest"),
    color = "blue",
    size = 4
  )
# Save penguins plot
ggsave(
  filename = "plots/13_facet_grid_penguins.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)

# Second plot: Diamonds
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut)

# Save diamonds plot
ggsave(
  filename = "plots/13_facetsdiamonds.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)


# Tilde operator is used to define the relationship between dependent variable and independent variables in a statistical 
# model. In the context of facet_wrap(~species), the tilde (~) indicates that the data should be split into separate panels  
# based on the unique values of the species variable.



