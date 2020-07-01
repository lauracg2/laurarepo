########################## Urban Runoff Data Jan 1986 ##############################
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)
#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
surface_runoff_array <- surface_runoff_array[, , 1633]
surface_runoff_vector <- as.vector(surface_runoff_array)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 0.0001)
labels = c("0","0.000025", "0.000050", "0.000075", "0.0001")
breaks = c(0, 0.0000125, 0.000025, 0.0000375, 0.00005)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for January 1986 (mm/s)",sep="")),
    palette = "Spectral",
    limits = limits,
    labels = labels,
    breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)
