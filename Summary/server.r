source("~/Chely-final/Summary/Summary Information.R")

shinyServer(function(input,output){
 
  output$table <- renderDataTable(mean.county.obese) 
  output$table2 <- renderDataTable(mean.county.overweight)
  output$table3 <- renderDataTable(high.county.obese)
  output$table4 <- renderDataTable(high.grade)
  output$table5 <- renderDataTable(high.grade.overweight)
  output$table6 <- renderDataTable(high.county.overweight)
  })