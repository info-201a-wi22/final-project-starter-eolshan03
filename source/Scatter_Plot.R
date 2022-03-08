#install packages
library("dplyr")
library("ggplot2")
library("tidyr")
library("stringr")

# Set working directory 
setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03/docs")
homelessness <- read.csv("../data/homelessness-2007-2016.csv", stringsAsFactors = FALSE)

#Create data for NY and WA total homeless count from 2007-2016
the_homeless <- homelessness %>%
  group_by (Year, State) %>%
  filter(State == "WA" || State == "NY") %>%
  summarise(Count = sum(as.numeric(gsub("[,]","", Count), na.rm = TRUE))) %>%
  mutate(Year = as.numeric(substring(Year, 5,8)))

#Creating the Scatter Plot
scatter_plot <- ggplot(data = the_homeless) +
  geom_point(
    mapping = aes(x = Year, y = Count, color = State), alpha = .9
  ) +
  scale_color_manual(values=c('Purple','Green')
  ) +
  theme(axis.title = element_text(face ="bold", size=13)
  ) +
  scale_y_continuous(labels = scales::comma) +
  labs(
  title = "Total Homeless Population of (New York vs. Washington State)",
  subtitle = "From 2007 to 2016",
  x = "Year",
  y = "Total Homeless Count",
  color = "Location" +
  theme(plot.title = element_text(face ="bold", size=15))
) + 
  
#plot(scatter_plot)
