# Load the `dplyr` and `tidyr` libraries for data manipulation
library("dplyr")
library("tidyr")
library("ggplot2")
library("stringr")

# Set working directory 
setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03")
getwd()

# Load homelessness data
filename <- "data/homelessness-2007-2016.csv"
homeless_data <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

View(homeless_data)

# explain what this means pls
homelessness_by_year <- homeless_data %>%
  select(Year, State, Count, Measures) %>%
  mutate(yr = as.numeric(substring(Year, 5, 8))) %>%
  group_by(yr) %>%
  mutate(boi = as.numeric(gsub("[,]","",Count))) %>%
  summarize(yearly_tot = sum(boi, na.rm = TRUE))
View(ah)


# draft: Create Area Chart
ggplot(homelessness_by_year, aes(x = yr, y = yearly_tot)) +
  ylim(0, 3200000) +
  scale_y_continuous(labels = scales::comma) +
  geom_area(
    color = "black",
    alpha = .5,
    size = 2,
    fill = 8
  ) +
  geom_point(
    size = 2,
    color = "red"
  ) +
  labs (
    title = "Homeless Population in U.S. by year",
    subtitle = "Sum of homelessness populations from 2007 to 2016",
    x = "Year",
    y = "Population Sum",
    color = "Urbanity"
  )
  
