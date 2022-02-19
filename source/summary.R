library(dplyr)
library(tidyr)
library(stringr)

setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03/docs")

# # this only needed to be done once to create combined dataset. started by 
# # loading and organizing data for merge
# # from Georgia Geospacial Information Office
# set_1 <- read.csv("data/pit-homeless-by-coc.csv", stringsAsFactors = FALSE) %>%
#   rename(coc_name = L0Continuum_of_Care_Grantee_Are,
#          coc_num = COCNUM,
#          coc_cat = COCCAT,
#          ) %>%
#   gather(key = attribute,
#          value = "value_text",
#          -coc_name, -coc_num, -coc_cat, -"OBJECTID", -Merger_flag, -COCNAME,
#          -SHAPE_Length, -SHAPE_Area
#          ) %>%
#   mutate(year = paste0("20", str_sub(attribute, -2)),
#          state = str_sub(coc_num, 1, 2),
#          value = as.integer(value_text)
#          ) %>%
#   select(coc_name, coc_num, state, coc_cat, year, attribute, value)
# # from Anchorage Open Data program
# set_2 <- read.csv("data/homelessness-count-usa.csv",
#                   stringsAsFactors = FALSE
#                   ) %>%
#   rename(coc_name = CoC.Name,
#          coc_num = CoC.Number,
#          year = Year,
#          attribute = Attribute.Name,
#          ) %>%
#   mutate(state = str_sub(coc_num, 1, 2),
#          coc_cat = "x",
#          value = as.integer(Value)
#          ) %>%
#   select(coc_name, coc_num, state, coc_cat, year, attribute, value)
# # from Kaggle, user def love(x)
# set_3 <- read.csv("data/homelessness-2007-2016.csv",
#                   stringsAsFactors = FALSE
#                   ) %>%
#   rename(coc_name = CoC.Name,
#          coc_num = CoC.Number,
#          attribute = Measures,
#   ) %>%
#   filter(!is.na(Count)) %>%
#   mutate(year = substr(Year, 5, 8),
#          state = str_sub(coc_num, 1, 2),
#          coc_cat = "x",
#          value = as.integer(str_replace_all(Count, ",", ""))
#   ) %>%
#   select(coc_name, coc_num, state, coc_cat, year, attribute, value)
# # merge the datasets and write to csv in data file
# combined_homeless <- rbind(set_1, set_2, set_3)
# write.csv(combined_homeless, "data/combined_homeless.csv")

# now this data can be accessed as follows
combined_homeless <- read.csv("data/combined_homeless.csv",
                              stringsAsFactors = FALSE
                              ) %>%
  select(coc_name, coc_num, state, coc_cat, year, attribute, value)

# summary list code here
summary <- list()
# num_observations is just the total number of observations across the 3
# original sets
summary$num_observations <- nrow(combined_homeless)
# area_highest_total is the CoC with the highest total homeless population
summary$area_highest_total <- combined_homeless %>%
  filter(attribute == "Total Homeless" | str_sub(attribute, 1, 3) == "TOT",
         coc_name != "Total"
  ) %>%
  filter(value == max(value, na.rm = TRUE)) %>%
  pull(coc_name)
# highest_total_state_2018 combines the total populations for each state and
# returns the state with the highest population
summary$highest_total_state_2018 <- combined_homeless %>%
  filter(str_sub(attribute, 1, 3) == "TOT",
         year == 2018
  ) %>%
  group_by(state) %>%
  summarise(total_in_state = sum(value, na.rm = TRUE)) %>%
  filter(total_in_state == max(total_in_state)) %>%
  pull(state)
# calculates percent shelered in each CoC in 2016 and averages all
summary$avg_percent_sheltered_2016 <- combined_homeless %>%
  filter(year == 2016,
         attribute == "Sheltered Homeless" | attribute == "Total Homeless",
  ) %>%
  select(coc_num, state, attribute, value) %>%
  group_by(coc_num) %>%
  arrange(attribute, .by_group = TRUE) %>%
  mutate(percent_sheltered = value / lead(value)) %>%
  summarise(avg = sum(percent_sheltered, na.rm = TRUE)) %>%
  filter(avg != 0) %>%
  summarise(mean(avg, na.rm = TRUE)) %>%
  pull("mean(avg, na.rm = TRUE)")
# calculates percent shelered in each CoC in 2016 and averages all
summary$avg_percent_unsheltered_2016 <- combined_homeless %>%
  filter(year == 2016,
         attribute == "Unsheltered Homeless" | attribute == "Total Homeless",
  ) %>%
  select(coc_num, state, attribute, value) %>%
  group_by(coc_num) %>%
  arrange(attribute, .by_group = TRUE) %>%
  mutate(percent_unsheltered = value / lag(value)) %>%
  summarise(avg = sum(percent_unsheltered, na.rm = TRUE)) %>%
  filter(avg != 0) %>%
  summarise(mean(avg, na.rm = TRUE)) %>%
  pull("mean(avg, na.rm = TRUE)")