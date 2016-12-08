library(shiny)
library(dplyr)
library(plotly)
#Read in data
Student.Info <- read.csv("~/Info 201/Assignments/Chely-final/Data/Student_Weight_Status_Category_Reporting_Results__Beginning_2010.csv")
#Select columns that are needed for barplot
Student.Info.Weight <- select(Student.Info, AREA.NAME, COUNTY, GRADE.LEVEL, NO..OBESE, NO..OVERWEIGHT, NO..OVERWEIGHT.OR.OBESE)
#Creating UI for application that draws a barplot
shinyUI(fluidPage(
  #Title of the panel as well as title for the graph 
  titlePanel('Overweight and Obese Students in Different Counties of New York'),
  sidebarPanel(
    #Text that is simply information about barplot
    helpText("Pick any County in New York and a bar graph of the overall number of students
             who are obese and overweight will appear in ascending order. Put mouse on any bar
             to show the district in which that number of students belong to"),
    #Select input that allows you to pick which county you want to be represented in the barplot 
    selectInput("county", "County:", choices = Student.Info.Weight$COUNTY, selected = 'Albany'
    )
    #Creates the main panel
  ),
  mainPanel(
      #Creates the plotly output
      plotlyOutput("barplot")
    )
)
)
