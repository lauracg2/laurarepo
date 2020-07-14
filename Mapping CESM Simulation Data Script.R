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
    palette = "Spectral")
    #limits = limits,
    #labels = labels,
    #breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data Jan 1986 in mm/month ##############################
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
surface_runoff_array <- surface_runoff_array*3600*24*31
surface_runoff_vector <- as.vector(surface_runoff_array)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for January 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#1.25 deg by ~1 deg

########################## Urban Runoff Data 1986 in mm/month ##############################
rm(list = ls(all=TRUE))
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan86 <- surface_runoff_array[, , 1633]
Jan86 <- Jan86*3600*24*31
Feb86 <- surface_runoff_array[, , 1634]
Feb86 <- Feb86*3600*24*28
Mar86 <- surface_runoff_array[, , 1635]
Mar86 <- Mar86*3600*24*31
Apr86 <- surface_runoff_array[, , 1636]
Apr86 <- Apr86*3600*24*30
May86 <- surface_runoff_array[, , 1637]
May86 <- May86*3600*24*31
Jun86 <- surface_runoff_array[, , 1638]
Jun86 <- Jun86*3600*24*30
Jul86 <- surface_runoff_array[, , 1639]
Jul86 <- Jul86*3600*24*31
Aug86 <- surface_runoff_array[, , 1640]
Aug86 <- Aug86*3600*24*31
Sep86 <- surface_runoff_array[, , 1641]
Sep86 <- Sep86*3600*24*30
Oct86 <- surface_runoff_array[, , 1642]
Oct86 <- Oct86*3600*24*31
Nov86 <- surface_runoff_array[, , 1643]
Nov86 <- Nov86*3600*24*30
Dec86 <- surface_runoff_array[, , 1644]
Dec86 <- Dec86*3600*24*31
Mean1986 <- ((Jan86 + Feb86 + Mar86 + Apr86 + Jun86 + Jul86 + Aug86 + Sep86 + Oct86 + Nov86 + Dec86)/12)
surface_runoff_vector <- as.vector(Mean1986)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


