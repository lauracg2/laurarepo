rm(list = ls(all=TRUE))

############################## Pull GRDC Files ###################################
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
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

############################## Pull CESM Files ###################################
library(ncdf4)
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")
CJan87 <- surface_runoff_array[, , 1645]
CJan87 <- CJan87*3600*24*31
CFeb87 <- surface_runoff_array[, , 1646]
CFeb87 <- CFeb87*3600*24*28
CMar87 <- surface_runoff_array[, , 1647]
CMar87 <- CMar87*3600*24*31
CApr87 <- surface_runoff_array[, , 1648]
CApr87 <- CApr87*3600*24*30
CMay87 <- surface_runoff_array[, , 1649]
CMay87 <- CMay87*3600*24*31
CJun87 <- surface_runoff_array[, , 1650]
CJun87 <- CJun87*3600*24*30
CJul87 <- surface_runoff_array[, , 1651]
CJul87 <- CJul87*3600*24*31
CAug87 <- surface_runoff_array[, , 1652]
CAug87 <- CAug87*3600*24*31
CSep87 <- surface_runoff_array[, , 1653]
CSep87 <- CSep87*3600*24*30
COct87 <- surface_runoff_array[, , 1654]
COct87 <- COct87*3600*24*31
CNov87 <- surface_runoff_array[, , 1655]
CNov87 <- CNov87*3600*24*30
CDec87 <- surface_runoff_array[, , 1656]
CDec87 <- CDec87*3600*24*31

############################## Lat Lon Calculation ###############################
### GRDC Lat & Lon ###
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

### CESM Lat & Lon ###
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

