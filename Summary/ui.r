library(shiny)

shinyUI(fluidPage(
  titlePanel("Summary of the Obesity  in New York"),
  
  mainPanel(
    h1("Summary"),
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
  
))