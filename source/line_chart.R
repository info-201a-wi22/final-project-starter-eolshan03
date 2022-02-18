# Load the `dplyr` and `tidyr` libraries for data manipulation
library("dplyr")
library("tidyr")
library("ggplot2")
library("stringr")

# Set working directory 
setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03/source")
getwd()

# Load homelessness data
filename <- "../data/homelessness-2007-2016.csv"
homeless_data <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# This chart will find the total sum of all the homelessness categories in each
# year. Then, 
homelessness_by_year <- homeless_data %>%
  select(Year, State, Count, Measures) %>%
  mutate(year = as.numeric(substring(Year, 5, 8))) %>%
  group_by(year) %>%
  mutate(population_sum = as.numeric(gsub("[,]","", Count))) %>%
  summarize(yearly_total = sum(population_sum, na.rm = TRUE))

bar_plot <- ggplot(homelessness_by_year, aes(x = year, y = yearly_total)) +
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
    subtitle = "Sum of the homelessness populations from 2007 to 2016",
    x = "Year",
    y = "Population Sum",
    color = "Urbanity"
)

