
# Load the necessary packages
library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(stringr)
library(shiny)
library(viridis)
library(maps)
library(mapproj)

# load the dataset
dataset <- "data/homelessness-2007-2016.csv"
homelessness_2007_2016 <- read.csv(dataset, header = TRUE, stringsAsFactors = FALSE)
combined <- read.csv("data/combined_homeless.csv",
                     stringsAsFactors = FALSE)

server <- function(input, output) {
  # Emily's chart
  output$homeless_map <- renderPlotly({
    coc <- combined %>%
      select(coc_cat, state, year, value) %>%
      filter(year == input$year_choice) %>%
      group_by(state) %>%
      summarize(total = sum(value, na.rm = T))
    
    
    coc$state <- state.name[match(coc$state, state.abb)]
    coc$state <- tolower(coc$state)
    
    fips <- map_data("state") %>%
      rename(polyname = region) %>%
      left_join(state.fips, by = "polyname")
    
    states <- fips %>%
      rename(state = polyname) %>%
      left_join(coc, by = "state")
    
    blank_theme <- theme_bw() +
      theme(axis.line = element_blank(), 
            axis.text = element_blank(), 
            axis.ticks = element_blank(),       
            axis.title = element_blank(),       
            plot.background = element_blank(),  
            panel.grid.major = element_blank(), 
            panel.grid.minor = element_blank(), 
            panel.border = element_blank())
    
    map <- ggplot(states) +
      geom_polygon(aes(long, lat, group = group, fill = total), color = "black") +
      coord_map() +
      scale_fill_viridis(option = "magma", direction = -1) +
      blank_theme +
      labs(title = paste0("Homelessness Population Concentration over Time (", 
                          input$year_choice, ")")) 
    
    ggplotly(map)
  })
  
  #Dinah's chart
 output$graph <- renderPlot({
  # calculating the sum of sheltered homeless individuals and sheltered
  # homeless people in families of different states
  the_homeless <- homelessness_2007_2016 %>%
    select(Measures,State,Count)%>%
    filter(State == input$State) %>%
    group_by(State, Measures) %>%
    filter(Measures == "Sheltered Homeless Individuals" | Measures == "Sheltered Homeless People in Families") %>%
    summarise(count = sum(as.numeric(Count), na.rm = TRUE))
  # the dodge bar chart that shows comparison between sheltered homeless individuals and sheltered
  # homeless people in families
  the_graph <- ggplot(the_homeless, mapping = aes(x = input$State, y = count , fill = Measures)) +
   geom_col(position = "dodge") +
    labs(
     title = "Sheltered Homeless Individuals vs. Sheltered Individuals in Families",
     subtitle = "(By State)",
     x = "State",
     y = "Count"
     ) +
    theme(plot.title = element_text(face = "bold", size=15)) +
    theme(axis.title = element_text(face = "bold")) +
    scale_fill_manual(values = c("Purple", "green")) +
    scale_y_continuous(limits = input$the_sum)
    return(the_graph)
    }
    )

  # Samira's chart
  output$state_vs_national_homelessness_pop <- renderPlotly({
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
      gather(key = tot_type, value = tots, -Year) %>%
      rename("Type" = tot_type, "Population" = tots)
    
    # make the plot, with 1 line representing that state populations and the
    # other line representing the national populations
    ggplot(data = us_tot) +
      geom_line(
        mapping = aes(x = Year, y = Population, color = Type),
        size = input$line_slider
      ) +
      scale_y_continuous(labels = scales::comma) +
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