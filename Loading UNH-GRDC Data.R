rm(list = ls(all=TRUE))
library(RSAGA)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data/comp_runoff_1deg"
setwd(workdir)
mydata0 <- read.ascii.grid("comp_runoff_1d_198601.asc", return.header=TRUE, print = 0, 
                nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- read.ascii.grid("comp_runoff_1d_198601.asc", return.header=FALSE, print = 0, 
                nodata.values = c(), at.once = TRUE, na.strings = "NA")
mydata <- as.data.frame(mydata)
