library(ggplot2)
library(palmerpenguins)

ggplot(data=penguins)+
geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,linetype=species)) + 
    #geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

ggsave(
  filename = "plots\\11_ggsmooth.png",
  plot = last_plot(),
  width = 10,
  height = 8,
  dpi = 300
)