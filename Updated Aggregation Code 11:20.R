library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_hdeg"
setwd(workdir)

Jan86 <- read.ascii.grid("comp_runoff_hd_198601.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan86 <- t(Jan86)
Jan86 <- Jan86[,order(ncol(Jan86):1)]
Jan86 <- Jan86 %>% dplyr::na_if(-88)

library(ncdf4)
workdir <- "/Users/lauragray"
setwd(workdir)
fi <- nc_open("b.e21.BHIST.f09_g17.CMIP6-historical.001.clm2.h0.QRUNOFF.185001-201412.nc")
surface_runoff_array <- ncvar_get(fi, "QRUNOFF")

CJan86 <- surface_runoff_array[, , 1633]
CJan86 <- CJan86*3600*24*31

data <- array(data = NA, dim = c(360, 720))
data <- data.frame(data)
for (year in 1986:1995){
  for (month in 1:12) {
    filename <- paste0("comp_runoff_hd_",sprintf("%04d",year),sprintf("%02d",month),".asc")
    print(filename)
    data[[i]] <- read.ascii.grid(filename, return.header=FALSE, print = 0,
                    nodata.values = c(), at.once = TRUE, na.strings = "NA")
    i <- i+1
  }
}

grdcnames <- NULL
for (year in 1986:1995){
  for (month in 1:12) {
    filename<- paste0("comp_runoff_hd_",sprintf("%04d",year),sprintf("%02d",month),".asc")
    print(filename)
    grdcnames = rbind(grdcnames, data.frame(filename))
  }
}


GRDCfiles <- NULL
for (i in grdcnames) {
  grdcdata[i] <- read.ascii.grid(i, return.header=FALSE, print = 0,
                              nodata.values = c(), at.once = TRUE, na.strings = "NA")
  
   i <- i+1
   #GRDCfiles <- rbind(GRDCfiles, data.frame(grdcdata))
}



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

