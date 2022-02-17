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
ah <- homeless_data %>%
  select(Year, State, Count, Measures) %>%
  mutate(yr = as.numeric(substring(Year, 5, 8))) %>%
  group_by(yr) %>%
  mutate(boi = as.numeric(gsub("[,]","",Count))) %>%
  summarize(yearly_tot = sum(boi, na.rm = TRUE))
View(ah)

# Create Area Chart

