library(dplyr)
library(tidyr)
library(stringr)

# first, load and organize data for merge
# from Georgia Geospacial Information Office - unfinished
set_1 <- read.csv("data/pit-homeless-by-coc.csv", stringsAsFactors = FALSE) %>%
  rename(coc_name = L0Continuum_of_Care_Grantee_Are,
         coc_num = COCNUM,
         coc_cat = COCCAT,
         ) %>%
  gather(key = attribute,
         value = "value",
         -coc_name, -coc_num, -coc_cat, -OBJECTID, -Merger_flag, -COCNAME,
         -SHAPE_Length, -SHAPE_Area
         ) %>%
  mutate(year = paste0("20", str_sub(attribute, -2)),
         state = str_sub(coc_num, 1, 2)
         ) %>%
  select(coc_name, coc_num, state, coc_cat, year, attribute, value)
# from Anchorage Open Data program
set_2 <- read.csv("data/homelessness-count-usa.csv",
                  stringsAsFactors = FALSE
                  ) %>%
  rename(coc_name = CoC.Name,
         coc_num = CoC.Number,
         year = Year,
         attribute = Attribute.Name,
         value = Value
         ) %>%
  mutate(state = str_sub(coc_num, 1, 2),
         coc_cat = "x"
         ) %>%
  select(coc_name, coc_num, state, coc_cat, year, attribute, value)
# from Kaggle, user def love(x)
set_3 <- read.csv("data/homelessness-2007-2016.csv",
                  stringsAsFactors = FALSE
                  ) %>%
  rename(coc_name = CoC.Name,
         coc_num = CoC.Number,
         attribute = Measures,
         value = Count
  ) %>%
  mutate(year = substr(Year, 5, 8),
         state = str_sub(coc_num, 1, 2),
         coc_cat = "x"
  ) %>%
  select(coc_name, coc_num, state, coc_cat, year, attribute, value)

# merge the datasets and return
combined_homeless <- rbind(set_1, set_2, set_3)
write.csv(combined_homeless, "data/combined_homeles.csv")

homelessness <- load_all_data()
# summary list
summary <- list()
summary$num_observations <- nrow(combined_homeless)
summary$urban_area_highest_total <- combined_homeless %>%
  filter(coc_cat == "Major Cities" | coc_cat == "Other Urban CoCs",
         attribute == "Total Homeless" | str_sub(attribute, 1, 3) == "TOT",
         value == max(value, na.rm = TRUE)
         ) %>%
  pull(coc_name, state)

  
