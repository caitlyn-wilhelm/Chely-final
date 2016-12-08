
library(dplyr)
library(leaflet)
library(rgdal)
library(maptools)
library(RColorBrewer)

#Read in data from csv in Data folder
data <- read.csv("./Data/Student_Weight_Status_Category_Reporting_Results__Beginning_2010.csv")

#modify data to fit for a map
#-----------------------------
#filter down to county wide district total values
data <- filter(data, grepl("[^N/A]", COUNTY), AREA.TYPE == "COUNTY", GRADE.LEVEL == "DISTRICT TOTAL")

#remove percentage signs from values
data$PCT.OVERWEIGHT <- as.numeric(sub("%", "", data$PCT.OVERWEIGHT))
data$PCT.OBESE <- as.numeric(sub("%", "", data$PCT.OBESE))
data$PCT.OVERWEIGHT.OR.OBESE <- as.numeric(sub("%", "", data$PCT.OVERWEIGHT.OR.OBESE))

#group and summarize data into a dataset with only useful information
data <- group_by(data, LOCATION.CODE) %>% 
  summarize(County = COUNTY[1], Region = REGION[1], No.Overweight = sum(NO..OVERWEIGHT),
            Pct.Overweight = mean(PCT.OVERWEIGHT), No.Obese = sum(NO..OBESE),
            Pct.Obese = mean(PCT.OBESE), No.Overweight.Or.Obese = sum(NO..OVERWEIGHT.OR.OBESE),
            Pct.Overweight.Or.Obese = mean(PCT.OVERWEIGHT.OR.OBESE))

#changed name of one county to fit with map data
data[40,2] <- "ST. LAWRENCE"
#----------------------------

# read in map data as a Spatial Polygons Data Frame
map.data <- readShapeSpatial("./Data/NY_Map/NY_counties_clip.shp")

#change county names to uppercase for merge
map.data$NAME <- toupper(map.data$NAME)

#merge map data with county data
combined.map.data <- merge(map.data, data, by.x = "NAME", by.y = "County")

BuildMap <- function(mapped.data) {

if(mapped.data == "Obese") {
  value <- combined.map.data$Pct.Obese
} else if(mapped.data == "Overweight") {
  value <- combined.map.data$Pct.Overweight
} else if(mapped.data == "Obese.and.Overweight") {
  value <- combined.map.data$Pct.Overweight.Or.Obese
}
  
#create map popups
names <- paste0(substr(combined.map.data$NAME, 0, 1), tolower(substr(combined.map.data$NAME, 2, 10000)))
county_popup <- paste0(names, " county", " with a",
                      "<br>student ", tolower(mapped.data), " rate of ", 
                      paste0(value,"%"))

#create color palette
pal <- colorNumeric(
  palette = rev(brewer.pal(10,"RdBu")),
  domain = value
)

#create map with legend
map <- leaflet(combined.map.data) %>%
  addPolygons(
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, fillColor = ~pal(value), popup = county_popup
  ) %>% 
  addLegend("bottomright", pal = pal, values = ~value,
              title = paste0("Students ", tolower(mapped.data), " (%)"),
              labFormat = labelFormat(suffix = "%"),
              opacity = 1
  )
  return(map)
}
