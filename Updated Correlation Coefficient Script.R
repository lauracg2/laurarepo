library(ncdf4)
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
runoff_array <- ncvar_get(fi, "QRUNOFF")

######## Pulling CESM Files through For Loop, not changing to mm/month ###############
CESM_m <- array(NA, c(288, 192, 120))
for (j in 1:120) {
  for (i in 1633:1752) {
    cesmdata <- surface_runoff_array[, , i]
    CESM_m[ , , j] <- cesmdata
  }
}

################# Pulling CESM Files changing to mm/month ##########################
library(ncdf4)
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")

CJan86 <- surface_runoff_array[, , 1633]
CJan86 <- CJan86*3600*24*31
CFeb86 <- surface_runoff_array[, , 1634]
CFeb86 <- CFeb86*3600*24*28
CMar86 <- surface_runoff_array[, , 1635]
CMar86 <- CMar86*3600*24*31
CApr86 <- surface_runoff_array[, , 1636]
CApr86 <- CApr86*3600*24*30
CMay86 <- surface_runoff_array[, , 1637]
CMay86 <- CMay86*3600*24*31
CJun86 <- surface_runoff_array[, , 1638]
CJun86 <- CJun86*3600*24*30
CJul86 <- surface_runoff_array[, , 1639]
CJul86 <- CJul86*3600*24*31
CAug86 <- surface_runoff_array[, , 1640]
CAug86 <- CAug86*3600*24*31
CSep86 <- surface_runoff_array[, , 1641]
CSep86 <- CSep86*3600*24*30
COct86 <- surface_runoff_array[, , 1642]
COct86 <- COct86*3600*24*31
CNov86 <- surface_runoff_array[, , 1643]
CNov86 <- CNov86*3600*24*30
CDec86 <- surface_runoff_array[, , 1644]
CDec86 <- CDec86*3600*24*31
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
CJan88 <- surface_runoff_array[, , 1657]
CJan88 <- CJan88*3600*24*31
CFeb88 <- surface_runoff_array[, , 1658]
CFeb88 <- CFeb88*3600*24*29
CMar88 <- surface_runoff_array[, , 1659]
CMar88 <- CMar88*3600*24*31
CApr88 <- surface_runoff_array[, , 1660]
CApr88 <- CApr88*3600*24*30
CMay88 <- surface_runoff_array[, , 1661]
CMay88 <- CMay88*3600*24*31
CJun88 <- surface_runoff_array[, , 1662]
CJun88 <- CJun88*3600*24*30
CJul88 <- surface_runoff_array[, , 1663]
CJul88 <- CJul88*3600*24*31
CAug88 <- surface_runoff_array[, , 1664]
CAug88 <- CAug88*3600*24*31
CSep88 <- surface_runoff_array[, , 1665]
CSep88 <- CSep88*3600*24*30
COct88 <- surface_runoff_array[, , 1666]
COct88 <- COct88*3600*24*31
CNov88 <- surface_runoff_array[, , 1667]
CNov88 <- CNov88*3600*24*30
CDec88 <- surface_runoff_array[, , 1668]
CDec88 <- CDec88*3600*24*31
CJan89 <- surface_runoff_array[, , 1669]
CJan89 <- CJan89*3600*24*31
CFeb89 <- surface_runoff_array[, , 1670]
CFeb89 <- CFeb89*3600*24*28
CMar89 <- surface_runoff_array[, , 1671]
CMar89 <- CMar89*3600*24*31
CApr89 <- surface_runoff_array[, , 1672]
CApr89 <- CApr89*3600*24*30
CMay89 <- surface_runoff_array[, , 1673]
CMay89 <- CMay89*3600*24*31
CJun89 <- surface_runoff_array[, , 1674]
CJun89 <- CJun89*3600*24*30
CJul89 <- surface_runoff_array[, , 1675]
CJul89 <- CJul89*3600*24*31
CAug89 <- surface_runoff_array[, , 1676]
CAug89 <- CAug89*3600*24*31
CSep89 <- surface_runoff_array[, , 1677]
CSep89 <- CSep89*3600*24*30
COct89 <- surface_runoff_array[, , 1678]
COct89 <- COct89*3600*24*31
CNov89 <- surface_runoff_array[, , 1679]
CNov89 <- CNov89*3600*24*30
CDec89 <- surface_runoff_array[, , 1680]
CDec89 <- CDec89*3600*24*31
CJan90 <- surface_runoff_array[, , 1681]
CJan90 <- CJan90*3600*24*31
CFeb90 <- surface_runoff_array[, , 1682]
CFeb90 <- CFeb90*3600*24*28
CMar90 <- surface_runoff_array[, , 1683]
CMar90 <- CMar90*3600*24*31
CApr90 <- surface_runoff_array[, , 1684]
CApr90 <- CApr90*3600*24*30
CMay90 <- surface_runoff_array[, , 1685]
CMay90 <- CMay90*3600*24*31
CJun90 <- surface_runoff_array[, , 1686]
CJun90 <- CJun90*3600*24*30
CJul90 <- surface_runoff_array[, , 1687]
CJul90 <- CJul90*3600*24*31
CAug90 <- surface_runoff_array[, , 1688]
CAug90 <- CAug90*3600*24*31
CSep90 <- surface_runoff_array[, , 1689]
CSep90 <- CSep90*3600*24*30
COct90 <- surface_runoff_array[, , 1690]
COct90 <- COct90*3600*24*31
CNov90 <- surface_runoff_array[, , 1691]
CNov90 <- CNov90*3600*24*30
CDec90 <- surface_runoff_array[, , 1692]
CDec90 <- CDec90*3600*24*31
CJan91 <- surface_runoff_array[, , 1693]
CJan91 <- CJan91*3600*24*31
CFeb91 <- surface_runoff_array[, , 1694]
CFeb91 <- CFeb91*3600*24*28
CMar91 <- surface_runoff_array[, , 1695]
CMar91 <- CMar91*3600*24*31
CApr91 <- surface_runoff_array[, , 1696]
CApr91 <- CApr91*3600*24*30
CMay91 <- surface_runoff_array[, , 1697]
CMay91 <- CMay91*3600*24*31
CJun91 <- surface_runoff_array[, , 1698]
CJun91 <- CJun91*3600*24*30
CJul91 <- surface_runoff_array[, , 1699]
CJul91 <- CJul91*3600*24*31
CAug91 <- surface_runoff_array[, , 1700]
CAug91 <- CAug91*3600*24*31
CSep91 <- surface_runoff_array[, , 1701]
CSep91 <- CSep91*3600*24*30
COct91 <- surface_runoff_array[, , 1702]
COct91 <- COct91*3600*24*31
CNov91 <- surface_runoff_array[, , 1703]
CNov91 <- CNov91*3600*24*30
CDec91 <- surface_runoff_array[, , 1704]
CDec91 <- CDec91*3600*24*31
CJan92 <- surface_runoff_array[, , 1705]
CJan92 <- CJan92*3600*24*31
CFeb92 <- surface_runoff_array[, , 1706]
CFeb92 <- CFeb92*3600*24*29
CMar92 <- surface_runoff_array[, , 1707]
CMar92 <- CMar92*3600*24*31
CApr92 <- surface_runoff_array[, , 1708]
CApr92 <- CApr92*3600*24*30
CMay92 <- surface_runoff_array[, , 1709]
CMay92 <- CMay92*3600*24*31
CJun92 <- surface_runoff_array[, , 1710]
CJun92 <- CJun92*3600*24*30
CJul92 <- surface_runoff_array[, , 1711]
CJul92 <- CJul92*3600*24*31
CAug92 <- surface_runoff_array[, , 1712]
CAug92 <- CAug92*3600*24*31
CSep92 <- surface_runoff_array[, , 1713]
CSep92 <- CSep92*3600*24*30
COct92 <- surface_runoff_array[, , 1714]
COct92 <- COct92*3600*24*31
CNov92 <- surface_runoff_array[, , 1715]
CNov92 <- CNov92*3600*24*30
CDec92 <- surface_runoff_array[, , 1716]
CDec92 <- CDec92*3600*24*31
CJan93 <- surface_runoff_array[, , 1717]
CJan93 <- CJan93*3600*24*31
CFeb93 <- surface_runoff_array[, , 1718]
CFeb93 <- CFeb93*3600*24*28
CMar93 <- surface_runoff_array[, , 1719]
CMar93 <- CMar93*3600*24*31
CApr93 <- surface_runoff_array[, , 1720]
CApr93 <- CApr93*3600*24*30
CMay93 <- surface_runoff_array[, , 1721]
CMay93 <- CMay93*3600*24*31
CJun93 <- surface_runoff_array[, , 1722]
CJun93 <- CJun93*3600*24*30
CJul93 <- surface_runoff_array[, , 1723]
CJul93 <- CJul93*3600*24*31
CAug93 <- surface_runoff_array[, , 1724]
CAug93 <- CAug93*3600*24*31
CSep93 <- surface_runoff_array[, , 1725]
CSep93 <- CSep93*3600*24*30
COct93 <- surface_runoff_array[, , 1726]
COct93 <- COct93*3600*24*31
CNov93 <- surface_runoff_array[, , 1727]
CNov93 <- CNov93*3600*24*30
CDec93 <- surface_runoff_array[, , 1728]
CDec93 <- CDec93*3600*24*31
CJan94 <- surface_runoff_array[, , 1729]
CJan94 <- CJan94*3600*24*31
CFeb94 <- surface_runoff_array[, , 1730]
CFeb94 <- CFeb94*3600*24*28
CMar94 <- surface_runoff_array[, , 1731]
CMar94 <- CMar94*3600*24*31
CApr94 <- surface_runoff_array[, , 1732]
CApr94 <- CApr94*3600*24*30
CMay94 <- surface_runoff_array[, , 1733]
CMay94 <- CMay94*3600*24*31
CJun94 <- surface_runoff_array[, , 1734]
CJun94 <- CJun94*3600*24*30
CJul94 <- surface_runoff_array[, , 1735]
CJul94 <- CJul94*3600*24*31
CAug94 <- surface_runoff_array[, , 1736]
CAug94 <- CAug94*3600*24*31
CSep94 <- surface_runoff_array[, , 1737]
CSep94 <- CSep94*3600*24*30
COct94 <- surface_runoff_array[, , 1738]
COct94 <- COct94*3600*24*31
CNov94 <- surface_runoff_array[, , 1739]
CNov94 <- CNov94*3600*24*30
CDec94 <- surface_runoff_array[, , 1740]
CDec94 <- CDec94*3600*24*31
CJan95 <- surface_runoff_array[, , 1741]
CJan95 <- CJan95*3600*24*31
CFeb95 <- surface_runoff_array[, , 1742]
CFeb95 <- CFeb95*3600*24*28
CMar95 <- surface_runoff_array[, , 1743]
CMar95 <- CMar95*3600*24*31
CApr95 <- surface_runoff_array[, , 1744]
CApr95 <- CApr95*3600*24*30
CMay95 <- surface_runoff_array[, , 1745]
CMay95 <- CMay95*3600*24*31
CJun95 <- surface_runoff_array[, , 1746]
CJun95 <- CJun95*3600*24*30
CJul95 <- surface_runoff_array[, , 1747]
CJul95 <- CJul95*3600*24*31
CAug95 <- surface_runoff_array[, , 1748]
CAug95 <- CAug95*3600*24*31
CSep95 <- surface_runoff_array[, , 1749]
CSep95 <- CSep95*3600*24*30
COct95 <- surface_runoff_array[, , 1750]
COct95 <- COct95*3600*24*31
CNov95 <- surface_runoff_array[, , 1751]
CNov95 <- CNov95*3600*24*30
CDec95 <- surface_runoff_array[, , 1752]
CDec95 <- CDec95*3600*24*31
FullCESM <- array(c(CJan86, CFeb86, CMar86, CApr86, CMay86, CJun86, CJul86, CAug86, CSep86, COct86, CNov86, CDec86,
                  CJan87, CFeb87, CMar87, CApr87, CMay87, CJun87, CJul87, CAug87, CSep87, COct87, CNov87, CDec87,
                  CJan88, CFeb88, CMar88, CApr88, CMay88, CJun88, CJul88, CAug88, CSep88, COct88, CNov88, CDec88,
                  CJan89, CFeb89, CMar89, CApr89, CMay89, CJun89, CJul89, CAug89, CSep89, COct89, CNov89, CDec89,
                  CJan90, CFeb90, CMar90, CApr90, CMay90, CJun90, CJul90, CAug90, CSep90, COct90, CNov90, CDec90,
                  CJan91, CFeb91, CMar91, CApr91, CMay91, CJun91, CJul91, CAug91, CSep91, COct91, CNov91, CDec91,
                  CJan92, CFeb92, CMar92, CApr92, CMay92, CJun92, CJul92, CAug92, CSep92, COct92, CNov92, CDec92,
                  CJan93, CFeb93, CMar93, CApr93, CMay93, CJun93, CJul93, CAug93, CSep93, COct93, CNov93, CDec93,
                  CJan94, CFeb94, CMar94, CApr94, CMay94, CJun94, CJul94, CAug94, CSep94, COct94, CNov94, CDec94,
                  CJan95, CFeb95, CMar95, CApr95, CMay95, CJun95, CJul95, CAug95, CSep95, COct95, CNov95, CDec95), dim = c(288, 192, 120))

