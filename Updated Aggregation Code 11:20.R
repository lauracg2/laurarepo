############################## Background Code ###############################################
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)

library(ncdf4)
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")

CJan86 <- surface_runoff_array[, , 1633]
CJan86 <- CJan86*3600*24*31

######## This for loop does work! But all it does is paste the names in a dataframe ##############################
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

############## Projected for loop once I get the previous one working ##################
#how I think the overall aggregation for loop should look (something like this ?)
for (k in 1:120) {
  cat(paste("********* ",as.character(k)," *******"),sep='\n')
  GRDC_agg <- array(NA,c(288,192,120))
  dLatCESM<-0.9424; dLonCESM<-1.25;
  for (i in 1:288) {
    for (j in 1:192) {
      cat(paste("********* ",as.character(i), ",", as.character(j), " *******"),sep='\n')
      edgeLat<-c(lat2D[i,j]-dLatCESM/2,lat2D[i,j]+dLatCESM/2)
      edgeLon<-c(lon2D[i,j]-dLonCESM/2,lon2D[i,j]+dLonCESM/2)
      isIn <- (GRDClat2D>edgeLat[1] & GRDClat2D<edgeLat[2] & GRDClon2D>edgeLon[1] & GRDClon2D<edgeLon[2])
      sum(sum(isIn,na.rm = T))
      GRDC_agg[i,j,k]<-mean(GRDC_m[,,k][isIn], na.rm = T)
    }
  }
}

save(list = c("GRDC_m", "GRDC_agg"), file = "GRDC_Aggregation.RData")
load("GRDC_Aggregation.RData")

############### Original aggregation for one file for reference ####################

GRDC_agg<-array(NA,c(288,192))
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:288) {
  for (j in 1:192) {
    cat(paste("********* ",as.character(i), ",", as.character(j), " *******"),sep='\n')
    edgeLat<-c(lat2D[i,j]-dLatCESM/2,lat2D[i,j]+dLatCESM/2)
    edgeLon<-c(lon2D[i,j]-dLonCESM/2,lon2D[i,j]+dLonCESM/2)
    isIn <- (GRDClat2D>edgeLat[1] & GRDClat2D<edgeLat[2] & GRDClon2D>edgeLon[1] & GRDClon2D<edgeLon[2])
    sum(sum(isIn,na.rm = T))
    GRDC_agg[i,j]<-mean(Jan86[isIn], na.rm = T)
  }
}