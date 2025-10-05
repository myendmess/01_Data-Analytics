library(tidyr)          # for unite()
library(dplyr)          # for mutate(), pipes
library(palmerpenguins) # for penguins dataset

first_name <- c("John", "Rob", "Rachel", "Christy", "Johnson", 
                "Candace", "Carlson", "Pansy", "Darius", "Claudia")

last_name <- c("Mendes", "Stewart", "Abrahamson", "Hickman", "Harper", 
              "Miller", "Landy", "Jordan", "Berry", "Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", 
              "Programmer", "Management", "Clerical", "Developer", "Programmer")

# Create an id column automatically
id <- 1:length(first_name)

# Build the employee data frame
employee <- data.frame(id, first_name, last_name, job_title)

# Unite first and last name into a single column
employee <- employee %>%
  unite("name", first_name, last_name, sep = " ")

print(employee)

# Work with the penguins dataset

library(dplyr)
library(palmerpenguins)

# Save the mutated dataset into a new object
penguins_new <- penguins %>%
  mutate(
    body_mass_kg = body_mass_g / 1000,
    flipper_length_m = flipper_length_mm / 1000
  )

# Option 1: Open in spreadsheet-like viewer
View(penguins_new)

# Option 2: Print first rows in the console
print(head(penguins_new))
