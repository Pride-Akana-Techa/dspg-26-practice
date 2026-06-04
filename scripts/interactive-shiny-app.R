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
  
  # could use radioButtons and textInput as well in place of selectInput
  selectInput(
    inputId = "user_input",
    label = "Choose your greeting:",
    choices = c("Hello, World", "Howdy!", "What's up?"),
    selected = "What's up?"
  ),
  
  textInput(
    inputId = "name",
    label = "What is your name?"
  ),
  
  textOutput(outputId = "greeting")
)

# server
server <- function(input, output){
  output$greeting <- renderText({
    paste0(input$use_input, input$name)
  })
}

# launch app
shinyApp(ui, server)