########################## Urban Runoff Data 1987 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan87 <- surface_runoff_array[, , 1645]
Jan87 <- Jan87*3600*24*31
Feb87 <- surface_runoff_array[, , 1646]
Feb87 <- Feb87*3600*24*28
Mar87 <- surface_runoff_array[, , 1647]
Mar87 <- Mar87*3600*24*31
Apr87 <- surface_runoff_array[, , 1648]
Apr87 <- Apr87*3600*24*30
May87 <- surface_runoff_array[, , 1649]
May87 <- May87*3600*24*31
Jun87 <- surface_runoff_array[, , 1650]
Jun87 <- Jun87*3600*24*30
Jul87 <- surface_runoff_array[, , 1651]
Jul87 <- Jul87*3600*24*31
Aug87 <- surface_runoff_array[, , 1652]
Aug87 <- Aug87*3600*24*31
Sep87 <- surface_runoff_array[, , 1653]
Sep87 <- Sep87*3600*24*30
Oct87 <- surface_runoff_array[, , 1654]
Oct87 <- Oct87*3600*24*31
Nov87 <- surface_runoff_array[, , 1655]
Nov87 <- Nov87*3600*24*30
Dec87 <- surface_runoff_array[, , 1656]
Dec87 <- Dec87*3600*24*31
Mean1987 <- ((Jan87 + Feb87 + Mar87 + Apr87 + Jun87 + Jul87 + Aug87 + Sep87 + Oct87 + Nov87 + Dec87)/12)
surface_runoff_vector <- as.vector(Mean1987)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1987 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1988 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan88 <- surface_runoff_array[, , 1657]
Jan88 <- Jan88*3600*24*31
Feb88 <- surface_runoff_array[, , 1658]
Feb88 <- Feb88*3600*24*29
Mar88 <- surface_runoff_array[, , 1659]
Mar88 <- Mar88*3600*24*31
Apr88 <- surface_runoff_array[, , 1660]
Apr88 <- Apr88*3600*24*30
May88 <- surface_runoff_array[, , 1661]
May88 <- May88*3600*24*31
Jun88 <- surface_runoff_array[, , 1662]
Jun88 <- Jun88*3600*24*30
Jul88 <- surface_runoff_array[, , 1663]
Jul88 <- Jul88*3600*24*31
Aug88 <- surface_runoff_array[, , 1664]
Aug88 <- Aug88*3600*24*31
Sep88 <- surface_runoff_array[, , 1665]
Sep88 <- Sep88*3600*24*30
Oct88 <- surface_runoff_array[, , 1666]
Oct88 <- Oct88*3600*24*31
Nov88 <- surface_runoff_array[, , 1667]
Nov88 <- Nov88*3600*24*30
Dec88 <- surface_runoff_array[, , 1668]
Dec88 <- Dec88*3600*24*31
Mean1988 <- ((Jan88 + Feb88 + Mar88 + Apr88 + Jun88 + Jul88 + Aug88 + Sep88 + Oct88 + Nov88 + Dec88)/12)
surface_runoff_vector <- as.vector(Mean1988)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1988 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1989 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan89 <- surface_runoff_array[, , 1669]
Jan89 <- Jan89*3600*24*31
Feb89 <- surface_runoff_array[, , 1670]
Feb89 <- Feb89*3600*24*28
Mar89 <- surface_runoff_array[, , 1671]
Mar89 <- Mar89*3600*24*31
Apr89 <- surface_runoff_array[, , 1672]
Apr89 <- Apr89*3600*24*30
May89 <- surface_runoff_array[, , 1673]
May89 <- May89*3600*24*31
Jun89 <- surface_runoff_array[, , 1674]
Jun89 <- Jun89*3600*24*30
Jul89 <- surface_runoff_array[, , 1675]
Jul89 <- Jul89*3600*24*31
Aug89 <- surface_runoff_array[, , 1676]
Aug89 <- Aug89*3600*24*31
Sep89 <- surface_runoff_array[, , 1677]
Sep89 <- Sep89*3600*24*30
Oct89 <- surface_runoff_array[, , 1678]
Oct89 <- Oct89*3600*24*31
Nov89 <- surface_runoff_array[, , 1679]
Nov89 <- Nov89*3600*24*30
Dec89 <- surface_runoff_array[, , 1680]
Dec89 <- Dec89*3600*24*31
Mean1989 <- ((Jan89 + Feb89 + Mar89 + Apr89 + Jun89 + Jul89 + Aug89 + Sep89 + Oct89 + Nov89 + Dec89)/12)
surface_runoff_vector <- as.vector(Mean1989)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1989 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1990 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan90 <- surface_runoff_array[, , 1681]
Jan90 <- Jan90*3600*24*31
Feb90 <- surface_runoff_array[, , 1682]
Feb90 <- Feb90*3600*24*28
Mar90 <- surface_runoff_array[, , 1683]
Mar90 <- Mar90*3600*24*31
Apr90 <- surface_runoff_array[, , 1684]
Apr90 <- Apr90*3600*24*30
May90 <- surface_runoff_array[, , 1685]
May90 <- May90*3600*24*31
Jun90 <- surface_runoff_array[, , 1686]
Jun90 <- Jun90*3600*24*30
Jul90 <- surface_runoff_array[, , 1687]
Jul90 <- Jul90*3600*24*31
Aug90 <- surface_runoff_array[, , 1688]
Aug90 <- Aug90*3600*24*31
Sep90 <- surface_runoff_array[, , 1689]
Sep90 <- Sep90*3600*24*30
Oct90 <- surface_runoff_array[, , 1690]
Oct90 <- Oct90*3600*24*31
Nov90 <- surface_runoff_array[, , 1691]
Nov90 <- Nov90*3600*24*30
Dec90 <- surface_runoff_array[, , 1692]
Dec90 <- Dec90*3600*24*31
Mean1990 <- ((Jan90 + Feb90 + Mar90 + Apr90 + Jun90 + Jul90 + Aug90 + Sep90 + Oct90 + Nov90 + Dec90)/12)
surface_runoff_vector <- as.vector(Mean1990)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1990 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1991 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan91 <- surface_runoff_array[, , 1693]
Jan91 <- Jan91*3600*24*31
Feb91 <- surface_runoff_array[, , 1694]
Feb91 <- Feb91*3600*24*28
Mar91 <- surface_runoff_array[, , 1695]
Mar91 <- Mar91*3600*24*31
Apr91 <- surface_runoff_array[, , 1696]
Apr91 <- Apr91*3600*24*30
May91 <- surface_runoff_array[, , 1697]
May91 <- May91*3600*24*31
Jun91 <- surface_runoff_array[, , 1698]
Jun91 <- Jun91*3600*24*30
Jul91 <- surface_runoff_array[, , 1699]
Jul91 <- Jul91*3600*24*31
Aug91 <- surface_runoff_array[, , 1700]
Aug91 <- Aug91*3600*24*31
Sep91 <- surface_runoff_array[, , 1701]
Sep91 <- Sep91*3600*24*30
Oct91 <- surface_runoff_array[, , 1702]
Oct91 <- Oct91*3600*24*31
Nov91 <- surface_runoff_array[, , 1703]
Nov91 <- Nov91*3600*24*30
Dec91 <- surface_runoff_array[, , 1704]
Dec91 <- Dec91*3600*24*31
Mean1991 <- ((Jan91 + Feb91 + Mar91 + Apr91 + Jun91 + Jul91 + Aug91 + Sep91 + Oct91 + Nov91 + Dec91)/12)
surface_runoff_vector <- as.vector(Mean1991)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1991 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1992 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan92 <- surface_runoff_array[, , 1705]
Jan92 <- Jan92*3600*24*31
Feb92 <- surface_runoff_array[, , 1706]
Feb92 <- Feb92*3600*24*29
Mar92 <- surface_runoff_array[, , 1707]
Mar92 <- Mar92*3600*24*31
Apr92 <- surface_runoff_array[, , 1708]
Apr92 <- Apr92*3600*24*30
May92 <- surface_runoff_array[, , 1709]
May92 <- May92*3600*24*31
Jun92 <- surface_runoff_array[, , 1710]
Jun92 <- Jun92*3600*24*30
Jul92 <- surface_runoff_array[, , 1711]
Jul92 <- Jul92*3600*24*31
Aug92 <- surface_runoff_array[, , 1712]
Aug92 <- Aug92*3600*24*31
Sep92 <- surface_runoff_array[, , 1713]
Sep92 <- Sep92*3600*24*30
Oct92 <- surface_runoff_array[, , 1714]
Oct92 <- Oct92*3600*24*31
Nov92 <- surface_runoff_array[, , 1715]
Nov92 <- Nov92*3600*24*30
Dec92 <- surface_runoff_array[, , 1716]
Dec92 <- Dec92*3600*24*31
Mean1992 <- ((Jan92 + Feb92 + Mar92 + Apr92 + Jun92 + Jul92 + Aug92 + Sep92 + Oct92 + Nov92 + Dec92)/12)
surface_runoff_vector <- as.vector(Mean1992)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1992 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1993 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan93 <- surface_runoff_array[, , 1717]
Jan93 <- Jan93*3600*24*31
Feb93 <- surface_runoff_array[, , 1718]
Feb93 <- Feb93*3600*24*28
Mar93 <- surface_runoff_array[, , 1719]
Mar93 <- Mar93*3600*24*31
Apr93 <- surface_runoff_array[, , 1720]
Apr93 <- Apr93*3600*24*30
May93 <- surface_runoff_array[, , 1721]
May93 <- May93*3600*24*31
Jun93 <- surface_runoff_array[, , 1722]
Jun93 <- Jun93*3600*24*30
Jul93 <- surface_runoff_array[, , 1723]
Jul93 <- Jul93*3600*24*31
Aug93 <- surface_runoff_array[, , 1724]
Aug93 <- Aug93*3600*24*31
Sep93 <- surface_runoff_array[, , 1725]
Sep93 <- Sep93*3600*24*30
Oct93 <- surface_runoff_array[, , 1726]
Oct93 <- Oct93*3600*24*31
Nov93 <- surface_runoff_array[, , 1727]
Nov93 <- Nov93*3600*24*30
Dec93 <- surface_runoff_array[, , 1728]
Dec93 <- Dec93*3600*24*31
Mean1993 <- ((Jan93 + Feb93 + Mar93 + Apr93 + Jun93 + Jul93 + Aug93 + Sep93 + Oct93 + Nov93 + Dec93)/12)
surface_runoff_vector <- as.vector(Mean1993)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1993 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1994 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan94 <- surface_runoff_array[, , 1729]
Jan94 <- Jan94*3600*24*31
Feb94 <- surface_runoff_array[, , 1730]
Feb94 <- Feb94*3600*24*28
Mar94 <- surface_runoff_array[, , 1731]
Mar94 <- Mar94*3600*24*31
Apr94 <- surface_runoff_array[, , 1732]
Apr94 <- Apr94*3600*24*30
May94 <- surface_runoff_array[, , 1733]
May94 <- May94*3600*24*31
Jun94 <- surface_runoff_array[, , 1734]
Jun94 <- Jun94*3600*24*30
Jul94 <- surface_runoff_array[, , 1735]
Jul94 <- Jul94*3600*24*31
Aug94 <- surface_runoff_array[, , 1736]
Aug94 <- Aug94*3600*24*31
Sep94 <- surface_runoff_array[, , 1737]
Sep94 <- Sep94*3600*24*30
Oct94 <- surface_runoff_array[, , 1738]
Oct94 <- Oct94*3600*24*31
Nov94 <- surface_runoff_array[, , 1739]
Nov94 <- Nov94*3600*24*30
Dec94 <- surface_runoff_array[, , 1740]
Dec94 <- Dec94*3600*24*31
Mean1994 <- ((Jan94 + Feb94 + Mar94 + Apr94 + Jun94 + Jul94 + Aug94 + Sep94 + Oct94 + Nov94 + Dec94)/12)
surface_runoff_vector <- as.vector(Mean1994)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1994 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

