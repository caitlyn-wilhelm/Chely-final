data <- read.csv("./Data/Student_Weight_Status_Category_Reporting_Results__Beginning_2010.csv")
library(dplyr)

#dataframe that contains regions
students.weights.county <- select(data, COUNTY, NO..OBESE, NO..OVERWEIGHT, PCT.OBESE, PCT.OVERWEIGHT, GRADE.LEVEL)
View(students.weights.county)
#same dataframe but without NA values
students.county.no.na <- na.omit(students.weights.county)
View(students.county.no.na)

#Dataframe that shows the average amount of obese students in each county.
mean.county.obese <- students.county.no.na %>%
  group_by(COUNTY) %>%
  summarise(avg.obese = mean(NO..OBESE, na.rm = TRUE)) %>%
  arrange(-avg.obese)

mean.county.overweight <- students.county.no.na %>%
  group_by(COUNTY) %>%
  summarise(avg.overweight = mean(NO..OVERWEIGHT, na.rm = TRUE)) %>%
  arrange(-avg.overweight)

#Dataframe that shows the county with the highest and lowest amount of obese students in each county.
high.county.obese <- students.county.no.na %>%
  group_by(COUNTY) %>%
  summarise(high.obese = max(NO..OBESE, na.rm = TRUE)) %>%
  arrange(-high.obese)

low.county.obese <- students.county.no.na %>%
  group_by(COUNTY) %>%
  summarise(low.obese = min(NO..OBESE, na.rm = TRUE)) %>%
  arrange(low.obese)

high.county.overweight <- students.county.no.na %>%
  group_by(COUNTY) %>%
  summarise(high.overweight = max(NO..OVERWEIGHT, na.rm = TRUE)) %>%
  arrange(-high.overweight)

#low and high amount of obese students by grade level
high.grade <- students.county.no.na %>%
  group_by(GRADE.LEVEL) %>%
  summarise(high.amount = max(NO..OBESE, na.rm = TRUE)) %>%
  arrange(-high.amount)
low.grade <- students.county.no.na %>%
  group_by(GRADE.LEVEL) %>%
  summarise(low.amount = min(NO..OBESE, na.rm = TRUE)) %>%
  arrange(low.amount)

high.grade.overweight <- students.county.no.na %>%
  group_by(GRADE.LEVEL) %>%
  summarise(high.weight = max(NO..OVERWEIGHT)) %>%
  arrange(-high.weight)
