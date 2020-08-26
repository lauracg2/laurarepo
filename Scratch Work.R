rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(ncdf4)
library(dplyr)
library(cowplot)

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

