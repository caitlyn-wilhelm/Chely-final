library(shiny)
library(dplyr)
library(plotly)
#Creating Server for the application that is going to draw a barplot
shinyServer(function(input, output){
  #Function thats going to eventually be the data of the barplot that reads in a paramater
  #That is the inputted county 
  Bar <- function(county) {
    #Sets the county to be the inputted county
    Student.Info.Weight.County <- filter(Student.Info.Weight, COUNTY == county)
    Student.Info.Weight.County.arranged <- arrange(Student.Info.Weight.County, NO..OVERWEIGHT.OR.OBESE)
    #Starts plotly that reads in the function that has the inputted county and sets Y
    #To the number of obese and overweight students
    plotBar <- plot_ly(Student.Info.Weight.County.arranged, y = ~NO..OVERWEIGHT.OR.OBESE,
                       #Adds text whenever the mouse is over a bar in the barplot
                       text = ~paste("School District/Area Name: ", AREA.NAME), 
                       type = 'bar', 
                       name = "Obese and Overweight") %>%
    #Produces the x and y axis names
      layout(yaxis = list(title = 'Number of Students'),
             xaxis = list(title = 'School District/Areas'),
             barmode = 'group')
    #Returns the plotly variable back to the function
    return(plotBar)
  }
  #Renders the plotly barplot using the "Bar" function we created
  #And applies the input county
  output$barplot <- renderPlotly({
    return(Bar(input$county))
  })
})
