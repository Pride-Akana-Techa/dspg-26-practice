# Shiny interactivity practice app
# June 04, 2026

# load libraries
library(shiny)
library(shinythemes)
library(shinyjs)
library(tidyverse)

# ui
ui <- fluidPage(
  titlePanel("Interactive Reading Application"),
  textInput(inputId = "user_input",
            label = "Enter your greeting: ",
            value = "Hello, World!"),
  
  textOutput(outputId = "greeting")
)

# server
server <- function(input, output){
  output$greeting <- renderText({
    paste0(input$use_input)
  })
}

# launch app
shinyApp(ui, server)