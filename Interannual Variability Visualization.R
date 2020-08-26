rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(ncdf4)
library(dplyr)
library(cowplot)

################################## 1986 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)

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

GRDCMean1986 <- ((Jan86 + Feb86 + Mar86 + Apr86 + Jun86 + Jul86 + Aug86 + Sep86 + Oct86 + Nov86 + Dec86)/12)
GRDC_runoff_vector <- as.vector(GRDCMean1986)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")

#runoff
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1986 <- ((Jan86 + Feb86 + Mar86 + Apr86 + Jun86 + Jul86 + Aug86 + Sep86 + Oct86 + Nov86 + Dec86)/12)
CESMMean1986<- replace(CESMMean1986, which(CESMMean1986 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1986)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198601.SUB.nc")
Jan86 <- ncvar_get(Jan86, "RUNOFF")
Jan86 <- Jan86*3600*24*31
Feb86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198602.SUB.nc")
Feb86 <- ncvar_get(Feb86, "RUNOFF")
Feb86 <- Feb86*3600*24*28
Mar86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198603.SUB.nc")
Mar86 <- ncvar_get(Mar86, "RUNOFF")
Mar86 <- Mar86*3600*24*31
Apr86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198604.SUB.nc")
Apr86 <- ncvar_get(Apr86, "RUNOFF")
Apr86 <- Apr86*3600*24*30
May86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198605.SUB.nc")
May86 <- ncvar_get(May86, "RUNOFF")
May86 <- May86*3600*24*31
Jun86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198606.SUB.nc")
Jun86 <- ncvar_get(Jun86, "RUNOFF")
Jun86 <- Jun86*3600*24*30
Jul86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198607.SUB.nc")
Jul86 <- ncvar_get(Jul86, "RUNOFF")
Jul86 <- Jul86*3600*24*31
Aug86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198608.SUB.nc")
Aug86 <- ncvar_get(Aug86, "RUNOFF")
Aug86 <- Aug86*3600*24*31
Sep86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198609.SUB.nc")
Sep86 <- ncvar_get(Sep86, "RUNOFF")
Sep86 <- Sep86*3600*24*30
Oct86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198610.SUB.nc")
Oct86 <- ncvar_get(Oct86, "RUNOFF")
Oct86 <- Oct86*3600*24*31
Nov86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198611.SUB.nc")
Nov86 <- ncvar_get(Nov86, "RUNOFF")
Nov86 <- Nov86*3600*24*30
Dec86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198612.SUB.nc")
Dec86 <- ncvar_get(Dec86, "RUNOFF")
Dec86 <- Dec86*3600*24*31
MERRAMean1986 <- ((Jan86 + Feb86 + Mar86 + Apr86 + May86 + Jun86 + Jul86 + Aug86 + Sep86 + Oct86 + Nov86 + Dec86)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1986)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198601.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1986 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1987 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1987 <- ((Jan87 + Feb87 + Mar87 + Apr87 + Jun87 + Jul87 + Aug87 + Sep87 + Oct87 + Nov87 + Dec87)/12)
GRDCMean1987 <- t(GRDCMean1987)
GRDCMean1987 <- GRDCMean1987[,order(ncol(GRDCMean1987):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1987)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1987 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")


surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1987 <- ((Jan87 + Feb87 + Mar87 + Apr87 + Jun87 + Jul87 + Aug87 + Sep87 + Oct87 + Nov87 + Dec87)/12)
CESMMean1987<- replace(CESMMean1987, which(CESMMean1987 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1987)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1987 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
Jan87 <- ncvar_get(Jan87, "RUNOFF")
Jan87 <- Jan87*3600*24*31
Feb87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198702.SUB.nc")
Feb87 <- ncvar_get(Feb87, "RUNOFF")
Feb87 <- Feb87*3600*24*28
Mar87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198703.SUB.nc")
Mar87 <- ncvar_get(Mar87, "RUNOFF")
Mar87 <- Mar87*3600*24*31
Apr87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198704.SUB.nc")
Apr87 <- ncvar_get(Apr87, "RUNOFF")
Apr87 <- Apr87*3600*24*30
May87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198705.SUB.nc")
May87 <- ncvar_get(May87, "RUNOFF")
May87 <- May87*3600*24*31
Jun87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198706.SUB.nc")
Jun87 <- ncvar_get(Jun87, "RUNOFF")
Jun87 <- Jun87*3600*24*30
Jul87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198707.SUB.nc")
Jul87 <- ncvar_get(Jul87, "RUNOFF")
Jul87 <- Jul87*3600*24*31
Aug87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198708.SUB.nc")
Aug87 <- ncvar_get(Aug87, "RUNOFF")
Aug87 <- Aug87*3600*24*31
Sep87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198709.SUB.nc")
Sep87 <- ncvar_get(Sep87, "RUNOFF")
Sep87 <- Sep87*3600*24*30
Oct87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198710.SUB.nc")
Oct87 <- ncvar_get(Oct87, "RUNOFF")
Oct87 <- Oct87*3600*24*31
Nov87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198711.SUB.nc")
Nov87 <- ncvar_get(Nov87, "RUNOFF")
Nov87 <- Nov87*3600*24*30
Dec87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198712.SUB.nc")
Dec87 <- ncvar_get(Dec87, "RUNOFF")
Dec87 <- Dec87*3600*24*31
MERRAMean1987 <- ((Jan87 + Feb87 + Mar87 + Apr87 + May87 + Jun87 + Jul87 + Aug87 + Sep87 + Oct87 + Nov87 + Dec87)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1987)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1987 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)

################################## 1988 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1988 <- ((Jan88 + Feb88 + Mar88 + Apr88 + Jun88 + Jul88 + Aug88 + Sep88 + Oct88 + Nov88 + Dec88)/12)
GRDCMean1988 <- t(GRDCMean1988)
GRDCMean1988 <- GRDCMean1988[,order(ncol(GRDCMean1988):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1988)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1988 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")

surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1988 <- ((Jan88 + Feb88 + Mar88 + Apr88 + Jun88 + Jul88 + Aug88 + Sep88 + Oct88 + Nov88 + Dec88)/12)
CESMMean1988<- replace(CESMMean1988, which(CESMMean1988 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1988)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1988 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198801.SUB.nc")
Jan88 <- ncvar_get(Jan88, "RUNOFF")
Jan88 <- Jan88*3600*24*31
Feb88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198802.SUB.nc")
Feb88 <- ncvar_get(Feb88, "RUNOFF")
Feb88 <- Feb88*3600*24*29
Mar88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198803.SUB.nc")
Mar88 <- ncvar_get(Mar88, "RUNOFF")
Mar88 <- Mar88*3600*24*31
Apr88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198804.SUB.nc")
Apr88 <- ncvar_get(Apr88, "RUNOFF")
Apr88 <- Apr88*3600*24*30
May88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198805.SUB.nc")
May88 <- ncvar_get(May88, "RUNOFF")
May88 <- May88*3600*24*31
Jun88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198806.SUB.nc")
Jun88 <- ncvar_get(Jun88, "RUNOFF")
Jun88 <- Jun88*3600*24*30
Jul88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198807.SUB.nc")
Jul88 <- ncvar_get(Jul88, "RUNOFF")
Jul88 <- Jul88*3600*24*31
Aug88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198808.SUB.nc")
Aug88 <- ncvar_get(Aug88, "RUNOFF")
Aug88 <- Aug88*3600*24*31
Sep88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198809.SUB.nc")
Sep88 <- ncvar_get(Sep88, "RUNOFF")
Sep88 <- Sep88*3600*24*30
Oct88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198810.SUB.nc")
Oct88 <- ncvar_get(Oct88, "RUNOFF")
Oct88 <- Oct88*3600*24*31
Nov88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198811.SUB.nc")
Nov88 <- ncvar_get(Nov88, "RUNOFF")
Nov88 <- Nov88*3600*24*30
Dec88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198812.SUB.nc")
Dec88 <- ncvar_get(Dec88, "RUNOFF")
Dec88 <- Dec88*3600*24*31
MERRAMean1988 <- ((Jan88 + Feb88 + Mar88 + Apr88 + May88 + Jun88 + Jul88 + Aug88 + Sep88 + Oct88 + Nov88 + Dec88)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1988)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1988 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)



################################## 1989 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1989 <- ((Jan89 + Feb89 + Mar89 + Apr89 + Jun89 + Jul89 + Aug89 + Sep89 + Oct89 + Nov89 + Dec89)/12)
GRDCMean1989 <- t(GRDCMean1989)
GRDCMean1989 <- GRDCMean1989[,order(ncol(GRDCMean1989):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1989)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1989 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1989 <- ((Jan89 + Feb89 + Mar89 + Apr89 + Jun89 + Jul89 + Aug89 + Sep89 + Oct89 + Nov89 + Dec89)/12)
CESMMean1989<- replace(CESMMean1989, which(CESMMean1989 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1989)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1989 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198901.SUB.nc")
Jan89 <- ncvar_get(Jan89, "RUNOFF")
Jan89 <- Jan89*3600*24*31
Feb89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198902.SUB.nc")
Feb89 <- ncvar_get(Feb89, "RUNOFF")
Feb89 <- Feb89*3600*24*28
Mar89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198903.SUB.nc")
Mar89 <- ncvar_get(Mar89, "RUNOFF")
Mar89 <- Mar89*3600*24*31
Apr89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198904.SUB.nc")
Apr89 <- ncvar_get(Apr89, "RUNOFF")
Apr89 <- Apr89*3600*24*30
May89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198905.SUB.nc")
May89 <- ncvar_get(May89, "RUNOFF")
May89 <- May89*3600*24*31
Jun89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198906.SUB.nc")
Jun89 <- ncvar_get(Jun89, "RUNOFF")
Jun89 <- Jun89*3600*24*30
Jul89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198907.SUB.nc")
Jul89 <- ncvar_get(Jul89, "RUNOFF")
Jul89 <- Jul89*3600*24*31
Aug89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198908.SUB.nc")
Aug89 <- ncvar_get(Aug89, "RUNOFF")
Aug89 <- Aug89*3600*24*31
Sep89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198909.SUB.nc")
Sep89 <- ncvar_get(Sep89, "RUNOFF")
Sep89 <- Sep89*3600*24*30
Oct89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198910.SUB.nc")
Oct89 <- ncvar_get(Oct89, "RUNOFF")
Oct89 <- Oct89*3600*24*31
Nov89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198911.SUB.nc")
Nov89 <- ncvar_get(Nov89, "RUNOFF")
Nov89 <- Nov89*3600*24*30
Dec89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198912.SUB.nc")
Dec89 <- ncvar_get(Dec89, "RUNOFF")
Dec89 <- Dec89*3600*24*31
MERRAMean1989 <- ((Jan89 + Feb89 + Mar89 + Apr89 + May89 + Jun89 + Jul89 + Aug89 + Sep89 + Oct89 + Nov89 + Dec89)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1989)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1989 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)

################################## 1990 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1990 <- ((Jan90 + Feb90 + Mar90 + Apr90 + Jun90 + Jul90 + Aug90 + Sep90 + Oct90 + Nov90 + Dec90)/12)
GRDCMean1990 <- t(GRDCMean1990)
GRDCMean1990 <- GRDCMean1990[,order(ncol(GRDCMean1990):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1990)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1990 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1990 <- ((Jan90 + Feb90 + Mar90 + Apr90 + Jun90 + Jul90 + Aug90 + Sep90 + Oct90 + Nov90 + Dec90)/12)
CESMMean1990<- replace(CESMMean1990, which(CESMMean1990 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1990)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1990 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199001.SUB.nc")
Jan90 <- ncvar_get(Jan90, "RUNOFF")
Jan90 <- Jan90*3600*24*31
Feb90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199002.SUB.nc")
Feb90 <- ncvar_get(Feb90, "RUNOFF")
Feb90 <- Feb90*3600*24*28
Mar90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199003.SUB.nc")
Mar90 <- ncvar_get(Mar90, "RUNOFF")
Mar90 <- Mar90*3600*24*31
Apr90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199004.SUB.nc")
Apr90 <- ncvar_get(Apr90, "RUNOFF")
Apr90 <- Apr90*3600*24*30
May90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199005.SUB.nc")
May90 <- ncvar_get(May90, "RUNOFF")
May90 <- May90*3600*24*31
Jun90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199006.SUB.nc")
Jun90 <- ncvar_get(Jun90, "RUNOFF")
Jun90 <- Jun90*3600*24*30
Jul90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199007.SUB.nc")
Jul90 <- ncvar_get(Jul90, "RUNOFF")
Jul90 <- Jul90*3600*24*31
Aug90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199008.SUB.nc")
Aug90 <- ncvar_get(Aug90, "RUNOFF")
Aug90 <- Aug90*3600*24*31
Sep90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199009.SUB.nc")
Sep90 <- ncvar_get(Sep90, "RUNOFF")
Sep90 <- Sep90*3600*24*30
Oct90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199010.SUB.nc")
Oct90 <- ncvar_get(Oct90, "RUNOFF")
Oct90 <- Oct90*3600*24*31
Nov90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199011.SUB.nc")
Nov90 <- ncvar_get(Nov90, "RUNOFF")
Nov90 <- Nov90*3600*24*30
Dec90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199012.SUB.nc")
Dec90 <- ncvar_get(Dec90, "RUNOFF")
Dec90 <- Dec90*3600*24*31
MERRAMean1990 <- ((Jan90 + Feb90 + Mar90 + Apr90 + May90 + Jun90 + Jul90 + Aug90 + Sep90 + Oct90 + Nov90 + Dec90)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1990)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1990 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1991 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1991 <- ((Jan91 + Feb91 + Mar91 + Apr91 + Jun91 + Jul91 + Aug91 + Sep91 + Oct91 + Nov91 + Dec91)/12)
GRDCMean1991 <- t(GRDCMean1991)
GRDCMean1991 <- GRDCMean1991[,order(ncol(GRDCMean1991):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1991)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1991 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1991 <- ((Jan91 + Feb91 + Mar91 + Apr91 + Jun91 + Jul91 + Aug91 + Sep91 + Oct91 + Nov91 + Dec91)/12)
CESMMean1991<- replace(CESMMean1991, which(CESMMean1991 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1991)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1991 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199101.SUB.nc")
Jan91 <- ncvar_get(Jan91, "RUNOFF")
Jan91 <- Jan91*3600*24*31
Feb91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199102.SUB.nc")
Feb91 <- ncvar_get(Feb91, "RUNOFF")
Feb91 <- Feb91*3600*24*28
Mar91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199103.SUB.nc")
Mar91 <- ncvar_get(Mar91, "RUNOFF")
Mar91 <- Mar91*3600*24*31
Apr91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199104.SUB.nc")
Apr91 <- ncvar_get(Apr91, "RUNOFF")
Apr91 <- Apr91*3600*24*30
May91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199105.SUB.nc")
May91 <- ncvar_get(May91, "RUNOFF")
May91 <- May91*3600*24*31
Jun91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199106.SUB.nc")
Jun91 <- ncvar_get(Jun91, "RUNOFF")
Jun91 <- Jun91*3600*24*30
Jul91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199107.SUB.nc")
Jul91 <- ncvar_get(Jul91, "RUNOFF")
Jul91 <- Jul91*3600*24*31
Aug91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199108.SUB.nc")
Aug91 <- ncvar_get(Aug91, "RUNOFF")
Aug91 <- Aug91*3600*24*31
Sep91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199109.SUB.nc")
Sep91 <- ncvar_get(Sep91, "RUNOFF")
Sep91 <- Sep91*3600*24*30
Oct91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199110.SUB.nc")
Oct91 <- ncvar_get(Oct91, "RUNOFF")
Oct91 <- Oct91*3600*24*31
Nov91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199111.SUB.nc")
Nov91 <- ncvar_get(Nov91, "RUNOFF")
Nov91 <- Nov91*3600*24*30
Dec91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199112.SUB.nc")
Dec91 <- ncvar_get(Dec91, "RUNOFF")
Dec91 <- Dec91*3600*24*31
MERRAMean1991 <- ((Jan91 + Feb91 + Mar91 + Apr91 + May91 + Jun91 + Jul91 + Aug91 + Sep91 + Oct91 + Nov91 + Dec91)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1991)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1991 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1992 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1992 <- ((Jan92 + Feb92 + Mar92 + Apr92 + Jun92 + Jul92 + Aug92 + Sep92 + Oct92 + Nov92 + Dec92)/12)
GRDCMean1992 <- t(GRDCMean1992)
GRDCMean1992 <- GRDCMean1992[,order(ncol(GRDCMean1992):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1992)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1992 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1992 <- ((Jan92 + Feb92 + Mar92 + Apr92 + Jun92 + Jul92 + Aug92 + Sep92 + Oct92 + Nov92 + Dec92)/12)
CESMMean1992<- replace(CESMMean1992, which(CESMMean1992 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1992)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1992 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199201.SUB.nc")
Jan92 <- ncvar_get(Jan92, "RUNOFF")
Jan92 <- Jan92*3600*24*31
Feb92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199202.SUB.nc")
Feb92 <- ncvar_get(Feb92, "RUNOFF")
Feb92 <- Feb92*3600*24*29
Mar92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199203.SUB.nc")
Mar92 <- ncvar_get(Mar92, "RUNOFF")
Mar92 <- Mar92*3600*24*31
Apr92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199204.SUB.nc")
Apr92 <- ncvar_get(Apr92, "RUNOFF")
Apr92 <- Apr92*3600*24*30
May92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199205.SUB.nc")
May92 <- ncvar_get(May92, "RUNOFF")
May92 <- May92*3600*24*31
Jun92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199206.SUB.nc")
Jun92 <- ncvar_get(Jun92, "RUNOFF")
Jun92 <- Jun92*3600*24*30
Jul92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199207.SUB.nc")
Jul92 <- ncvar_get(Jul92, "RUNOFF")
Jul92 <- Jul92*3600*24*31
Aug92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199208.SUB.nc")
Aug92 <- ncvar_get(Aug92, "RUNOFF")
Aug92 <- Aug92*3600*24*31
Sep92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199209.SUB.nc")
Sep92 <- ncvar_get(Sep92, "RUNOFF")
Sep92 <- Sep92*3600*24*30
Oct92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199210.SUB.nc")
Oct92 <- ncvar_get(Oct92, "RUNOFF")
Oct92 <- Oct92*3600*24*31
Nov92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199211.SUB.nc")
Nov92 <- ncvar_get(Nov92, "RUNOFF")
Nov92 <- Nov92*3600*24*30
Dec92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199212.SUB.nc")
Dec92 <- ncvar_get(Dec92, "RUNOFF")
Dec92 <- Dec92*3600*24*31
Mean1992 <- ((Jan92 + Feb92 + Mar92 + Apr92 + May92 + Jun92 + Jul92 + Aug92 + Sep92 + Oct92 + Nov92 + Dec92)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1992)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1992 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1993 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
GRDCMean1993 <- ((Jan93 + Feb93 + Mar93 + Apr93 + Jun93 + Jul93 + Aug93 + Sep93 + Oct93 + Nov93 + Dec93)/12)
GRDCMean1993 <- t(GRDCMean1993)
GRDCMean1993 <- GRDCMean1993[,order(ncol(GRDCMean1993):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1993)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1993 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1993 <- ((Jan93 + Feb93 + Mar93 + Apr93 + Jun93 + Jul93 + Aug93 + Sep93 + Oct93 + Nov93 + Dec93)/12)
CESMMean1993<- replace(CESMMean1993, which(CESMMean1993 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1993)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1993 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199301.SUB.nc")
Jan93 <- ncvar_get(Jan93, "RUNOFF")
Jan93 <- Jan93*3600*24*31
Feb93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199302.SUB.nc")
Feb93 <- ncvar_get(Feb93, "RUNOFF")
Feb93 <- Feb93*3600*24*28
Mar93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199303.SUB.nc")
Mar93 <- ncvar_get(Mar93, "RUNOFF")
Mar93 <- Mar93*3600*24*31
Apr93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199304.SUB.nc")
Apr93 <- ncvar_get(Apr93, "RUNOFF")
Apr93 <- Apr93*3600*24*30
May93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199305.SUB.nc")
May93 <- ncvar_get(May93, "RUNOFF")
May93 <- May93*3600*24*31
Jun93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199306.SUB.nc")
Jun93 <- ncvar_get(Jun93, "RUNOFF")
Jun93 <- Jun93*3600*24*30
Jul93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199307.SUB.nc")
Jul93 <- ncvar_get(Jul93, "RUNOFF")
Jul93 <- Jul93*3600*24*31
Aug93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199308.SUB.nc")
Aug93 <- ncvar_get(Aug93, "RUNOFF")
Aug93 <- Aug93*3600*24*31
Sep93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199309.SUB.nc")
Sep93 <- ncvar_get(Sep93, "RUNOFF")
Sep93 <- Sep93*3600*24*30
Oct93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199310.SUB.nc")
Oct93 <- ncvar_get(Oct93, "RUNOFF")
Oct93 <- Oct93*3600*24*31
Nov93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199311.SUB.nc")
Nov93 <- ncvar_get(Nov93, "RUNOFF")
Nov93 <- Nov93*3600*24*30
Dec93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199312.SUB.nc")
Dec93 <- ncvar_get(Dec93, "RUNOFF")
Dec93 <- Dec93*3600*24*31
MERRAMean1993 <- ((Jan93 + Feb93 + Mar93 + Apr93 + May93 + Jun93 + Jul93 + Aug93 + Sep93 + Oct93 + Nov93 + Dec93)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1993)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1993 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1994 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
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
Dec94 <- read.ascii.grid("comp_runoff_hd_199412.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec94 <- Dec94 %>% dplyr::na_if(-88)
GRDCMean1994 <- ((Jan94 + Feb94 + Mar94 + Apr94 + Jun94 + Jul94 + Aug94 + Sep94 + Oct94 + Nov94 + Dec94)/12)
GRDCMean1994 <- t(GRDCMean1994)
GRDCMean1994 <- GRDCMean1994[,order(ncol(GRDCMean1994):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1994)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1994 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1994 <- ((Jan94 + Feb94 + Mar94 + Apr94 + Jun94 + Jul94 + Aug94 + Sep94 + Oct94 + Nov94 + Dec94)/12)
CESMMean1994<- replace(CESMMean1994, which(CESMMean1994 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1994)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1994 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199401.SUB.nc")
Jan94 <- ncvar_get(Jan94, "RUNOFF")
Jan94 <- Jan94*3600*24*31
Feb94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199402.SUB.nc")
Feb94 <- ncvar_get(Feb94, "RUNOFF")
Feb94 <- Feb94*3600*24*28
Mar94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199403.SUB.nc")
Mar94 <- ncvar_get(Mar94, "RUNOFF")
Mar94 <- Mar94*3600*24*31
Apr94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199404.SUB.nc")
Apr94 <- ncvar_get(Apr94, "RUNOFF")
Apr94 <- Apr94*3600*24*30
May94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199405.SUB.nc")
May94 <- ncvar_get(May94, "RUNOFF")
May94 <- May94*3600*24*31
Jun94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199406.SUB.nc")
Jun94 <- ncvar_get(Jun94, "RUNOFF")
Jun94 <- Jun94*3600*24*30
Jul94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199407.SUB.nc")
Jul94 <- ncvar_get(Jul94, "RUNOFF")
Jul94 <- Jul94*3600*24*31
Aug94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199408.SUB.nc")
Aug94 <- ncvar_get(Aug94, "RUNOFF")
Aug94 <- Aug94*3600*24*31
Sep94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199409.SUB.nc")
Sep94 <- ncvar_get(Sep94, "RUNOFF")
Sep94 <- Sep94*3600*24*30
Oct94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199410.SUB.nc")
Oct94 <- ncvar_get(Oct94, "RUNOFF")
Oct94 <- Oct94*3600*24*31
Nov94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199411.SUB.nc")
Nov94 <- ncvar_get(Nov94, "RUNOFF")
Nov94 <- Nov94*3600*24*30
Dec94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199412.SUB.nc")
Dec94 <- ncvar_get(Dec94, "RUNOFF")
Dec94 <- Dec94*3600*24*31
MERRAMean1994 <- ((Jan94 + Feb94 + Mar94 + Apr94 + May94 + Jun94 + Jul94 + Aug94 + Sep94 + Oct94 + Nov94 + Dec94)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1994)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1994 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)


################################## 1995 ###########################################
### UNH-GRDC Data ###
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)
Jan95 <- read.ascii.grid("comp_runoff_hd_199501.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan95 <- Jan95 %>% dplyr::na_if(-88)
Feb95 <- read.ascii.grid("comp_runoff_hd_199502.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb95 <- Feb95 %>% dplyr::na_if(-88)
Mar95 <- read.ascii.grid("comp_runoff_hd_199503.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar95 <- Mar95 %>% dplyr::na_if(-88)
Apr95 <- read.ascii.grid("comp_runoff_hd_199504.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr95 <- Apr95 %>% dplyr::na_if(-88)
May95 <- read.ascii.grid("comp_runoff_hd_199505.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May95 <- May95 %>% dplyr::na_if(-88)
Jun95 <- read.ascii.grid("comp_runoff_hd_199506.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun95 <- Jun95 %>% dplyr::na_if(-88)
Jul95 <- read.ascii.grid("comp_runoff_hd_199507.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul95 <- Jul95 %>% dplyr::na_if(-88)
Aug95 <- read.ascii.grid("comp_runoff_hd_199508.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug95 <- Aug95 %>% dplyr::na_if(-88)
Sep95 <- read.ascii.grid("comp_runoff_hd_199509.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep95 <- Sep95 %>% dplyr::na_if(-88)
Oct95 <- read.ascii.grid("comp_runoff_hd_199510.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct95 <- Oct95 %>% dplyr::na_if(-88)
Nov95 <- read.ascii.grid("comp_runoff_hd_199511.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov95 <- Nov95 %>% dplyr::na_if(-88)
Dec95 <- read.ascii.grid("comp_runoff_hd_199512.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec95 <- Dec95 %>% dplyr::na_if(-88)
GRDCMean1995 <- ((Jan95 + Feb95 + Mar95 + Apr95 + Jun95 + Jul95 + Aug95 + Sep95 + Oct95 + Nov95 + Dec95)/12)
GRDCMean1995 <- t(GRDCMean1995)
GRDCMean1995 <- GRDCMean1995[,order(ncol(GRDCMean1995):1)]
GRDC_runoff_vector <- as.vector(GRDCMean1995)

#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

flag_na <- is.na(GRDC_runoff_vector)
GRDC_lat <- as.vector(GRDClat2D)
GRDC_lat[flag_na] <- NA
GRDC_lon <- as.vector(GRDClon2D)
GRDC_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p1<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(GRDC_runoff_vector), aes(x = GRDC_lon, y = GRDC_lat, colour = GRDC_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Composite Mean Runoff for 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p1 <- p1 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### CESM Data ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
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
CESMMean1995 <- ((Jan95 + Feb95 + Mar95 + Apr95 + Jun95 + Jul95 + Aug95 + Sep95 + Oct95 + Nov95 + Dec95)/12)
CESMMean1995<- replace(CESMMean1995, which(CESMMean1995 < 0), NA)
CESM_runoff_vector <- as.vector(CESMMean1995)

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
flag_na <- is.na(CESM_runoff_vector)
urban_lat <- as.vector(lat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(lon2D)
urban_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p2<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(CESM_runoff_vector), aes(x = urban_lon, y = urban_lat, colour = CESM_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Total Runoff for 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p2 <- p2 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))


### MERRA-2 Data ###
workdir <- "/Users/lauragray/Downloads/Research/MERRA Data"
setwd(workdir)
Jan95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199501.SUB.nc")
Jan95 <- ncvar_get(Jan95, "RUNOFF")
Jan95 <- Jan95*3600*24*31
Feb95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199502.SUB.nc")
Feb95 <- ncvar_get(Feb95, "RUNOFF")
Feb95 <- Feb95*3600*24*28
Mar95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199503.SUB.nc")
Mar95 <- ncvar_get(Mar95, "RUNOFF")
Mar95 <- Mar95*3600*24*31
Apr95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199504.SUB.nc")
Apr95 <- ncvar_get(Apr95, "RUNOFF")
Apr95 <- Apr95*3600*24*30
May95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199505.SUB.nc")
May95 <- ncvar_get(May95, "RUNOFF")
May95 <- May95*3600*24*31
Jun95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199506.SUB.nc")
Jun95 <- ncvar_get(Jun95, "RUNOFF")
Jun95 <- Jun95*3600*24*30
Jul95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199507.SUB.nc")
Jul95 <- ncvar_get(Jul95, "RUNOFF")
Jul95 <- Jul95*3600*24*31
Aug95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199508.SUB.nc")
Aug95 <- ncvar_get(Aug95, "RUNOFF")
Aug95 <- Aug95*3600*24*31
Sep95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199509.SUB.nc")
Sep95 <- ncvar_get(Sep95, "RUNOFF")
Sep95 <- Sep95*3600*24*30
Oct95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199510.SUB.nc")
Oct95 <- ncvar_get(Oct95, "RUNOFF")
Oct95 <- Oct95*3600*24*31
Nov95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199511.SUB.nc")
Nov95 <- ncvar_get(Nov95, "RUNOFF")
Nov95 <- Nov95*3600*24*30
Dec95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199512.SUB.nc")
Dec95 <- ncvar_get(Dec95, "RUNOFF")
Dec95 <- Dec95*3600*24*31
MERRAMean1995 <- ((Jan95 + Feb95 + Mar95 + Apr95 + May95 + Jun95 + Jul95 + Aug95 + Sep95 + Oct95 + Nov95 + Dec95)/12)
MERRA_runoff_vector <- as.vector(MERRAMean1995)

fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
#lon
MERRAlon <- ncvar_get(fi, "lon")
MERRAlon2D <- kronecker(matrix(1, 1, 361), MERRAlon)
#lat
MERRAlat <- ncvar_get(fi, "lat", verbose = F)
MERRAlat <- data.frame(MERRAlat)
MERRAlat <- t(MERRAlat)
MERRAlat2D <- kronecker(matrix(1, 576, 1), MERRAlat)

# mask out non--urban
flag_na <- is.na(MERRA_runoff_vector)
MERRA_lat <- as.vector(MERRAlat2D)
MERRA_lat[flag_na] <- NA
MERRA_lon <- as.vector(MERRAlon2D)
MERRA_lon[flag_na] <- NA

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

map.world <- map_data(map = "world")
p3 <- ggplot(map.world, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(MERRA_runoff_vector), aes(x = MERRA_lon, y = MERRA_lat, colour = MERRA_runoff_vector), size = 0.5) +
  coord_fixed(ratio = 1.25) + 
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 for 1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
                 legend.text = element_text(size = 7))

### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)

