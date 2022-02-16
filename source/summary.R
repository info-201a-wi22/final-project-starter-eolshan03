library(dplyr)
library(tidyr)

# load and organize data for merge
# from Georgia Geospacial Information Office - unfinished
set_1 <- read.csv("data/pit-homeless-by-coc.csv", stringsAsFactors = FALSE) %>%
  rename(coc_name = L0Continuum_of_Care_Grantee_Are,
         coc_num = COCNUM,
         coc_cat = COCCAT,
         ) %>%
  gather(key = attribute,
         value = value,
         -coc_name, -coc_num, -coc_cat
         )

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
  select(coc_name, coc_num, year, attribute, value)

# from Kaggle, user def love(x)
set_3 <- read.csv("data/homelessness-2007-2016.csv",
                  stringsAsFactors = FALSE
                  ) %>%
  mutate(year = substr(Year, 5, 8)) %>%
  rename(coc_name = CoC.Name,
         coc_num = CoC.Number,
         attribute = Measures,
         value = Count
  ) %>%
  select(coc_name, coc_num, year, attribute, value)
# merge all datasets
homelessness <- 

# summary list
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)