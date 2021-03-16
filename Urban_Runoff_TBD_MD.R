rm(list = ls(all=TRUE))
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
library(ncdf4)
library(tidyr)

workdir <- "/glade/scratch/lgray"
setwd(workdir)

##Code for Yiwen's future simulations (indexing is different from Cathy's)##
fi <- nc_open("/glade/work/yiwenz/CESM_CMIP6_Remapping/BSSP245cmip6.101.h2-mapped.QRUNOFF.201501-210012.nc")
fi <- nc_open("/glade/work/yiwenz/CESM_CMIP6_Remapping/BSSP585cmip6.101.h2-mapped.QRUNOFF.201501-210012.nc")
#QRUNOFF (288, 192, 3, 1032)
urban_runoff_array <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_ <- array(NA, c(288, 192, 3, 120))
urban_runoff_list <- as.numeric(c(312:431))
for (i in 1:120) {
  urban_runoff_array_[,,,i] <- urban_runoff_array[,,,urban_runoff_list[i]]
}

surfdata <- nc_open("/glade/p/cesmdata/inputdata/lnd/clm2/surfdata_map/release-clm5.0.18/surfdata_0.9x1.25_hist_78pfts_CMIP6_simyr1850_c190214.nc")
AREA <- ncvar_get(surfdata, varid='AREA')
AREA_ <- array(NA, c(288, 192, 120))
for (i in 1:120) {
  AREA_[ , , i] <- AREA
}

# Get QRUNOFF_U for each urban density type
QRUNOFF_U_TBD <- urban_runoff_array_[,,1,]
QRUNOFF_U_HD <- urban_runoff_array_[,,2,]
QRUNOFF_U_MD <- urban_runoff_array_[,,3,]

# Get PCT (percentage) for each udt, fill nan with 0's, and convert them to decimals
PCT_URBAN <- ncvar_get(surfdata, "PCT_URBAN")
PCT_URBAN_ <- array(NA, c(288, 192, 3, 120))
for (i in 1:120) {
  PCT_URBAN_[,,,i] <- PCT_URBAN
}

PCT_TBD <- replace_na(PCT_URBAN_[,,1,], 0)/100
PCT_HD <- replace_na(PCT_URBAN_[,,2,], 0)/100
PCT_MD <- replace_na(PCT_URBAN_[,,3,], 0)/100

PCT_URBAN <- PCT_TBD + PCT_HD + PCT_MD
QRUNOFF_U_weightedTBD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedHD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedMD <- array(NA, c(288, 192, 120))

QRUNOFF_U_weightedTBD <- (QRUNOFF_U_TBD*PCT_TBD)
QRUNOFF_U_weightedHD <- (QRUNOFF_U_HD*PCT_HD)
QRUNOFF_U_weightedMD <- (QRUNOFF_U_MD*PCT_MD)

save(list = c("QRUNOFF_U_weightedTBD", "QRUNOFF_U_weightedHD", "QRUNOFF_U_weightedMD"), file = "UrbanDensityRunoff245.RData")
save(list = c("QRUNOFF_U_weightedTBD", "QRUNOFF_U_weightedHD", "QRUNOFF_U_weightedMD"), file = "UrbanDensityRunoff585.RData")

##Code for Cathy's future simulation (indexing different than Yiwen's)##
fi <- nc_open("/glade/scratch/xinchang/cmip6_h2_remapped/BSSP370cmip6.101.h2-mapped.QRUNOFF_U.201501-210012.nc")

