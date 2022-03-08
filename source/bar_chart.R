library("dplyr")
library("ggplot2")
library("stringr")
library("tidyr")

# Set working directory 
setwd("C:/Users/Samira Shirazy/Desktop/final-project-starter-eolshan03/docs")
homeless <- read.csv("../data/combined_homeless.csv", stringsAsFactors = F)

pit_homeless <- homeless %>%
  filter(year == "2018" | year == "2013" | year == "2008") %>%
  select(coc_cat, year, value) %>%
  group_by(year) %>%
  mutate(total = sum(value, na.rm = T))


total_area_type <- function(area_type) {
  pit_homeless %>%
    group_by(year) %>%
    filter(coc_cat == area_type) %>%
    mutate(temp = sum(value, na.rm = T))
}

rural <- total_area_type("Rural CoCs") %>%
  rename(total_rural = temp) %>%
  group_by(year, total_rural) %>%
  summarize()

suburban <- total_area_type("Suburban CoCs") %>%
  rename(total_suburban = temp) %>%
  group_by(year, total_suburban) %>%
  summarize()

urban <- total_area_type("Other Urban CoCs") %>%
  rename(total_urban = temp) %>%
  group_by(year, total_urban) %>%
  summarize()

city <- total_area_type("Major Cities") %>%
  rename(total_city = temp) %>%
  group_by(year, total_city) %>%
  summarize()

pit_homeless <- pit_homeless %>%
  group_by(year, total) %>%
  summarize()
  
join <- left_join(rural, suburban, by = "year")
join2 <- left_join(urban, city, by = "year")
join3 <- left_join(join, join2, by = "year")
homeless_by_area <- left_join(join3, pit_homeless, by = "year")

homeless_pop <- homeless_by_area %>%
  select(year, total_rural, total_suburban, total_city, total_urban) %>%
  gather(key = area, value = pop, -year)

final_bar_chart <- ggplot(homeless_pop) +
  scale_y_continuous(labels = scales::comma) +
  geom_col(mapping = aes(year, pop, fill = area)) +
  ylab("Homeless Population") +
  scale_fill_discrete(labels = c("total city homeless", "total rural homeless", "total suburban homeless", "total urban homeless")) +
  labs(fill = "Community Type", title = "Homeless Pop over Time \n by Community Type")
