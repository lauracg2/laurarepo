############################## Background Code ###############################################
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
library(ncdf4)
workdir <- "/glade/scratch/lgray/comp_runoff_hdeg"
setwd(workdir)

grdcnames <- NULL
for (year in 1986:1995){
  for (month in 1:12) {
    filename<- paste0("comp_runoff_hd_",sprintf("%04d",year),sprintf("%02d",month),".asc")
    print(filename)
    grdcnames = rbind(grdcnames, filename)
  }
}

GRDC_m <- array(NA, c(720, 360, 120))
for (i in 1:length(grdcnames)) {
  grdcdata <- read.ascii.grid(grdcnames[i, 1], return.header=FALSE, print = 0,
                              nodata.values = c(), at.once = TRUE, na.strings = "NA")
  grdcdata <- t(grdcdata)
  grdcdata <- grdcdata[,order(ncol(grdcdata):1)]
  grdcdata <- grdcdata %>% dplyr::na_if(-88)
  GRDC_m[ , , i] <- grdcdata
}

### GRDC Lat & Lon ###
#lon
lon <- seq(-179.75, 179.75, 0.5)
lon2D <- kronecker(matrix(1, 1, 360), lon)

#lat
lat <- seq(-89.75, 89.75, 0.5)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 720, 1), lat)

flag_na <- is.na(as.vector(GRDC_m[,,1]))
GRDClat2D <- as.vector(lat2D)
GRDClat2D[flag_na] <- NA
GRDClon2D <- as.vector(lon2D)
GRDClon2D[flag_na] <- NA

### CESM Lat & Lon ###
workdir <- "/glade/scratch/lgray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
runoff_array <- ncvar_get(fi, "QRUNOFF")
CJan86 <- runoff_array[, , 1633]
CJan86 <- CJan86*3600*24*31

#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 192), lon)
lon2D[!is.na(lon2D) & lon2D >= 180] <- lon2D[!is.na(lon2D) & lon2D >= 180] - 360

#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 288, 1), lat)

runoff_vector <- as.vector(CJan86)
flag_na <- is.na(runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

############## Projected for loop once I get the previous one working ##################
#how I think the overall aggregation for loop should look (something like this ?)
GRDC_agg2 <- array(NA,c(288,192,120))
for (k in 61:120) {
  cat(paste("********* ",as.character(k)," *******"),sep='\n')
  dLatCESM<-0.9424; dLonCESM<-1.25;
  for (i in 1:288) {
    for (j in 1:192) {
      cat(paste("********* ",as.character(i), ",", as.character(j), " *******"),sep='\n')
      edgeLat<-c(lat2D[i,j]-dLatCESM/2,lat2D[i,j]+dLatCESM/2)
      edgeLon<-c(lon2D[i,j]-dLonCESM/2,lon2D[i,j]+dLonCESM/2)
      isIn <- (GRDClat2D>edgeLat[1] & GRDClat2D<edgeLat[2] & GRDClon2D>edgeLon[1] & GRDClon2D<edgeLon[2])
      sum(sum(isIn,na.rm = T))
      GRDC_agg2[i,j,k]<-mean(GRDC_m[,,k][isIn], na.rm = T)
    }
  }
}

save(list = c("GRDC_m", "GRDC_agg2"), file = "GRDC_Aggregation2.RData")
load("GRDC_Aggregation.RData")