urban_runoff_array <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_ <- array(NA, c(3, 288, 192, 120))
urban_runoff_list <- as.numeric(c(312:431))
for (i in 1:120) {
  urban_runoff_array_[,,,i] <- urban_runoff_array[urban_runoff_list[i],,,]
}
surfdata <- nc_open("/glade/p/cesmdata/inputdata/lnd/clm2/surfdata_map/release-clm5.0.18/surfdata_0.9x1.25_hist_78pfts_CMIP6_simyr1850_c190214.nc")
AREA <- ncvar_get(surfdata, varid='AREA')
AREA_ <- array(NA, c(288, 192, 120))
for (i in 1:120) {
  AREA_[ , , i] <- AREA
}
# Get TSA_U for each urband density type
QRUNOFF_U_TBD <- urban_runoff_array_[1,,,]
QRUNOFF_U_HD <- urban_runoff_array_[2,,,]
QRUNOFF_U_MD <- urban_runoff_array_[3,,,]

# Get PCT (percentage) for each udt, fill nan with 0's, and convert them to decimals
PCT_URBAN <- ncvar_get(surfdata, "PCT_URBAN")
PCT_URBAN_ <- array(NA, c(288, 192, 3, 120))
for (i in 1:120) {
  PCT_URBAN_[,,,i] <- PCT_URBAN
}

PCT_TBD <- (PCT_URBAN_[,,1,])/100
PCT_HD <- (PCT_URBAN_[,,2,])/100
PCT_MD <- (PCT_URBAN_[,,3,])/100
#assert (np.isnan(PCT_MD)).sum() == 0 ?

# Get PCT of total urban area
PCT_URBAN <- PCT_TBD + PCT_HD + PCT_MD

QRUNOFF_U_weightedTBD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedHD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedMD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedTBD <- (QRUNOFF_U_TBD*PCT_TBD)
QRUNOFF_U_weightedHD <- (QRUNOFF_U_HD*PCT_HD)
QRUNOFF_U_weightedMD <- (QRUNOFF_U_MD*PCT_MD)

save(list = c("QRUNOFF_U_weightedTBD", "QRUNOFF_U_weightedHD", "QRUNOFF_U_weightedMD"), file = "UrbanDensityRunoff370.RData")

##General Code for getting the difference betwen TBD & MD##
QRUNOFF_U_weightedTBD[QRUNOFF_U_weightedTBD == 0] <- NA
QRUNOFF_U_weightedMD[QRUNOFF_U_weightedMD == 0] <- NA
density_difference <- (rowMeans(QRUNOFF_U_weightedTBD, dims = 2) - rowMeans(QRUNOFF_U_weightedMD, dims = 2))*3600*24*30.436875
density_difference <- as.vector(density_difference)

##Plotting for the 3 figures for future analysis##
limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2041-2050 Scenario 3-7.0") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)


flag_na <- is.na(density_difference)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2041-2050 Scenario 2-4.5") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)

limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2041-2050 Scenario 5-8.5") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)

##Code for Yiwen's present simulations (indexing is different from Cathy's)##
fi <- nc_open("/glade/work/yiwenz/CESM_CMIP6_Remapping/BSSP245cmip6.101.h2-mapped.QRUNOFF.201501-210012.nc")
fi <- nc_open("/glade/work/yiwenz/CESM_CMIP6_Remapping/BSSP585cmip6.101.h2-mapped.QRUNOFF.201501-210012.nc")

urban_runoff_array2 <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_2 <- array(NA, c(288, 192, 3, 60))
urban_runoff_list2 <- as.numeric(c(12:71))
for (i in 1:60) {
  urban_runoff_array_2[,,,i] <- urban_runoff_array2[,,,urban_runoff_list2[i]]
}

surfdata <- nc_open("surfdata_0.9x1.25_hist_78pfts_CMIP6_simyr1850_c190214.nc")
AREA2 <- ncvar_get(surfdata, "AREA")
AREA_2 <- array(NA, c(288, 192, 60))
for (i in 1:60) {
  AREA_2[ , , i] <- AREA2
}
# Get TSA_U for each urband density type
QRUNOFF_U_TBD2 <- replace_na(urban_runoff_array_2[,,1,], 0)
QRUNOFF_U_HD2 <- replace_na(urban_runoff_array_2[,,2,], 0)
QRUNOFF_U_MD2 <- replace_na(urban_runoff_array_2[,,3,], 0)

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

