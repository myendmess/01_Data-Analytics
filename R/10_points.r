library(ggplot2)
library(palmerpenguins)

ggplot(data=penguins)+
geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species, size=7, shape=species), alpha=0.5)


ggsave(
  filename = "plots\\10_points.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)