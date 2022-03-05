library(shiny)

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
