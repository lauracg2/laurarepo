##CATCHMENT AREA MAP##
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data"
setwd(workdir)

catchments <- read.csv("GRDC US Stations for Research.csv", header = TRUE)
catchments <- data.frame(catchments$long, catchments$lat, catchments$area)
names(catchments)[names(catchments)=="catchments.long"] <- "long"
names(catchments)[names(catchments)=="catchments.lat"] <- "lat"
names(catchments)[names(catchments)=="catchments.area"] <- "area"

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) + xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = catchments, aes(x = long, y = lat, size = area), color="aquamarine3", alpha=0.5) +
  scale_size(range=c(0.1, 13), name=expression(paste("Catchment Area (km"^"2",")")))
show(p)  