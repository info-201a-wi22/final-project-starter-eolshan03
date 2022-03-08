library(shiny)

# **Samira's Page 3 Stuff Below**

# Allow user to choose a state to be compared to the national homelessness
change_state <- selectInput(
  inputId = "select_state",
  label = h3("Select a State"),
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
  label = "Select Year Range",
  min = 2007,
  max = 2016,
  value = c(2008, 2016),
  sep = "" # get rid of the commas
)

# Allow user to change the size of the lines displayed in the graph
change_thickness <- sliderInput(
  inputId = "line_slider",
  label = "Change the thickness of the lines \n on the graph", 
  min = 1,
  max = 10,
  value = 2
)

chart_page_3 <- tabPanel(
  "Chart 3",
  sidebarLayout(
    sidebarPanel(
      h4(strong("Graph Customization")),
      change_state,
      year_slider,
      change_thickness
    )
  ),
  mainPanel(
    h5(strong("About the Graph")),
    p("My paragraph will go here..."),
    h3(strong("Graph")),
    plotlyOutput("state_vs_national_homelessness_pop")
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
