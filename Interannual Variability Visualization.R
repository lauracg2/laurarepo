rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(ncdf4)
library(dplyr)

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
  scale_color_distiller(name = expression(paste("Average Monthly Runoff from MERRA-2 1986-1995 (mm/month)",sep="")),
                        palette = "Spectral",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p3 <- p3 + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
### final visualization ###
p4 <- plot_grid(p1, p2, p3, labels = c("UNH-GRDC", "CESM", "MERRA-2"), ncol = 2, nrow =2)
show(p4)
show(p1)
show(p2)
