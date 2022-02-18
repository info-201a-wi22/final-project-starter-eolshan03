#install packages
library("dplyr")
library("ggplot2")
library("tidyr")
library("stringr")

setwd("~/Documents/Group Project/final-project-starter-eolshan03")
homelessness <- read.csv("data/homelessness-2007-2016.csv", stringsAsFactors = FALSE)

#Create data for NY and WA total homeless count from 2007-2016
the_homeless <- homelessness %>%
  group_by(Year,State) %>%
  filter(State == "WA" || State == "NY") %>%
  summarize(Count = sum(as.numeric(Count), na.rm = TRUE)) %>%
  mutate(Year = as.numeric(substring(Year, 5,8)))
  View(the_homeless)
  
#Creating the Scatter Plot
scatter_plot <- ggplot(data = the_homeless) +
  geom_point(
    mapping = aes(x = Year, y = Count, color = State), alpha = .9, size = 3
  ) +
  scale_color_manual(values=c('Purple','Green')
  ) +
  theme(axis.title = element_text(face="bold", size=13)
  ) +
  labs(
    
  title = "Total Homeless Population of (New York vs. Washington State)",
  subtitle = "(Total Population By Year)",
  x = "Year (2007-2016)",
  y = "Total Homeless Count",
  color = "Location") +
  theme(plot.title = element_text(face ="bold", size=15)
  )