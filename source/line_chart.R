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

# This chart will find the total sum of all the homelessness categories in each
# year. Then, 
homelessness_by_year <- homeless_data %>%
  select(Year, State, Count, Measures) %>%
  mutate(year = as.numeric(substring(Year, 5, 8))) %>%
  group_by(year) %>%
  mutate(population_sum = as.numeric(gsub("[,]","", Count))) %>%
  summarize(yearly_total = sum(population_sum, na.rm = TRUE))
View(homelessness_by_year)

