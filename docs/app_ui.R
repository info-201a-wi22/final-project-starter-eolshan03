library(shiny)
library(plotly)

# **Samira's Page 3 Stuff Below**

# Allow user to choose a state to be compared to the national homelessness
change_state <- selectInput(
  inputId = "select_state",
  label = h5("Select a State"),
  choices = c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL",
              "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME",
              "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
              "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC",
              "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"),
  selected = "CA",
  multiple = FALSE
)

# Allow user to change the year displayed on the graph
year_slider <- sliderInput(
  inputId = "year_slider",
  label = h5("Select Year Range"),
  min = 2007,
  max = 2016,
  value = c(2008, 2016),
  sep = "" # get rid of the commas
)

# Allow user to change the size of the lines displayed in the graph
change_thickness <- sliderInput(
  inputId = "line_slider",
  label = h5("Change the thickness of the lines \n on the graph"), 
  min = .5,
  max = 2,
  value = 1
)

chart_page_3 <- tabPanel(
  "Chart 3",
  sidebarLayout(
    sidebarPanel(
      h4(strong("Graph Customization")),
      change_state,
      year_slider,
      change_thickness
    ),
    mainPanel(
      h5(strong("About the Graph")),
      p("Below is a line chart that shows the total homelessness population in
        the United States and the total homelessness population in a state that
        the user may choose. The states that can be chosen are any of the 50
        states in the U.S. as well as D.C., Puerto Rico and Guam. The user may
        select a certain time range using the slider and change the thickness
        of the lines that appear on the graph. It is interactive via plotly so,
        the user may hover over each line to see the exact value."),
      p("The importance of this graph is to show how the homeless trends in a
        specific state compare to the nation's totals. By looking through each
        state, we can see which states make up a higher portion of the total
        population-meaning those states have more homeless people in it. Also,
        with the incorporation of the years, we can see if the trends
        (increases/decreases/stills) are the same or different between the two
        lines. The graph makes it easy to compare this by looking at the slope
        of each line. This analysis could lead to further research into why they
        aren't the same-if there are differences in the slopes."),
      h3(strong("Graph")),
      plotlyOutput("state_vs_national_homelessness_pop")
    )
  )
)

ui <- navbarPage(
  title = "Homelessness in the US",
  position = "fixed-top",
  intro,
  chart_page_1,
  chart_page_2,
  chart_page_3,
  summary,
  report
)
