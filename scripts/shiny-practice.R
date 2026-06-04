# Shiny practice app
# June 04, 2026

# load libraries
library(shiny)
library(shinythemes)
library(shinyjs)
library(tidyverse)

# UI: Layout and inputs/outputs go here
ui <- fluidPage(
  titlePanel("Exploring the normal distribution"),
  textOutput(outputId = "context_discussion"),
  plotOutput(outputId = "normal_plot")
  # add ui code here
)

# Server: logic, and reactivity go here
server <- function(input, output) {
  # Add server code
  output$normal_plot <- renderPlot({
    # create normal vector
    set.seed(seed = 7)
    samples <- rnorm(1000, mean = 0, sd = 1)
    
    # make a histogram
    hist(samples,
         breaks = 30,
         col = "maroon",
         main = "Histogram of normal samples",
         xlab = "Value")
    })

# add context
  output$context_discussion <-  renderText({
  "This histogram"
})

}

# Launch the app
shinyApp(ui, server)