rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)

#################################### 1986 ###########################################
Jan86 <- read.ascii.grid("comp_runoff_hd_198601.asc", return.header=FALSE, print = 0, 
                          nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan86 <- t(Jan86)
Jan86 <- Jan86[,order(ncol(Jan86):1)]
Jan86 <- Jan86 %>% dplyr::na_if(-88)

Feb86 <- read.ascii.grid("comp_runoff_hd_198602.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb86 <- t(Feb86)
Feb86 <- Feb86[,order(ncol(Feb86):1)]
Feb86 <- Feb86 %>% dplyr::na_if(-88)

Mar86 <- read.ascii.grid("comp_runoff_hd_198603.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar86 <- t(Mar86)
Mar86 <- Mar86[,order(ncol(Mar86):1)]
Mar86 <- Mar86 %>% dplyr::na_if(-88)

Apr86 <- read.ascii.grid("comp_runoff_hd_198604.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr86 <- t(Apr86)
Apr86 <- Apr86[,order(ncol(Apr86):1)]
Apr86 <- Apr86 %>% dplyr::na_if(-88)

May86 <- read.ascii.grid("comp_runoff_hd_198605.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May86 <- t(May86)
May86 <- May86[,order(ncol(May86):1)]
May86 <- May86 %>% dplyr::na_if(-88)

Jun86 <- read.ascii.grid("comp_runoff_hd_198606.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun86 <- t(Jun86)
Jun86 <- Jun86[,order(ncol(Jun86):1)]
Jun86 <- Jun86 %>% dplyr::na_if(-88)

Jul86 <- read.ascii.grid("comp_runoff_hd_198607.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul86 <- t(Jul86)
Jul86 <- Jul86[,order(ncol(Jul86):1)]

Aug86 <- read.ascii.grid("comp_runoff_hd_198608.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug86 <- t(Aug86)
Aug86 <- Aug86[,order(ncol(Aug86):1)]
Aug86 <- Aug86 %>% dplyr::na_if(-88)

Sep86 <- read.ascii.grid("comp_runoff_hd_198609.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep86 <- t(Sep86)
Sep86 <- Sep86[,order(ncol(Sep86):1)]
Sep86 <- Sep86 %>% dplyr::na_if(-88)

Oct86 <- read.ascii.grid("comp_runoff_hd_198610.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct86 <- t(Oct86)
Oct86 <- Oct86[,order(ncol(Oct86):1)]
Oct86 <- Oct86 %>% dplyr::na_if(-88)

Nov86 <- read.ascii.grid("comp_runoff_hd_198611.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov86 <- t(Nov86)
Nov86 <- Nov86[,order(ncol(Nov86):1)]
Nov86 <- Nov86 %>% dplyr::na_if(-88)

Dec86 <- read.ascii.grid("comp_runoff_hd_198612.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec86 <- t(Dec86)
Dec86 <- Dec86[,order(ncol(Dec86):1)]
Dec86 <- Dec86 %>% dplyr::na_if(-88)

Mean1986 <- ((Jan86 + Feb86 + Mar86 + Apr86 + Jun86 + Jul86 + Aug86 + Sep86 + Oct86 + Nov86 + Dec86)/12)
urban_runoff_vector <- as.vector(Mean1986)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1987 ###########################################
Jan87 <- read.ascii.grid("comp_runoff_hd_198701.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan87 <- Jan87 %>% dplyr::na_if(-88)
Feb87 <- read.ascii.grid("comp_runoff_hd_198702.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb87 <- Feb87 %>% dplyr::na_if(-88)
Mar87 <- read.ascii.grid("comp_runoff_hd_198703.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar87 <- Mar87 %>% dplyr::na_if(-88)
Apr87 <- read.ascii.grid("comp_runoff_hd_198704.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr87 <- Apr87 %>% dplyr::na_if(-88)
May87 <- read.ascii.grid("comp_runoff_hd_198705.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May87 <- May87 %>% dplyr::na_if(-88)
Jun87 <- read.ascii.grid("comp_runoff_hd_198706.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun87 <- Jun87 %>% dplyr::na_if(-88)
Jul87 <- read.ascii.grid("comp_runoff_hd_198707.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul87 <- Jul87 %>% dplyr::na_if(-88)
Aug87 <- read.ascii.grid("comp_runoff_hd_198708.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug87 <- Aug87 %>% dplyr::na_if(-88)
Sep87 <- read.ascii.grid("comp_runoff_hd_198709.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep87 <- Sep87 %>% dplyr::na_if(-88)
Oct87 <- read.ascii.grid("comp_runoff_hd_198710.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct87 <- Oct87 %>% dplyr::na_if(-88)
Nov87 <- read.ascii.grid("comp_runoff_hd_198711.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov87 <- Nov87 %>% dplyr::na_if(-88)
Dec87 <- read.ascii.grid("comp_runoff_hd_198712.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec87 <- Dec87 %>% dplyr::na_if(-88)
Mean1987 <- ((Jan87 + Feb87 + Mar87 + Apr87 + Jun87 + Jul87 + Aug87 + Sep87 + Oct87 + Nov87 + Dec87)/12)
Mean1987 <- t(Mean1987)
Mean1987 <- Mean1987[,order(ncol(Mean1987):1)]
urban_runoff_vector <- as.vector(Mean1987)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1987 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1988 ###########################################
Jan88 <- read.ascii.grid("comp_runoff_hd_198801.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan88 <- Jan88 %>% dplyr::na_if(-88)
Feb88 <- read.ascii.grid("comp_runoff_hd_198802.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb88 <- Feb88 %>% dplyr::na_if(-88)
Mar88 <- read.ascii.grid("comp_runoff_hd_198803.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar88 <- Mar88 %>% dplyr::na_if(-88)
Apr88 <- read.ascii.grid("comp_runoff_hd_198804.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr88 <- Apr88 %>% dplyr::na_if(-88)
May88 <- read.ascii.grid("comp_runoff_hd_198805.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May88 <- May88 %>% dplyr::na_if(-88)
Jun88 <- read.ascii.grid("comp_runoff_hd_198806.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun88 <- Jun88 %>% dplyr::na_if(-88)
Jul88 <- read.ascii.grid("comp_runoff_hd_198807.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul88 <- Jul88 %>% dplyr::na_if(-88)
Aug88 <- read.ascii.grid("comp_runoff_hd_198808.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug88 <- Aug88 %>% dplyr::na_if(-88)
Sep88 <- read.ascii.grid("comp_runoff_hd_198809.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep88 <- Sep88 %>% dplyr::na_if(-88)
Oct88 <- read.ascii.grid("comp_runoff_hd_198810.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct88 <- Oct88 %>% dplyr::na_if(-88)
Nov88 <- read.ascii.grid("comp_runoff_hd_198811.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov88 <- Nov88 %>% dplyr::na_if(-88)
Dec88 <- read.ascii.grid("comp_runoff_hd_198812.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec88 <- Dec88 %>% dplyr::na_if(-88)
Mean1988 <- ((Jan88 + Feb88 + Mar88 + Apr88 + Jun88 + Jul88 + Aug88 + Sep88 + Oct88 + Nov88 + Dec88)/12)
Mean1988 <- t(Mean1988)
Mean1988 <- Mean1988[,order(ncol(Mean1988):1)]
urban_runoff_vector <- as.vector(Mean1988)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1988 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1989 ###########################################
Jan89 <- read.ascii.grid("comp_runoff_hd_198901.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan89 <- Jan89 %>% dplyr::na_if(-88)
Feb89 <- read.ascii.grid("comp_runoff_hd_198902.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb89 <- Feb89 %>% dplyr::na_if(-88)
Mar89 <- read.ascii.grid("comp_runoff_hd_198903.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar89 <- Mar89 %>% dplyr::na_if(-88)
Apr89 <- read.ascii.grid("comp_runoff_hd_198904.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr89 <- Apr89 %>% dplyr::na_if(-88)
May89 <- read.ascii.grid("comp_runoff_hd_198905.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May89 <- May89 %>% dplyr::na_if(-88)
Jun89 <- read.ascii.grid("comp_runoff_hd_198906.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun89 <- Jun89 %>% dplyr::na_if(-88)
Jul89 <- read.ascii.grid("comp_runoff_hd_198907.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul89 <- Jul89 %>% dplyr::na_if(-88)
Aug89 <- read.ascii.grid("comp_runoff_hd_198908.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug89 <- Aug89 %>% dplyr::na_if(-88)
Sep89 <- read.ascii.grid("comp_runoff_hd_198909.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep89 <- Sep89 %>% dplyr::na_if(-88)
Oct89 <- read.ascii.grid("comp_runoff_hd_198910.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct89 <- Oct89 %>% dplyr::na_if(-88)
Nov89 <- read.ascii.grid("comp_runoff_hd_198911.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov89 <- Nov89 %>% dplyr::na_if(-88)
Dec89 <- read.ascii.grid("comp_runoff_hd_198912.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec89 <- Dec89 %>% dplyr::na_if(-88)
Mean1989 <- ((Jan89 + Feb89 + Mar89 + Apr89 + Jun89 + Jul89 + Aug89 + Sep89 + Oct89 + Nov89 + Dec89)/12)
Mean1989 <- t(Mean1989)
Mean1989 <- Mean1989[,order(ncol(Mean1989):1)]
urban_runoff_vector <- as.vector(Mean1989)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1989 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1990 ###########################################
Jan90 <- read.ascii.grid("comp_runoff_hd_199001.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan90 <- Jan90 %>% dplyr::na_if(-88)
Feb90 <- read.ascii.grid("comp_runoff_hd_199002.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb90 <- Feb90 %>% dplyr::na_if(-88)
Mar90 <- read.ascii.grid("comp_runoff_hd_199003.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar90 <- Mar90 %>% dplyr::na_if(-88)
Apr90 <- read.ascii.grid("comp_runoff_hd_199004.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr90 <- Apr90 %>% dplyr::na_if(-88)
May90 <- read.ascii.grid("comp_runoff_hd_199005.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May90 <- May90 %>% dplyr::na_if(-88)
Jun90 <- read.ascii.grid("comp_runoff_hd_199006.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun90 <- Jun90 %>% dplyr::na_if(-88)
Jul90 <- read.ascii.grid("comp_runoff_hd_199007.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul90 <- Jul90 %>% dplyr::na_if(-88)
Aug90 <- read.ascii.grid("comp_runoff_hd_199008.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug90 <- Aug90 %>% dplyr::na_if(-88)
Sep90 <- read.ascii.grid("comp_runoff_hd_199009.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep90 <- Sep90 %>% dplyr::na_if(-88)
Oct90 <- read.ascii.grid("comp_runoff_hd_199010.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct90 <- Oct90 %>% dplyr::na_if(-88)
Nov90 <- read.ascii.grid("comp_runoff_hd_199011.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov90 <- Nov90 %>% dplyr::na_if(-88)
Dec90 <- read.ascii.grid("comp_runoff_hd_199012.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec90 <- Dec90 %>% dplyr::na_if(-88)
Mean1990 <- ((Jan90 + Feb90 + Mar90 + Apr90 + Jun90 + Jul90 + Aug90 + Sep90 + Oct90 + Nov90 + Dec90)/12)
Mean1990 <- t(Mean1990)
Mean1990 <- Mean1990[,order(ncol(Mean1990):1)]
urban_runoff_vector <- as.vector(Mean1990)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1990 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


#################################### 1991 ###########################################
Jan91 <- read.ascii.grid("comp_runoff_hd_199101.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan91 <- Jan91 %>% dplyr::na_if(-88)
Feb91 <- read.ascii.grid("comp_runoff_hd_199102.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb91 <- Feb91 %>% dplyr::na_if(-88)
Mar91 <- read.ascii.grid("comp_runoff_hd_199103.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar91 <- Mar91 %>% dplyr::na_if(-88)
Apr91 <- read.ascii.grid("comp_runoff_hd_199104.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr91 <- Apr91 %>% dplyr::na_if(-88)
May91 <- read.ascii.grid("comp_runoff_hd_199105.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May91 <- May91 %>% dplyr::na_if(-88)
Jun91 <- read.ascii.grid("comp_runoff_hd_199106.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun91 <- Jun91 %>% dplyr::na_if(-88)
Jul91 <- read.ascii.grid("comp_runoff_hd_199107.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul91 <- Jul91 %>% dplyr::na_if(-88)
Aug91 <- read.ascii.grid("comp_runoff_hd_199108.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug91 <- Aug91 %>% dplyr::na_if(-88)
Sep91 <- read.ascii.grid("comp_runoff_hd_199109.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep91 <- Sep91 %>% dplyr::na_if(-88)
Oct91 <- read.ascii.grid("comp_runoff_hd_199110.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct91 <- Oct91 %>% dplyr::na_if(-88)
Nov91 <- read.ascii.grid("comp_runoff_hd_199111.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov91 <- Nov91 %>% dplyr::na_if(-88)
Dec91 <- read.ascii.grid("comp_runoff_hd_199112.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec91 <- Dec91 %>% dplyr::na_if(-88)
Mean1991 <- ((Jan91 + Feb91 + Mar91 + Apr91 + Jun91 + Jul91 + Aug91 + Sep91 + Oct91 + Nov91 + Dec91)/12)
Mean1991 <- t(Mean1991)
Mean1991 <- Mean1991[,order(ncol(Mean1991):1)]
Mean1991 <- Mean1991 %>% dplyr::na_if(-88)
urban_runoff_vector <- as.vector(Mean1991)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1991 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1992 ###########################################
Jan92 <- read.ascii.grid("comp_runoff_hd_199201.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan92 <- Jan92 %>% dplyr::na_if(-88)
Feb92 <- read.ascii.grid("comp_runoff_hd_199202.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb92 <- Feb92 %>% dplyr::na_if(-88)
Mar92 <- read.ascii.grid("comp_runoff_hd_199203.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar92 <- Mar92 %>% dplyr::na_if(-88)
Apr92 <- read.ascii.grid("comp_runoff_hd_199204.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr92 <- Apr92 %>% dplyr::na_if(-88)
May92 <- read.ascii.grid("comp_runoff_hd_199205.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May92 <- May92 %>% dplyr::na_if(-88)
Jun92 <- read.ascii.grid("comp_runoff_hd_199206.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun92 <- Jun92 %>% dplyr::na_if(-88)
Jul92 <- read.ascii.grid("comp_runoff_hd_199207.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul92 <- Jul92 %>% dplyr::na_if(-88)
Aug92 <- read.ascii.grid("comp_runoff_hd_199208.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug92 <- Aug92 %>% dplyr::na_if(-88)
Sep92 <- read.ascii.grid("comp_runoff_hd_199209.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep92 <- Sep92 %>% dplyr::na_if(-88)
Oct92 <- read.ascii.grid("comp_runoff_hd_199210.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct92 <- Oct92 %>% dplyr::na_if(-88)
Nov92 <- read.ascii.grid("comp_runoff_hd_199211.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov92 <- Nov92 %>% dplyr::na_if(-88)
Dec92 <- read.ascii.grid("comp_runoff_hd_199212.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec92 <- Dec92 %>% dplyr::na_if(-88)
Mean1992 <- ((Jan92 + Feb92 + Mar92 + Apr92 + Jun92 + Jul92 + Aug92 + Sep92 + Oct92 + Nov92 + Dec92)/12)
Mean1992 <- t(Mean1992)
Mean1992 <- Mean1992[,order(ncol(Mean1992):1)]
urban_runoff_vector <- as.vector(Mean1992)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1992 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


#################################### 1993 ###########################################
Jan93 <- read.ascii.grid("comp_runoff_hd_199301.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan93 <- Jan93 %>% dplyr::na_if(-88)
Feb93 <- read.ascii.grid("comp_runoff_hd_199302.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb93 <- Feb93 %>% dplyr::na_if(-88)
Mar93 <- read.ascii.grid("comp_runoff_hd_199303.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar93 <- Mar93 %>% dplyr::na_if(-88)
Apr93 <- read.ascii.grid("comp_runoff_hd_199304.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr93 <- Apr93 %>% dplyr::na_if(-88)
May93 <- read.ascii.grid("comp_runoff_hd_199305.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May93 <- May93 %>% dplyr::na_if(-88)
Jun93 <- read.ascii.grid("comp_runoff_hd_199306.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun93 <- Jun93 %>% dplyr::na_if(-88)
Jul93 <- read.ascii.grid("comp_runoff_hd_199307.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul93 <- Jul93 %>% dplyr::na_if(-88)
Aug93 <- read.ascii.grid("comp_runoff_hd_199308.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug93 <- Aug93 %>% dplyr::na_if(-88)
Sep93 <- read.ascii.grid("comp_runoff_hd_199309.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep93 <- Sep93 %>% dplyr::na_if(-88)
Oct93 <- read.ascii.grid("comp_runoff_hd_199310.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct93 <- Oct93 %>% dplyr::na_if(-88)
Nov93 <- read.ascii.grid("comp_runoff_hd_199311.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov93 <- Nov93 %>% dplyr::na_if(-88)
Dec93 <- read.ascii.grid("comp_runoff_hd_199312.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec93 <- Dec93 %>% dplyr::na_if(-88)
Mean1993 <- ((Jan93 + Feb93 + Mar93 + Apr93 + Jun93 + Jul93 + Aug93 + Sep93 + Oct93 + Nov93 + Dec93)/12)
Mean1993 <- t(Mean1993)
Mean1993 <- Mean1993[,order(ncol(Mean1993):1)]
urban_runoff_vector <- as.vector(Mean1993)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1993 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1994 ###########################################
Jan94 <- read.ascii.grid("comp_runoff_hd_199401.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan94 <- Jan94 %>% dplyr::na_if(-88)
Feb94 <- read.ascii.grid("comp_runoff_hd_199402.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb94 <- Feb94 %>% dplyr::na_if(-88)
Mar94 <- read.ascii.grid("comp_runoff_hd_199403.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar94 <- Mar94 %>% dplyr::na_if(-88)
Apr94 <- read.ascii.grid("comp_runoff_hd_199404.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr94 <- Apr94 %>% dplyr::na_if(-88)
May94 <- read.ascii.grid("comp_runoff_hd_199405.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May94 <- May94 %>% dplyr::na_if(-88)
Jun94 <- read.ascii.grid("comp_runoff_hd_199406.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun94 <- Jun94 %>% dplyr::na_if(-88)
Jul94 <- read.ascii.grid("comp_runoff_hd_199407.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul94 <- Jul94 %>% dplyr::na_if(-88)
Aug94 <- read.ascii.grid("comp_runoff_hd_199408.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug94 <- Aug94 %>% dplyr::na_if(-88)
Sep94 <- read.ascii.grid("comp_runoff_hd_199409.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep94 <- Sep94 %>% dplyr::na_if(-88)
Oct94 <- read.ascii.grid("comp_runoff_hd_199410.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct94 <- Oct94 %>% dplyr::na_if(-88)
Nov94 <- read.ascii.grid("comp_runoff_hd_199411.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov94 <- Nov94 %>% dplyr::na_if(-88)
Dec94 <- read.ascii.grid("comp_runoff_hd_199312.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec94 <- Dec94 %>% dplyr::na_if(-88)
Mean1994 <- ((Jan94 + Feb94 + Mar94 + Apr94 + Jun94 + Jul94 + Aug94 + Sep94 + Oct94 + Nov94 + Dec94)/12)
Mean1994 <- t(Mean1994)
Mean1994 <- Mean1994[,order(ncol(Mean1994):1)]
urban_runoff_vector <- as.vector(Mean1994)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1994 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#################################### 1995 ###########################################
Jan95 <- read.ascii.grid("comp_runoff_hd_199401.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan95 <- Jan95 %>% dplyr::na_if(-88)
Feb95 <- read.ascii.grid("comp_runoff_hd_199402.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb95 <- Feb95 %>% dplyr::na_if(-88)
Mar95 <- read.ascii.grid("comp_runoff_hd_199403.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar95 <- Mar95 %>% dplyr::na_if(-88)
Apr95 <- read.ascii.grid("comp_runoff_hd_199404.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr95 <- Apr95 %>% dplyr::na_if(-88)
May95 <- read.ascii.grid("comp_runoff_hd_199405.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May95 <- May95 %>% dplyr::na_if(-88)
Jun95 <- read.ascii.grid("comp_runoff_hd_199406.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun95 <- Jun95 %>% dplyr::na_if(-88)
Jul95 <- read.ascii.grid("comp_runoff_hd_199407.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul95 <- Jul95 %>% dplyr::na_if(-88)
Aug95 <- read.ascii.grid("comp_runoff_hd_199408.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug95 <- Aug95 %>% dplyr::na_if(-88)
Sep95 <- read.ascii.grid("comp_runoff_hd_199409.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep95 <- Sep95 %>% dplyr::na_if(-88)
Oct95 <- read.ascii.grid("comp_runoff_hd_199410.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct95 <- Oct95 %>% dplyr::na_if(-88)
Nov95 <- read.ascii.grid("comp_runoff_hd_199411.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov95 <- Nov95 %>% dplyr::na_if(-88)
Dec95 <- read.ascii.grid("comp_runoff_hd_199312.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec95 <- Dec95 %>% dplyr::na_if(-88)
Mean1995 <- ((Jan95 + Feb95 + Mar95 + Apr95 + Jun95 + Jul95 + Aug95 + Sep95 + Oct95 + Nov95 + Dec95)/12)
Mean1995 <- t(Mean1995)
Mean1995 <- Mean1995[,order(ncol(Mean1994):1)]
urban_runoff_vector <- as.vector(Mean1995)

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
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)







########################## 10 Year Mean ####################################
Mean10YR <- ((Mean1986 + Mean1987 + Mean1988 + Mean1989 + Mean1990 + Mean1991 +
  Mean1992 + Mean1993 + Mean1994 + Mean1995)/10)

urban_runoff_vector <- as.vector(Mean10YR)

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
  scale_color_distiller(name = expression(paste("Composite Monthly Mean Runoff from 1986 to 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################# Data Aggregation #######################################
GRDC<-Mean10YR
GRDC_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(urban_lat[-i]-dLatCESM/2,urban_lat[i]+dLatCESM/2)
  edgeLon<-c(urban_lon[i]-dLonCESM/2,urban_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDC_agg[i]<-mean(GRDC[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDC_agg)
GRDC_agg[GRDCflag]<-NA
