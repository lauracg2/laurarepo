rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
library(ncdf4)
library(tidyr)

workdir <- "~/Downloads/Research/laurarepo"
setwd(workdir)


#####Getting the selected Urban Runoff Values and Obtaining the Weighted QRUNOFF_U for 2041-2050####
fi <- nc_open("BSSP370cmip6.101.h2-mapped.QRUNOFF_U.201501-210012.nc")
urban_runoff_array <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_ <- array(NA, c(3, 288, 192, 120))
for (i in 1:120) {
  for (j in 312:431) {
    urban_runoff_array_[,,,i] <- urban_runoff_array[j,,,]
  }
}

surfdata <- nc_open("surfdata_0.9x1.25_hist_78pfts_CMIP6_simyr1850_c190214.nc")
AREA <- ncvar_get(surfdata, "AREA")
AREA_ <- array(NA, c(288, 192, 120))
for (i in 1:120) {
  AREA_[ , , i] <- AREA
}
# Get TSA_U for each urband density type
QRUNOFF_U_TBD <- replace_na(urban_runoff_array_[1,,,], 0)
QRUNOFF_U_HD <- replace_na(urban_runoff_array_[2,,,], 0)
QRUNOFF_U_MD <- replace_na(urban_runoff_array_[3,,,], 0)

# Get PCT (percentage) for each udt, fill nan with 0's, and convert them to decimals
PCT_URBAN <- ncvar_get(surfdata, "PCT_URBAN")
PCT_URBAN_ <- array(NA, c(288, 192, 3, 120))
for (i in 1:120) {
  PCT_URBAN_[,,,i] <- PCT_URBAN
}

PCT_TBD <- replace_na(PCT_URBAN_[,,1,], 0)/100
PCT_HD <- replace_na(PCT_URBAN_[,,2,], 0)/100
PCT_MD <- replace_na(PCT_URBAN_[,,3,], 0)/100
#assert (np.isnan(PCT_MD)).sum() == 0 ?

# Get PCT of total urban area
PCT_URBAN <- PCT_TBD + PCT_HD + PCT_MD
QRUNOFF_U_weightedsum <- array(0, c(288, 192, 120))

QRUNOFF_U_weightedsum <- (QRUNOFF_U_TBD*PCT_TBD)*AREA_
QRUNOFF_U_weightedsum <- QRUNOFF_U_weightedsum + ((QRUNOFF_U_HD*PCT_HD)*AREA_)
QRUNOFF_U_weightedsum <- QRUNOFF_U_weightedsum + ((QRUNOFF_U_MD*PCT_MD)*AREA_)

QRUNOFF_U_weighted <- QRUNOFF_U_weightedsum / (AREA_*PCT_URBAN)


##Get DJF and JJA Weighted Runoff
DJF_QRUNOFF_U_weighted <- array(NA, c(288, 192, 30))
DJF_list <- list(1,2,12,13,14,24,25,26,36,37,38,48,49,50,60,61,62,72,73,74,84,85,86,96,97,98,108,109,110,120)
for (i in 1:30) {
  for (j in (DJF_list)) {
    DJF_QRUNOFF_U_weighted[,,i] <- QRUNOFF_U_weighted[,,j]
  }
}

JJA_QRUNOFF_U_weighted <- array(NA, c(288, 192, 30))
JJA_list <- list(6,7,8,18,19,20,30,31,32,42,43,44,54,55,56,66,67,68,78,79,80,90,91,92,102,103,104,114,115,116)
for (i in 1:30) {
  for (j in (JJA_list)) {
    JJA_QRUNOFF_U_weighted[,,i] <- QRUNOFF_U_weighted[,,j]
  }
}

Decadal_Mean_Future <- rowMeans(QRUNOFF_U_weighted, dims = 2)
Decadal_Mean_Future <- as.vector(Decadal_Mean_Future)

##Graphics## 
#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

flag_na <- is.na(Decadal_Mean_Future)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)


map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Decadal Mean of Weighted Urban Runoff from 2041-2050") +
  geom_point(data = as.data.frame(Decadal_Mean_Future), aes(x = CESM_lon, y = CESM_lat, colour = Decadal_Mean_Future), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Montly Weighted Urban Runoff (mm/s)     ",sep="")),
                        palette = "BrBG",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = 1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 14))
show(p)


#####Getting the selected Urban Runoff Values and Obtaining the Weighted QRUNOFF_U for 2015-2020####
fi <- nc_open("BSSP370cmip6.101.h2-mapped.QRUNOFF_U.201501-210012.nc")
urban_runoff_array2 <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_2 <- array(NA, c(3, 288, 192, 60))
for (i in 1:60) {
  for (j in 12:71) {
    urban_runoff_array_2[,,,i] <- urban_runoff_array2[j,,,]
  }
}

surfdata <- nc_open("surfdata_0.9x1.25_hist_78pfts_CMIP6_simyr1850_c190214.nc")
AREA2 <- ncvar_get(surfdata, "AREA")
AREA_2 <- array(NA, c(288, 192, 60))
for (i in 1:60) {
  AREA_2[ , , i] <- AREA2
}
# Get TSA_U for each urband density type
QRUNOFF_U_TBD2 <- replace_na(urban_runoff_array_2[1,,,], 0)
QRUNOFF_U_HD2 <- replace_na(urban_runoff_array_2[2,,,], 0)
QRUNOFF_U_MD2 <- replace_na(urban_runoff_array_2[3,,,], 0)

