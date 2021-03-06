library(shiny)
library(htmltools)
summary <- tabPanel(
  "Summary",
  h1("-"),
  h1("Summary"),
  p(paste("From the graph and the other explorations of data we've done over",
          "the course of the project, we've learned a lot about homelessness",
          "across the US.")),
  p(paste("There are some states that have consistently come up when looking",
          "at highest populations of homeless individuals, including",
          "California, Florida, Texas and New York. Given these states",
          "population size and the large cities located there, it is",
          "unsurprising that these states come up often. This can be seen in",
          "all of the charts on our website as well as in some of our past",
          "work, but the map shows this best. California is consistently the",
          "darkest color, almost black, while the other states listed are",
          "lighter, but still purples and reds.")),
  p(paste("In addition, we observed an increase in homeless populations",
          "leading up to 2011 and 2012. This can most easily be seen in the",
          "line chart, which shows a peak in those years in both the national",
          "graph and the states. There is a decrease after that for most",
          "states, with the exception of New York and Massachusetts, which",
          "continue to increase through the rest of the graphed time. The map",
          "can also show this trend with the colors overall of the graph. In",
          "the years 2010, 2011 and 2012, the map overall has darker orange",
          "colors and lightens up after that.")),
  p(paste("When looking at homeless individuals versus homeless individuals in",
          "families by state, there is generally a large percent of",
          "individuals. The bar chart shows this for sheltered individuals in",
          "6 states. Even when there are more families, the number of",
          "individuals is not far behind. When homeless individuals are the",
          "majority, they are the majority by a large margins. However, there",
          "does not seem to be a trend as to which states have more homeless",
          "individuals and which have more homeless in families.")),
  p(paste("Overall, there is a lot of fluctuation when looking at trends over",
          "time and there is a lot of range between the states. This suggests",
          "that there is still lots to be considered and many areas in which",
          "further investigation is necessary. Though we have identified some",
          "trends, the biggest takeaway is that we have a lot to do still."))
)