########################## Urban Runoff Data 1995 in mm/month ##############################
library(ggplot2)
library(maps)
library(ncdf4)

workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("clm50_release-clm5.0.20_1deg_GSWP3V1_isofix2_hist.clm2.h0.QOVER.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QOVER")
Jan95 <- surface_runoff_array[, , 1741]
Jan95 <- Jan95*3600*24*31
Feb95 <- surface_runoff_array[, , 1742]
Feb95 <- Feb95*3600*24*28
Mar95 <- surface_runoff_array[, , 1743]
Mar95 <- Mar95*3600*24*31
Apr95 <- surface_runoff_array[, , 1744]
Apr95 <- Apr95*3600*24*30
May95 <- surface_runoff_array[, , 1745]
May95 <- May95*3600*24*31
Jun95 <- surface_runoff_array[, , 1746]
Jun95 <- Jun95*3600*24*30
Jul95 <- surface_runoff_array[, , 1747]
Jul95 <- Jul95*3600*24*31
Aug95 <- surface_runoff_array[, , 1748]
Aug95 <- Aug95*3600*24*31
Sep95 <- surface_runoff_array[, , 1749]
Sep95 <- Sep95*3600*24*30
Oct95 <- surface_runoff_array[, , 1750]
Oct95 <- Oct95*3600*24*31
Nov95 <- surface_runoff_array[, , 1751]
Nov95 <- Nov95*3600*24*30
Dec95 <- surface_runoff_array[, , 1752]
Dec95 <- Dec95*3600*24*31
Mean1995 <- ((Jan95 + Feb95 + Mar95 + Apr95 + Jun95 + Jul95 + Aug95 + Sep95 + Oct95 + Nov95 + Dec95)/12)
surface_runoff_vector <- as.vector(Mean1995)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff for 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))



########################## 10 Year Mean in mm/month ##############################
Mean10YR <- ((Mean1986 + Mean1987 + Mean1988 + Mean1989 + Mean1990 + Mean1991 +
                Mean1992 + Mean1993 + Mean1994 + Mean1995)/10)
surface_runoff_vector <- as.vector(Mean10YR)

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

# mask out non--urban
flag_na <- is.na(surface_runoff_vector)
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
  geom_point(data = as.data.frame(surface_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = surface_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Surface Runoff from 1986 to 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)
