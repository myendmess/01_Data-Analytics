# Load required library
library(ggplot2)

# Load the airquality dataset
data("airquality")

### ----------------------------------------------------
### 1. Logical Conditions
### ----------------------------------------------------

# AND condition: Solar.R > 150 AND Wind > 10
cat("\nAND condition:\n")
print(head(na.omit(airquality[airquality$Solar.R > 150 & airquality$Wind > 10, ]), 5))

# OR condition: Solar.R > 150 OR Wind > 10
cat("\nOR condition:\n")
print(head(na.omit(airquality[airquality$Solar.R > 150 | airquality$Wind > 10, ]), 5))

# Double OR condition (negation of OR): NOT (Solar.R > 150 OR Wind > 10)
cat("\nDouble OR condition:\n")
print(head(na.omit(airquality[!(airquality$Solar.R > 150 | airquality$Wind > 10), ]), 5))

# NOT condition: Day not equal to 1
cat("\nNOT condition:\n")
print(head(na.omit(airquality[airquality$Day != 1, ]), 5))


### ----------------------------------------------------
### 2. Visualization (AND condition)
### ----------------------------------------------------

# Filter data: Solar.R > 150 AND Wind > 10
filtered_data <- na.omit(airquality[airquality$Solar.R > 150 & airquality$Wind > 10, ])

# Plot: Solar.R vs Wind with larger text
print (ggplot(filtered_data, aes(x = Solar.R, y = Wind)) +
  geom_bar(stat = "identity", color = "blue", size = 10) +
  labs(
    title = "Solar Radiation vs Wind (AND Condition)",
    x = "Solar Radiation",
    y = "Wind Speed"
  ) +
  theme_minimal(base_size = 26) +  # base font size for all text
  theme(
    plot.title = element_text(size = 32, face = "bold"),
    axis.title = element_text(size = 28),
    axis.text = element_text(size = 28)

  ))


### ----------------------------------------------------
### 3. Conditional Statements
### ----------------------------------------------------

ozone_level <- airquality[1, "Ozone"]

if (is.na(ozone_level)) {
  cat("\nOzone reading is missing for the first day.\n")
} else if (ozone_level < 30) { 
  cat("\nLow ozone level.\n")
} else if (ozone_level < 100) { 
  cat("\nModerate ozone level.\n")
} else {
  cat("\nHigh ozone level.\n")
}

