library(dplyr)
library(tidyr)
library(stringr)
library(knitr)

setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03/docs")

# loading combined dataset
combined_homeless <- read.csv("../data/combined_homeless.csv",
                              stringsAsFactors = FALSE
                              ) %>%
  select(coc_name, coc_num, state, coc_cat, year, attribute, value)

# specific data to use
percent_sheltered <- combined_homeless %>%
  filter(year == 2016,
         attribute == "Sheltered Homeless" | attribute == "Total Homeless",
  ) %>%
  select(coc_num, attribute, value) %>%
  group_by(coc_num) %>%
  arrange(attribute, .by_group = TRUE) %>%
  mutate(per = value / lead(value)) %>%
  summarise(percent = sum(per, na.rm = TRUE)) %>%
  filter(percent != 0) %>%
  mutate(state = str_sub(coc_num, 1, 2)) %>%
  group_by(state) %>%
  summarise(avg_sheltered = mean(percent))
percent_unsheltered <- combined_homeless %>%
  filter(year == 2016,
         attribute == "Unsheltered Homeless" | attribute == "Total Homeless",
         ) %>%
  select(coc_num, attribute, value) %>%
  group_by(coc_num) %>%
  arrange(attribute, .by_group = TRUE) %>%
  mutate(per = value / lag(value)) %>%
  summarise(percent = sum(per, na.rm = TRUE)) %>%
  filter(percent != 0) %>%
  mutate(state = str_sub(coc_num, 1, 2)) %>%
  group_by(state) %>%
  summarise(avg_unsheltered = mean(percent))

# combined and cleaned to display
sheltered_unsheltered_by_state <- full_join(percent_sheltered,
                                            percent_unsheltered,
                                            by = "state"
                                            ) %>%
  mutate(sheltered = paste0(round(100 * avg_sheltered, digits = 1), "%"),
         unsheltered = paste0(round(100 * avg_unsheltered, digits = 1), "%")
         ) %>%
  select(state, sheltered, unsheltered)

