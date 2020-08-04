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