########################### CORRELATION COEFFICIENT #############################
load("GRDC_Aggregation1.RData")
load("GRDC_Aggregation2.RData")
GRDC_agg <- array(NA, c(288,192,120))
for (i in 1:60) {
  GRDC_agg[,,i] <- GRDC_agg1[,,i]
}
for (i in 61:120) {
  GRDC_agg[,,i] <- GRDC_agg2[,,i]
}
GRDCflag<-is.na(GRDC_agg)
GRDC_agg[GRDCflag]<-NA

rho_runoff <- array(NA, c(288,192))
for (i in 1:288) {
  for (j in 1:192) {
    rho_runoff[i,j] <- cor(GRDC_agg[i,j, ], FullCESM[i,j, ], use = "pairwise.complete.obs")
  }
}  

library(ncdf4)
library(ggplot2)
library(maps)
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
urban_lat <- as.vector(lat2D)
urban_lon <- as.vector(lon2D)

#graphics
limits = c(0.0, 700)
labels = c("0","100", "200", "300", "400", "500", "600", "700")
breaks = c(0, 100, 200, 300, 400, 500, 600, 700)

rho_runoff <- as.vector(rho_runoff)
map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(rho_runoff), aes(x = urban_lon, y = urban_lat, colour = rho_runoff), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Correlation Coefficient",sep="")),
                        palette = "OrRd")
#limits = limits,
#labels = labels,
#breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)

GRDCFeb87_agg <- read.csv("GRDC Feb87 Aggregation.csv", header = TRUE)

