library(dplyr)
library(shiny)
library(plotly)
library(leaflet)

#set working directory 
setwd('~/Info 201/Assignments/Chely-final')
# sourcing in the data from buildvisual.R
source('./Chart1//buildvisual.R')
#source for map :)
source('./Map/InteractiveMap.R')
#set source for summary page
source('./Summary/Summary Information.R')
# using shiny server to build the app with the output of the scatter plot and input of the county names
shinyServer(function(input, output) {
    output$scatter <- renderPlotly({
        return(BuildScatter(input$countyname))
    })
    output$BuildMap <- renderLeaflet({
        return(BuildMap(input$Weights))
    })
    output$table <- renderDataTable(mean.county.obese) 
    output$table2 <- renderDataTable(mean.county.overweight)
    output$table3 <- renderDataTable(high.county.obese)
    output$table4 <- renderDataTable(high.grade)
    output$table5 <- renderDataTable(high.grade.overweight)
    output$table6 <- renderDataTable(high.county.overweight)
})