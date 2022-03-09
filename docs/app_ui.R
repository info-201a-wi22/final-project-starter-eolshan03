library(shiny)
library(plotly)

# **Samira's Page 3 Stuff Below**
chart_page_1 <- tabPanel(
  "Homelessness Map", 
  h1(""),
  sidebarLayout(
    sidebarPanel(
      selectInput("year_choice", "Choose a Year", c("2018", "2016", "2015", 
                                                    "2014", "2013","2012", "2011", 
                                                    "2010", "2009", "2008", "2007")),
      p("This map helps to answer our research question: How can this 
     dataset become a foundational skill to change this homeless crisis? 
     This map shows which areas of the country are struggling the most with
     the homeless crisis as it reveals which areas have higher concentrations
     of homeless individuals. It also reveals which areas of the country have
     increased versus decreased in homeless populations. These trends can help
     determine which areas of the country need the most help and resources
     devoted to them to help solve this homelessness crisis.") 
    ),
    mainPanel(plotlyOutput("homeless_map"))
  )
)
  
  
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
  "Line Chart",
  h1(""),
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

# Dinah's page 
chart_page_2 <- tabPanel(
  "Bar Chart",
  # lets users change the homeless count (y-axis),
  h4("Bar Chart"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "the_sum",
        label = "Homeless Count: ",
        min = 0, max = 150000, value = c(0,150000)
      ),
      # lets users select the state (x-axis)
      selectInput(
        inputId = "State",
        label = "Choose State:",
        choices = c("AL","CA","FL","NY","TX","WA")
      )
    ),
    mainPanel(
      # the bar chart 
      h3("Bar Chart Visualization"),
      plotOutput("graph"),
      h4("Chart Information"),
      p("My dodge bar chart shows the total for sheltered homeless individuals and
        the total of sheltered homeless people in families. I choose to focus on the states 
        Alabama, Florida, Washington, New York, Texas, and California. In the chart, 
        you can change the homeless count (y-axis) to any variable lower than the max.
        Also, you can select any state (x-axis) that you want to see the comparison of sheltered
        homeless individuals and sheltered homeless people in families. This chart is important to recognize
        because I'm able to see a trend of sheltered homeless individuals and sheltered homeless people
        and to catch which states have higher rates. The homeless crisis in America is important
        to recognize because it is growing at a substantial rate and we need to make changes to our system to 
        provide housing for the homeless.")
    )
  )
)

ui <- navbarPage(
  title = "Homelessness in the US",
  position = "fixed-top",
  # intro,
  chart_page_1,
  chart_page_2,
  chart_page_3
  # summary,
  # report
)
