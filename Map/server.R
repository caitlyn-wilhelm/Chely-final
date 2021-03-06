library(shiny)

# sourcing in the data from buildvisual.R
source('InteractiveMap.R')

# using shiny server to build the app with the output of the map and input of the mapping values
shinyServer(function(input, output) {
  output$BuildMap <- renderLeaflet({
    return(BuildMap(input$Weights))
  })
})