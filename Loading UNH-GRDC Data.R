########################### 1 Degree Data ##################################################
rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_1deg"
setwd(workdir)
mydata0 <- read.ascii.grid("comp_runoff_1d_198601.asc", return.header=TRUE, print = 0, 
                nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- read.ascii.grid("comp_runoff_1d_198601.asc", return.header=FALSE, print = 0, 
                nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- t(mydata)
mydata <- mydata[,order(ncol(mydata):1)]
urban_runoff_vector <- as.vector(mydata)

#lon
lon <- seq(-179.5, 179.5, 1)
lon2D <- kronecker(matrix(1, 1, 180), lon)

#lat
lat <- seq(-89.5, 89.5, 1)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 360, 1), lat)

flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(urban_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = urban_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for Jan 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


########################### 0.5 Degree Data ##################################################
rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
mydata0 <- read.ascii.grid("comp_runoff_hd_198601.asc", return.header=TRUE, print = 0, 
                           nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- read.ascii.grid("comp_runoff_hd_198601.asc", return.header=FALSE, print = 0, 
                          nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- t(mydata)
mydata <- mydata[,order(ncol(mydata):1)]
urban_runoff_vector <- as.vector(mydata)

#lon
lon <- seq(-179.75, 179.75, 0.5)
lon2D <- kronecker(matrix(1, 1, 360), lon)

#lat
lat <- seq(-89.75, 89.75, 0.5)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 720, 1), lat)

flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 600)
labels = c("0","100", "200", "300", "400", "500", "600")
breaks = c(0, 100, 200, 300, 400, 500, 600)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(urban_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = urban_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for Jan 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)



