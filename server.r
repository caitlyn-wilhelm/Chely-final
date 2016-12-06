library(dplyr)
library(shiny)
library(plotly)

# sourcing in the data from buildvisual.R
source('Chart1/buildvisual.R')

# using shiny server to build the app with the output of the scatter plot and input of the county names
shinyServer(function(input, output) {
    output$scatter <- renderPlotly({
        return(BuildScatter(input$countyname))
    })
})