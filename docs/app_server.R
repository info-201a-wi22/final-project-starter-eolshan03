
# Load the necessary packages
library("dplyr")
library("plotly")
library("ggplot2")
library("tidyverse")
library("stringr")

# load the dataset
file_name <- "homelessness-2007-2016.csv"
homelessness_2007_2016 <- read.csv(file_name, header = TRUE, stringsAsFactors = FALSE)

server <- function(input, output) {
  # Emily's stuff
  
  # Dinah's stuff
  
  # Samira's chart
  output$state_vs_national_homelessness_pop <- renderPlot({
    # calculate the state homelessness totals by year
    # filter by the state selected by the user
    state_tot <- homelessness_2007_2016 %>%
      select(Year, State, Count) %>%
      mutate(Year = as.numeric(str_sub(Year, start = -4)),
             Count = as.numeric(gsub(",", "", Count))) %>%
      group_by(Year) %>%
      filter(State == input$select_state) %>%
      summarize("State" = sum(Count, na.rm = T))
    # calculate the national homelessness totals by year
    # filter by the year selected by the user
    # join the dataset with the `state_tot` in order to make the graph
    us_tot <- homelessness_2007_2016 %>%
      select(Year, State, Count) %>%
      mutate(Year = as.numeric(str_sub(Year, start = -4)),
             Count = as.numeric(gsub(",", "", Count))) %>%
      group_by(Year) %>%
      summarize("National" = sum(Count, na.rm = T)) %>%
      left_join(state_tot, by = "Year") %>%
      filter(Year >= input$year_slider[1], Year <= input$year_slider[2]) %>%
      gather(key = tot_type, value = tots, -Year)
    
    # make the plot, with 1 line representing that state populations and the
    # other line representing the national populations
    ggplot(data = us_tot) +
      geom_line(
        mapping = aes(x = Year, y = tots, color = tot_type),
        size = input$line_slider
      ) +
      labs(
        title = paste0("Population of the Total Homelessness Population in the 
                     United States versus ", input$select_state),
        subtitle = paste0("from the years: ", input$year_slider[1], " to ",
                          input$year_slider[2]),
        color = "Population type",
        x = "Year",
        y = "Homelessness Population"
      )
  })
}