############################## JANUARY Aggregation #############################
total_runoff_vector <- as.vector(CJan87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Jan87 <- t(Jan87)
Jan87 <- Jan87[,order(ncol(Jan87):1)]
GRDCJan<-Jan87
GRDCJan_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan_agg[i]<-mean(GRDCJan[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan_agg)
GRDCJan_agg[GRDCflag]<-NA
write.csv(GRDCJan_agg, "GRDC Jan87 Aggregation.csv", row.names = FALSE)

CESMJan <- as.vector(CJan87)
CESMJan <- data.frame(CESMJan)
CESMJan <- data.matrix(CESMJan)
CESMJan <- as.vector(CESMJan)

Bias <- CESMJan - GRDCJan_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, January 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## FEBRUARY Aggregation ##############################
total_runoff_vector <- as.vector(CFeb87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Feb87 <- t(Feb87)
Feb87 <- Feb87[,order(ncol(Feb87):1)]
GRDCFeb<-Feb87
GRDCFeb_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb_agg[i]<-mean(GRDCFeb[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb_agg)
GRDCFeb_agg[GRDCflag]<-NA
write.csv(GRDCFeb_agg, "GRDC Feb87 Aggregation.csv", row.names = FALSE)

CESMFeb <- as.vector(CFeb87)
CESMFeb <- data.frame(CESMFeb)
CESMFeb <- data.matrix(CESMFeb)
CESMFeb <- as.vector(CESMFeb)

Bias <- CESMFeb - GRDCFeb_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, February 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


############################## MARCH Aggregation ##############################
total_runoff_vector <- as.vector(CMar87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Mar87 <- t(Mar87)
Mar87 <- Mar87[,order(ncol(Mar87):1)]
GRDCMar<-Mar87
GRDCMar_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar_agg[i]<-mean(GRDCMar[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar_agg)
GRDCMar_agg[GRDCflag]<-NA
write.csv(GRDCMar_agg, "GRDC Mar87 Aggregation.csv", row.names = FALSE)

CESMMar <- as.vector(CMar87)
CESMMar <- data.frame(CESMMar)
CESMMar <- data.matrix(CESMMar)
CESMMar <- as.vector(CESMMar)

Bias <- CESMMar - GRDCMar_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, March 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


############################## APRIL Aggregation ##############################
total_runoff_vector <- as.vector(CApr87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Apr87 <- t(Apr87)
Apr87 <- Apr87[,order(ncol(Apr87):1)]
GRDCApr<-Apr87
GRDCApr_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr_agg[i]<-mean(GRDCApr[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr_agg)
GRDCApr_agg[GRDCflag]<-NA
write.csv(GRDCApr_agg, "GRDC Apr87 Aggregation.csv", row.names = FALSE)

CESMApr <- as.vector(CApr87)
CESMApr <- data.frame(CESMApr)
CESMApr <- data.matrix(CESMApr)
CESMApr <- as.vector(CESMApr)

Bias <- CESMApr - GRDCApr_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, April 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## MAY Aggregation ##############################
total_runoff_vector <- as.vector(CMay87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

May87 <- t(May87)
May87 <- May87[,order(ncol(May87):1)]
GRDCMay<-May87
GRDCMay_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay_agg[i]<-mean(GRDCMay[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay_agg)
GRDCMay_agg[GRDCflag]<-NA
write.csv(GRDCMay_agg, "GRDC May87 Aggregation.csv", row.names = FALSE)

CESMMay <- as.vector(CMay87)
CESMMay <- data.frame(CESMMay)
CESMMay <- data.matrix(CESMMay)
CESMMay <- as.vector(CESMMay)

Bias <- CESMMay - GRDCMay_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, May 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## JUNE Aggregation ##############################
total_runoff_vector <- as.vector(CJun87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Jun87 <- t(Jun87)
Jun87 <- Jun87[,order(ncol(Jun87):1)]
GRDCJun<-Jun87
GRDCJun_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun_agg[i]<-mean(GRDCJun[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun_agg)
GRDCJun_agg[GRDCflag]<-NA
write.csv(GRDCJun_agg, "GRDC Jun87 Aggregation.csv", row.names = FALSE)

CESMJun <- as.vector(CJun87)
CESMJun <- data.frame(CESMJun)
CESMJun <- data.matrix(CESMJun)
CESMJun <- as.vector(CESMJun)

Bias <- CESMJun - GRDCJun_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, June 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## JULY Aggregation ##############################
total_runoff_vector <- as.vector(CJul87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Jul87 <- t(Jul87)
Jul87 <- Jul87[,order(ncol(Jul87):1)]
GRDCJul<-Jul87
GRDCJul_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul_agg[i]<-mean(GRDCJul[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul_agg)
GRDCJul_agg[GRDCflag]<-NA
write.csv(GRDCJul_agg, "GRDC Jul87 Aggregation.csv", row.names = FALSE)

CESMJul <- as.vector(CJul87)
CESMJul <- data.frame(CESMJul)
CESMJul <- data.matrix(CESMJul)
CESMJul <- as.vector(CESMJul)

Bias <- CESMJul - GRDCJul_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, July 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## AUGUST Aggregation ##############################
total_runoff_vector <- as.vector(CAug87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Aug87 <- t(Aug87)
Aug87 <- Aug87[,order(ncol(Aug87):1)]
GRDCAug<-Aug87
GRDCAug_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug_agg[i]<-mean(GRDCAug[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug_agg)
GRDCAug_agg[GRDCflag]<-NA
write.csv(GRDCAug_agg, "GRDC Aug87 Aggregation.csv", row.names = FALSE)

CESMAug <- as.vector(CAug87)
CESMAug <- data.frame(CESMAug)
CESMAug <- data.matrix(CESMAug)
CESMAug <- as.vector(CESMAug)

Bias <- CESMAug - GRDCAug_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, August 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## SEPTEMBER Aggregation ##############################
total_runoff_vector <- as.vector(CSep87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Sep87 <- t(Sep87)
Sep87 <- Sep87[,order(ncol(Sep87):1)]
GRDCSep<-Sep87
GRDCSep_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep_agg[i]<-mean(GRDCSep[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep_agg)
GRDCSep_agg[GRDCflag]<-NA
write.csv(GRDCSep_agg, "GRDC Sep87 Aggregation.csv", row.names = FALSE)

CESMSep <- as.vector(CSep87)
CESMSep <- data.frame(CESMSep)
CESMSep <- data.matrix(CESMSep)
CESMSep <- as.vector(CESMSep)

Bias <- CESMSep - GRDCSep_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, September 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## OCTOBER Aggregation ##############################
total_runoff_vector <- as.vector(COct87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Oct87 <- t(Oct87)
Oct87 <- Oct87[,order(ncol(Oct87):1)]
GRDCOct<-Oct87
GRDCOct_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct_agg[i]<-mean(GRDCOct[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct_agg)
GRDCOct_agg[GRDCflag]<-NA
write.csv(GRDCOct_agg, "GRDC Oct87 Aggregation.csv", row.names = FALSE)

CESMOct <- as.vector(COct87)
CESMOct <- data.frame(CESMOct)
CESMOct <- data.matrix(CESMOct)
CESMOct <- as.vector(CESMOct)

Bias <- CESMOct - GRDCOct_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, October 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


############################## NOVEMBER Aggregation ##############################
total_runoff_vector <- as.vector(CNov87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Nov87 <- t(Nov87)
Nov87 <- Nov87[,order(ncol(Nov87):1)]
GRDCNov<-Nov87
GRDCNov_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov_agg[i]<-mean(GRDCNov[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov_agg)
GRDCNov_agg[GRDCflag]<-NA
write.csv(GRDCNov_agg, "GRDC Nov87 Aggregation.csv", row.names = FALSE)

CESMNov <- as.vector(CNov87)
CESMNov <- data.frame(CESMNov)
CESMNov <- data.matrix(CESMNov)
CESMNov <- as.vector(CESMNov)

Bias <- CESMNov - GRDCNov_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, November 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## DECEMBER Aggregation ##############################
total_runoff_vector <- as.vector(CDec87)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

Dec87 <- t(Dec87)
Dec87 <- Dec87[,order(ncol(Dec87):1)]
GRDCDec<-Dec87
GRDCDec_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec_agg[i]<-mean(GRDCDec[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec_agg)
GRDCDec_agg[GRDCflag]<-NA
write.csv(GRDCDec_agg, "GRDC Dec87 Aggregation.csv", row.names = FALSE)

CESMDec <- as.vector(CDec87)
CESMDec <- data.frame(CESMDec)
CESMDec <- data.matrix(CESMDec)
CESMDec <- as.vector(CESMDec)

Bias <- CESMDec - GRDCDec_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, December 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US JANUARY Aggregation #########################
Bias <- CESMJan - GRDCJan_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, January 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#panel.background = element_rect(fill="grey")

############################## US FEBRUARY Aggregation #########################
Bias <- CESMFeb - GRDCFeb_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, February 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#panel.background = element_rect(fill="grey")

############################## US MARCH Aggregation #########################
Bias <- CESMMar - GRDCMar_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, March 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

#panel.background = element_rect(fill="grey")

############################## US APRIL Aggregation #########################
Bias <- CESMApr - GRDCApr_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, April 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US MAY Aggregation #########################
Bias <- CESMMay - GRDCMay_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, May 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US JUNE Aggregation #########################
Bias <- CESMJun - GRDCJun_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, June 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US JULY Aggregation #########################
Bias <- CESMJul - GRDCJul_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, July 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


############################## US AUGUST Aggregation #########################
Bias <- CESMAug - GRDCAug_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, August 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US SEPTEMBER Aggregation #########################
Bias <- CESMSep - GRDCSep_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, September 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US OCTOBER Aggregation #########################
Bias <- CESMOct - GRDCOct_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, October 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US NOVEMBER Aggregation #########################
Bias <- CESMNov - GRDCNov_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, November 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

############################## US DECEMBER Aggregation #########################
Bias <- CESMDec - GRDCDec_agg

##Bias Graphics## 

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)

map.us <- map_data(map = "state")
p<-ggplot(map.us, aes(x = long, y = lat)) +  xlim(-125, -69) + ylim(25, 50) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom", panel.background = element_rect(fill="grey54")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(Bias), aes(x = CESM_lon, y = CESM_lat, colour = Bias), size = 2) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Bias between CESM and GRDC, December 1987 (mm/month)",sep="")),
                        palette = "RdYlBu",
                        limits = limits,
                        labels = labels,
                        breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)


############################## Statistical Analysis ############################
#Make sure the csv files you are working with have been edited to include the month
#in one column labeled "month" and the other column is labeled "Value"
January <- read.csv("~/GRDC Jan87 Aggregation.csv", header = TRUE)
JanuaryBias <- January$Value - (as.vector(CJan87))
JanuaryBias <- data.frame(January$Month, JanuaryBias)
names(JanuaryBias)[names(JanuaryBias)=="January.Month"] <- "Month"
names(JanuaryBias)[names(JanuaryBias)=="JanuaryBias"] <- "Bias"
February <- read.csv("~/GRDC Feb87 Aggregation.csv", header = TRUE)
FebruaryBias <- February$Value - (as.vector(CFeb87))
FebruaryBias <- data.frame(February$Month, FebruaryBias)
names(FebruaryBias)[names(FebruaryBias)=="February.Month"] <- "Month"
names(FebruaryBias)[names(FebruaryBias)=="FebruaryBias"] <- "Bias"
March <- read.csv("~/GRDC Mar87 Aggregation.csv", header = TRUE)
MarchBias <- March$Value - (as.vector(CMar87))
MarchBias <- data.frame(March$Month, MarchBias)
names(MarchBias)[names(MarchBias)=="March.Month"] <- "Month"
names(MarchBias)[names(MarchBias)=="MarchBias"] <- "Bias"
April <- read.csv("~/GRDC Apr87 Aggregation.csv", header = TRUE)
AprilBias <- April$Value - (as.vector(CApr87))
AprilBias <- data.frame(April$Month, AprilBias)
names(AprilBias)[names(AprilBias)=="April.Month"] <- "Month"
names(AprilBias)[names(AprilBias)=="AprilBias"] <- "Bias"
May <- read.csv("~/GRDC May87 Aggregation.csv", header = TRUE)
MayBias <- May$Value - (as.vector(CMay87))
MayBias <- data.frame(May$Month, MayBias)
names(MayBias)[names(MayBias)=="May.Month"] <- "Month"
names(MayBias)[names(MayBias)=="MayBias"] <- "Bias"
June <- read.csv("~/GRDC Jun87 Aggregation.csv", header = TRUE)
JuneBias <- June$Value - (as.vector(CJun87))
JuneBias <- data.frame(June$Month, JuneBias)
names(JuneBias)[names(JuneBias)=="June.Month"] <- "Month"
names(JuneBias)[names(JuneBias)=="JuneBias"] <- "Bias"
July <- read.csv("~/GRDC Jul87 Aggregation.csv", header = TRUE)
JulyBias <- July$Value - (as.vector(CJul87))
JulyBias <- data.frame(July$Month, JulyBias)
names(JulyBias)[names(JulyBias)=="July.Month"] <- "Month"
names(JulyBias)[names(JulyBias)=="JulyBias"] <- "Bias"
August <- read.csv("~/GRDC Aug87 Aggregation.csv", header = TRUE)
AugustBias <- August$Value - (as.vector(CAug87))
AugustBias <- data.frame(August$Month, AugustBias)
names(AugustBias)[names(AugustBias)=="August.Month"] <- "Month"
names(AugustBias)[names(AugustBias)=="AugustBias"] <- "Bias"
September <- read.csv("~/GRDC Sep87 Aggregation.csv", header = TRUE)
SeptemberBias <- September$Value - (as.vector(CSep87))
SeptemberBias <- data.frame(September$Month, SeptemberBias)
names(SeptemberBias)[names(SeptemberBias)=="September.Month"] <- "Month"
names(SeptemberBias)[names(SeptemberBias)=="SeptemberBias"] <- "Bias"
October <- read.csv("~/GRDC Oct87 Aggregation.csv", header = TRUE)
OctoberBias <- October$Value - (as.vector(COct87))
OctoberBias <- data.frame(October$Month, OctoberBias)
names(OctoberBias)[names(OctoberBias)=="October.Month"] <- "Month"
names(OctoberBias)[names(OctoberBias)=="OctoberBias"] <- "Bias"
November <- read.csv("~/GRDC Nov87 Aggregation.csv", header = TRUE)
NovemberBias <- November$Value - (as.vector(CNov87))
NovemberBias <- data.frame(November$Month, NovemberBias)
names(NovemberBias)[names(NovemberBias)=="November.Month"] <- "Month"
names(NovemberBias)[names(NovemberBias)=="NovemberBias"] <- "Bias"
December <- read.csv("~/GRDC Dec87 Aggregation.csv", header = TRUE)
DecemberBias <- December$Value - (as.vector(CDec87))
DecemberBias <- data.frame(December$Month, DecemberBias)
names(DecemberBias)[names(DecemberBias)=="December.Month"] <- "Month"
names(DecemberBias)[names(DecemberBias)=="DecemberBias"] <- "Bias"

FullYrAgg <- rbind(January, February)
FullYrAgg <- rbind(FullYrAgg, March)
FullYrAgg <- rbind(FullYrAgg, April)
FullYrAgg <- rbind(FullYrAgg, May)
FullYrAgg <- rbind(FullYrAgg, June)
FullYrAgg <- rbind(FullYrAgg, July)
FullYrAgg <- rbind(FullYrAgg, August)
FullYrAgg <- rbind(FullYrAgg, September)
FullYrAgg <- rbind(FullYrAgg, October)
FullYrAgg <- rbind(FullYrAgg, November)
FullYrAgg <- rbind(FullYrAgg, December)

FullYrBias <- rbind(JanuaryBias, FebruaryBias)
FullYrBias <- rbind(FullYrBias, MarchBias)
FullYrBias <- rbind(FullYrBias, AprilBias)
FullYrBias <- rbind(FullYrBias, MayBias)
FullYrBias <- rbind(FullYrBias, JuneBias)
FullYrBias <- rbind(FullYrBias, JulyBias)
FullYrBias <- rbind(FullYrBias, AugustBias)
FullYrBias <- rbind(FullYrBias, SeptemberBias)
FullYrBias <- rbind(FullYrBias, OctoberBias)
FullYrBias <- rbind(FullYrBias, NovemberBias)
FullYrBias <- rbind(FullYrBias, DecemberBias)

#Anova test for general difference between the months
res.aov <- aov(Value ~ Month, data=FullYrAgg)
summary(res.aov)
plot(res.aov)

#Anova test for bias difference between the months
bias.aov <- aov(Bias ~ Month, data=FullYrBias)
summary(bias.aov)
plot(bias.aov)

#lognormal check
library(dplyr)
FullYrAgglog <- log10(FullYrAgg$Value)
FullYrAgglog <- FullYrAgglog %>% dplyr::na_if(-Inf)
FullYrAgglog <- FullYrAgglog %>% dplyr::na_if(Inf)
FullYrAgglog <- FullYrAgglog %>% dplyr::na_if(NaN)
FullYrAgglog <- data.frame(FullYrAgg$Month, FullYrAgglog)
names(FullYrAgglog)[names(FullYrAgglog)=="FullYrAgg.Month"] <- "Month"
names(FullYrAgglog)[names(FullYrAgglog)=="FullYrAgglog"] <- "Value"
model = lm(Value ~ Month, data = FullYrAgglog)
anova = anova(model)
summary(anova)
plot(anova)
qqnorm(FullYrAgglog$Value, pch = 1, frame = FALSE)
qqline(FullYrAgglog$Value, col = "steelblue", lwd = 2)
qqnorm(FullYrAgg$Value, pch = 1, frame = FALSE)
qqline(FullYrAgg$Value, col = "steelblue", lwd = 2)

#Removing NA values from the dataframe
FullYrAgg <- FullYrAgg[complete.cases(FullYrAgg),]

#Removing Outliers from dataframe and plotting a QQ Plot of the rest
Q <- quantile(FullYrAgg$Value, probs=c(.25, .75), na.rm = FALSE)
iqr <- IQR(FullYrAgg$Value)
up <- Q[2]+1.5*iqr #Upper Range
low <- Q[1]-1.5*iqr #Lower Range
eliminated <- subset(FullYrAgg, FullYrAgg$Value > (Q[1] - 1.5*iqr) & FullYrAgg$Value < (Q[2] + 1.5*iqr))
qqnorm(eliminated$Value, pch = 1, frame = FALSE)
qqline(eliminated$Value, col = "steelblue", lwd = 2)
logeliminated <- data.frame(eliminated$Month, log10(eliminated$Value))
logeliminated <- logeliminated %>% dplyr::na_if(-Inf)
logeliminated <- logeliminated %>% dplyr::na_if(Inf)
qqnorm(logeliminated$log10.eliminated.Value., pch = 1, frame = FALSE)
qqline(logeliminated$log10.eliminated.Value., col = "steelblue", lwd = 2)

#Removing NA values from the Bias dataframe
FullYrBias <- FullYrBias[complete.cases(FullYrBias),]

#Removing Outliers from dataframe and plotting a QQ Plot of the rest
Q <- quantile(FullYrBias$Bias, probs=c(.25, .75), na.rm = FALSE)
iqr <- IQR(FullYrBias$Bias)
up <- Q[2]+1.5*iqr #Upper Range
low <- Q[1]-1.5*iqr #Lower Range
eliminated <- subset(FullYrBias, FullYrBias$Bias > (Q[1] - 1.5*iqr) & FullYrBias$Bias < (Q[2] + 1.5*iqr))
qqnorm(eliminated$Bias, pch = 1, frame = FALSE)
qqline(eliminated$Bias, col = "steelblue", lwd = 2)


library(car)
LT <- leveneTest(Value ~ Month, data=FullYrAgg)
summary(LT)

library(EnvStats)
rosnerTest(FullYrAgg$Value, k = 4, alpha = 0.05, warn = TRUE)

##assuming no homogeneity of variance
diff.aov <- oneway.test(Value ~ Month, data=FullYrAgg)
summary(diff.aov)

library(referenceIntervals)
out <- cook.outliers(FullYrAgg$Value)$outliers
install.packages("referenceIntervals")

############################## Gabby's Advice ###################################
#create linear model
model = lm(Value ~ Month, data = FullYrAgg)
fixed_model = lm(Value ~ Month, subset = cooks.distance(model) <= 4 / length(cooks.distance((model))), data = FullYrAgg)
plot(fixed_model, which = 2)

#rstandard(model)[abs(rstandard(model)) > 2]
cd_model <- cooks.distance(model)
sum(cd_model > 4 / length(cd_model)) 

fixed_model <- lm(log(Value) ~ Month, subset = cd_model < 4 / length(cd_model), data = FullYrAgg)
plot(fixed_model, which = 2, ylim = c(0, 20))

shapiro.test(resid(model))






