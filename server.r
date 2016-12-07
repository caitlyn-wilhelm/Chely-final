library(dplyr)
library(shiny)
library(plotly)
library(leaflet)

#set working directory 
setwd('~/Info 201/Assignments/Chely-final')
# sourcing in the data from buildvisual.R
source('./scripts/buildvisual.R')
#source for map :)
source('./scripts/InteractiveMap.R')
# using shiny server to build the app with the output of the scatter plot and input of the county names
shinyServer(function(input, output) {
    output$scatter <- renderPlotly({
        return(BuildScatter(input$countyname))
    })
    output$BuildMap <- renderLeaflet({
        return(BuildMap(input$Weights))
    })
})