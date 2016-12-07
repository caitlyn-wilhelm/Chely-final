library(dplyr)
library(shiny)
library(plotly)

#set working directory 
setwd('~/Info 201/Assignments/Chely-final')
# sourcing in the data from buildvisual.R
#source('./scripts/buildvisual.R')

# using shinyUI to create the app with a side panel that contains options for the county and 
# information about the graph and a main panel with the scatter plot
shinyUI(fluidPage(
    navbarPage('Overweight and Obese Students in New York',
               tabPanel('Summary',
                        headerPanel("Summary of Student Obesity  in New York"),
                        mainPanel(
                            h2("Introduction"),
                            p('This dataset shows that there is currently a large amount of overweight and obese students in New York.
                              There are sepecific counties and regions that have higher percentages than others. These percentages help show 
                              that this is a massive issue. The data can also help find a solution to this issue by focusing on the counties 
                              and regions that have a low amount of obese and overweight students and looking at what they do to have healthy
                              students.'),
                            br(),
                            h3("Average Amount of Obese Students per County"),
                            
                            fluidRow(
                                column(12,
                                       dataTableOutput('table')
                                      )
                                    ),
                             br(),
                            h3('Average Amount of Overweight Students per County'),
                            fluidRow(
                                column(12,
                                       dataTableOutput('table2')
                                )
                            ),
                            h3('Amount of Obese Students per County'),
                            fluidRow(
                                column(12,
                                       dataTableOutput('table3')
                                )
                            ),
                            h3('Amount of Overweight Students per County'),
                            fluidRow(
                                column(12,
                                       dataTableOutput('table6')
                                )
                            ),
                            h3('Overall Amount of Obese Students per Grade Level'),
                            fluidRow(
                                column(12,
                                       dataTableOutput('table4'))
                            ),
                            h3('Overall Amount of Overweight Students per Grade Level'),
                            fluidRow(
                                column(12,
                                       dataTableOutput('table5'))
                            )
                    )
            ),
               tabPanel('Map',
                        headerPanel("Student Obesity by County in New York"),
                        # Create sidebar layout
                        sidebarLayout(
                            
                            # Side panel for controls
                            sidebarPanel(
                                helpText("Select either Obese, Overweight, or Obese and Overweight 
                                        from the drop down menu below to see the map of New York by
                                         District. Hover over each district to see the percent of 
                                         children obese, overweight or both respectively. "),
                                # Input to select variable to map
                                selectInput('Weights', label = 'weight', choices = 
                                                list("Obese" = 'Obese', 'Overweight' = 'Overweight', 
                                                     'Obese and Overweight' = 'Obese.and.Overweight'))
                            ),
                            
                            # Main panel: display leaflet map
                            mainPanel(
                                leafletOutput('BuildMap')
                            )
                    )
        ),
        tabPanel('Scatterplot',
            # creating a title for the tab
            headerPanel('Number of Obese and Overweight Students in New York by County'),
            sidebarPanel(
             # adding help text to help people understand the plot
             helpText("Select a County in New York to display the number of Obese and Overweight Students
                    in the county selected. The colors of the scatter points represent the grade category 
                    (including the district total). Hover over a scatter point to discover what school 
                    district or area the students are from and the exact number of students overweight and obese 
                    in that specific school."),
            # creating a divider
              hr(),
            # creating a drop down to choose the county to display on the plot
            selectInput("countyname", label = 'County', choices = Student.Weight.1$COUNTY, selected = 'albany')
                        ),
            mainPanel(
            # setting the main panel for the scatter plot
            plotlyOutput('scatter')
                    )
               ),
    tabPanel('Bar Graph'
             
             #put code here#
             
             )
        )
    )
)
