library(shiny)
library(leaflet)

shinyUI(fluidPage(
  titlePanel("Student obesity by county in New York"),
  # Create sidebar layout
  sidebarLayout(
    
    # Side panel for controls
    sidebarPanel(
      
      # Input to select variable to map
      selectInput('Weights', label = 'weight', choices = 
                    list("Obese" = 'Obese', 'Overweight' = 'Overweight', 'Obese or Overweight' = 'Obese.and.Overweight'))
      
    ),
    
    # Main panel: display leaflet map
    mainPanel(
      leafletOutput('BuildMap')
    )
  )
))