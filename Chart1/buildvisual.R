library(dplyr)
library(shiny)
library(plotly)

# reading in the data for the student weight in New York 
Student.Weight <- read.csv("~/Documents/info-201/Chely-final/data/Student_Weight_Status_Category_Reporting_Results__Beginning_2010.csv")

# creating a new data frame to select only certain columns
Student.Weight.1 <- select(Student.Weight, AREA.NAME, COUNTY, GRADE.LEVEL, NO..OBESE, NO..OVERWEIGHT, NO..OVERWEIGHT.OR.OBESE)

# Creating a function called buildscatter to create a scatter plot for the obese and overweight in each county
BuildScatter <- function(countyname) {
  # creating a new dataframe that filters to only one county
  Student.Weight.2 <- filter(Student.Weight.1, COUNTY == countyname)
  # creating the plotly scatter plot
  weight.plot <- plot_ly(data = Student.Weight.2, x = ~NO..OBESE, y = ~NO..OVERWEIGHT,
                         # creating the text to show when hovering over a point
                         text = ~paste("School District/Area Name: ", AREA.NAME, "<br>Obese Students: ", NO..OBESE, "<br>Overweight Students: ", NO..OVERWEIGHT),
                         type = 'scatter', 
                         mode = 'markers', marker = list(size = 8, opacity = 0.75), 
                         color = ~GRADE.LEVEL) %>%
                 # making a title for the plot, xaxis, and yaxis and changing the colors
                 layout(title = 'Obese and Overweight Students by County',
                        yaxis = list(title = 'Number of Students Overweight',
                                     gridcolor = 'rgb(255, 255, 255)'),
                        xaxis = list(title = 'Number of Students Obese',
                                     gridcolor = 'rgb(255, 255, 255)'),
                        paper_bgcolor = 'rgb(243, 243, 243)',
                        plot_bgcolor = 'rgb(243, 243, 243)')
  return(weight.plot)
}