QRUNOFF_U_weightedTBD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedHD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedMD <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedTBD2 <- (QRUNOFF_U_TBD2*PCT_TBD2)
QRUNOFF_U_weightedHD2 <- (QRUNOFF_U_HD2*PCT_HD2)
QRUNOFF_U_weightedMD2 <- (QRUNOFF_U_MD2*PCT_MD2)

save(list = c("QRUNOFF_U_weightedTBD2", "QRUNOFF_U_weightedHD2", "QRUNOFF_U_weightedMD2"), file = "UrbanDensityRunoffPresent245.RData")
save(list = c("QRUNOFF_U_weightedTBD2", "QRUNOFF_U_weightedHD2", "QRUNOFF_U_weightedMD2"), file = "UrbanDensityRunoffPresent585.RData")

##Code for Cathy's future simulation (indexing different than Yiwen's)##
fi <- nc_open("/glade/scratch/xinchang/cmip6_h2_remapped/BSSP370cmip6.101.h2-mapped.QRUNOFF_U.201501-210012.nc")
urban_runoff_array2 <- ncvar_get(fi, "QRUNOFF")
urban_runoff_array_2 <- array(NA, c(3, 288, 192, 60))
urban_runoff_list2 <- as.numeric(c(12:71))
for (i in 1:60) {
  urban_runoff_array_2[,,,i] <- urban_runoff_array2[urban_runoff_list2[i],,,]
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

# Get PCT of total urban area
PCT_URBAN2 <- PCT_TBD2 + PCT_HD2 + PCT_MD2

QRUNOFF_U_weightedTBD2 <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedHD2 <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedMD2 <- array(NA, c(288, 192, 120))
QRUNOFF_U_weightedTBD2 <- (QRUNOFF_U_TBD2*PCT_TBD2)
QRUNOFF_U_weightedHD2 <- (QRUNOFF_U_HD2*PCT_HD2)
QRUNOFF_U_weightedMD2 <- (QRUNOFF_U_MD2*PCT_MD2)

save(list = c("QRUNOFF_U_weightedTBD2", "QRUNOFF_U_weightedHD2", "QRUNOFF_U_weightedMD2"), file = "UrbanDensityRunoffPresent370.RData")

QRUNOFF_U_weightedTBD2[QRUNOFF_U_weightedTBD2 == 0] <- NA
QRUNOFF_U_weightedMD2[QRUNOFF_U_weightedMD2 == 0] <- NA
density_difference <- (rowMeans(QRUNOFF_U_weightedTBD2, dims = 2) - rowMeans(QRUNOFF_U_weightedMD2, dims = 2))*3600*24*30.436875
density_difference <- as.vector(density_difference)

limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2016-2020 Scenario 3-7.0") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)


flag_na <- is.na(density_difference)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2016-2020 Scenario 2-4.5") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)

limits = c(-20, 20)
labels = c("-20", "-10", "0", "10", "20")
breaks = c(-20, -10, 0, 10, 20)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "grey54", colour = "grey50") +
  theme(text= element_text(size = 18), legend.position="bottom", 
        plot.title = element_text(size = 18, face = "bold", margin=margin(20,0,20,0, unit="pt")),
        panel.background = element_rect(fill = "grey63", colour = "grey63")) +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  ggtitle("Difference of TBD-MD Density 2016-2020 Scenario 5-8.5") +
  geom_point(data = as.data.frame(density_difference), aes(x = CESM_lon, y = CESM_lat, colour = density_difference), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Average Monthly Weighted Urban Runoff Difference (mm/month)     ",sep="")),
                        palette = "OrRd",
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks,
                        direction = -1)
p <- p + theme(legend.title = element_text(size = 16), 
               legend.text = element_text(size = 6))
show(p)

