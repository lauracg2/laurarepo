## MERRA Diurnal Data Jan 1986 ##
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
library(ncdf4)

#get the file
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198601.SUB.nc")
#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 361), lon)
#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 576, 1), lat)
#runoff
total_runoff_array <- ncvar_get(fi, "RUNOFF")
total_runoff_array <- total_runoff_array*3600*24*31
total_runoff_vector <- as.vector(total_runoff_array)

# mask out non--urban
flag_na <- is.na(total_runoff_vector)
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
  geom_point(data = as.data.frame(total_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = total_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Overland Runoff from MERRA-2 Jan 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

## MERRA Diurnal Data Jan 1986, Diff File##
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
library(ncdf4)

#get the file
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
fi <- nc_open("MERRA100.prod.assim.tavgM_2d_lnd_Nx.198601.SUB.nc")
#lon
lon <- ncvar_get(fi, "XDim:EOSGRID")
lon2D <- kronecker(matrix(1, 1, 361), lon)
#lat
lat <- ncvar_get(fi, "YDim:EOSGRID", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 540, 1), lat)
#runoff
total_runoff_array <- ncvar_get(fi, "RUNOFF")
total_runoff_array <- total_runoff_array*3600*24*31
total_runoff_vector <- as.vector(total_runoff_array)

# mask out non--urban
flag_na <- is.na(total_runoff_vector)
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
  geom_point(data = as.data.frame(total_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = total_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Overland Runoff from MERRA-2 Jan 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

## MERRA Diurnal Data Jan 1986, Another Diff File ##
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
library(ncdf4)

#get the file
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
fi <- nc_open("MERRA100.prod.simul.tavgM_2d_mld_Nx.198601.SUB.nc")
#lon
lon <- ncvar_get(fi, "XDim:EOSGRID")
lon2D <- kronecker(matrix(1, 1, 361), lon)
#lat
lat <- ncvar_get(fi, "YDim:EOSGRID", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 540, 1), lat)
#runoff
total_runoff_array <- ncvar_get(fi, "RUNOFF")
total_runoff_array <- total_runoff_array*3600*24*31
total_runoff_vector <- as.vector(total_runoff_array)

# mask out non--urban
flag_na <- is.na(total_runoff_vector)
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
  geom_point(data = as.data.frame(total_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = total_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Overland Runoff from MERRA-2 Jan 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

