library(dplyr)
library(shiny)
library(plotly)

# sourcing in the data from buildvisual.R
source('buildvisual.R')

# using shinyUI to create the app with a side panel that contains options for the county and 
# information about the graph and a main panel with the scatter plot
shinyUI(fluidPage(
  # creating a title for the tab
  headerPanel('Number of Obese and Overweight Students in New York by County'),
  sidebarPanel(
    # adding help text to help people understand the plot
    helpText("Select a County in New York to display the number of Obese and Overweight Students
             in the county selected. The colors of the scatter points represent the grade category 
             (including the district total). Hover over a scatter point to discover what school 
             district the students are from and the exact number of students overweight and obese 
             in that specific school."),
    # creating a divider
    hr(),
    # creating a drop down to choose the county to display on the plot
    selectInput("countyname", label = 'County', choices = Student.Weight.1$county, selected = 'albany')
  ),
  mainPanel(
    # setting the main panel for the scatter plot
    plotlyOutput('scatter')
  )
))