# Get PCT (percentage) for each udt, fill nan with 0's, and convert them to decimals
PCT_URBAN2 <- ncvar_get(surfdata, "PCT_URBAN")
PCT_URBAN_2 <- array(NA, c(288, 192, 3, 60))
for (i in 1:60) {
  PCT_URBAN_2[,,,i] <- PCT_URBAN2
}

PCT_TBD2 <- replace_na(PCT_URBAN_2[,,1,], 0)/100
PCT_HD2 <- replace_na(PCT_URBAN_2[,,2,], 0)/100
PCT_MD2 <- replace_na(PCT_URBAN_2[,,3,], 0)/100
#assert (np.isnan(PCT_MD)).sum() == 0 ?

# Get PCT of total urban area
PCT_URBAN2 <- PCT_TBD2 + PCT_HD2 + PCT_MD2
QRUNOFF_U_weightedsum2 <- array(0, c(288, 192, 60))

QRUNOFF_U_weightedsum2 <- (QRUNOFF_U_TBD2*PCT_TBD2)*AREA_2
QRUNOFF_U_weightedsum2 <- QRUNOFF_U_weightedsum2 + ((QRUNOFF_U_HD2*PCT_HD2)*AREA_2)
QRUNOFF_U_weightedsum2 <- QRUNOFF_U_weightedsum2 + ((QRUNOFF_U_MD2*PCT_MD2)*AREA_2)

QRUNOFF_U_weighted2 <- QRUNOFF_U_weightedsum2 / (AREA_2*PCT_URBAN2)


##Get DJF and JJA Weighted Runoff
DJF_QRUNOFF_U_weighted2 <- array(NA, c(288, 192, 15))
DJF_list2 <- list(1,2,12,13,14,24,25,26,36,37,38,48,49,50,60)
for (i in 1:14) {
  for (j in (DJF_list2)) {
    DJF_QRUNOFF_U_weighted2[,,i] <- QRUNOFF_U_weighted2[,,j]
  }
}

JJA_QRUNOFF_U_weighted2 <- array(NA, c(288, 192, 15))
JJA_list2 <- list(6,7,8,18,19,20,30,31,32,42,43,44,54,55,56)
for (i in 1:15) {
  for (j in (JJA_list2)) {
    JJA_QRUNOFF_U_weighted[,,i] <- QRUNOFF_U_weighted[,,j]
  }
}

Decadal_Mean_Present <- rowMeans(QRUNOFF_U_weighted2, dims = 2)
Decadal_Mean_Present <- as.vector(Decadal_Mean_Present)

Mean_Difference <- Decadal_Mean_Future - Decadal_Mean_Present
Mean_Difference <- as.vector(Mean_Difference)
Mean_Difference <- Mean_Difference*3600*30.436875

##Graphics for Mean Difference between 2016-2020 and 2041-2050## 
#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

flag_na <- is.na(Mean_Difference)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-30, 30)
labels = c("-30", "-15", "0", "15", "30")
breaks = c(-30, -15, 0, 15, 30)


map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of Average Monthly Runoff Betwen 2041-2050 and 2016-2020") +
  geom_point(data = as.data.frame(Mean_Difference), aes(x = CESM_lon, y = CESM_lat, colour = Mean_Difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Montly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "BrBG",
                        limits = limits,
                        labels = labels,
                        breaks = breaks,
                        direction = 1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)


##Graphics for DJF Difference between 2016-2020 and 2041-2050## 
DJF_Mean_Future <- rowMeans(DJF_QRUNOFF_U_weighted, dims = 2)
DJF_Mean_Future <- as.vector(DJF_Mean_Future)
DJF_Mean_Present <- rowMeans(DJF_QRUNOFF_U_weighted2, dims = 2)
DJF_Mean_Present <- as.vector(DJF_Mean_Present)

DJF_Difference <- DJF_Mean_Future - DJF_Mean_Present
DJF_Difference <- as.vector(DJF_Difference)
DJF_Difference <- DJF_Difference*3600*30.436875

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

flag_na <- is.na(DJF_Difference)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)


map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of DJF Average Monthly Runoff Betwen 2041-2050 and 2016-2020") +
  geom_point(data = as.data.frame(DJF_Difference), aes(x = CESM_lon, y = CESM_lat, colour = DJF_Difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Montly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "BrBG",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = 1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)


JJA_Mean_Future <- rowMeans(JJA_QRUNOFF_U_weighted, dims = 2)
JJA_Mean_Future <- as.vector(JJA_Mean_Future)
JJA_Mean_Present <- rowMeans(JJA_QRUNOFF_U_weighted2, dims = 2)
JJA_Mean_Present <- as.vector(JJA_Mean_Present)

JJA_Difference <- JJA_Mean_Future - JJA_Mean_Present
JJA_Difference <- as.vector(JJA_Difference)
JJA_Difference <- JJA_Difference*3600*30.436875

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

flag_na <- is.na(JJA_Difference)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-200, 400)
labels = c("-200", "0", "200", "400")
breaks = c(-200, 0, 200, 400)


map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of JJA Average Monthly Runoff Betwen 2041-2050 and 2016-2020") +
  geom_point(data = as.data.frame(JJA_Difference), aes(x = CESM_lon, y = CESM_lat, colour = JJA_Difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Montly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "BrBG",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = 1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)

