# Load the `dplyr` and `tidyr` libraries for data manipulation
library("dplyr")
library("tidyr")
library("ggplot2")

# Set working directory 
setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03")
getwd()

# Load homelessness data
filename <- "data/homelessness-2007-2016.csv"
homeless <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)

# Create Map 
state_shape <- map_data("state")
