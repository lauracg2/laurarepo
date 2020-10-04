#rm(list = ls(all=TRUE))

############################## Pull GRDC Files ###################################
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

Jan88 <- read.ascii.grid("comp_runoff_hd_198801.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan88 <- Jan88 %>% dplyr::na_if(-88)
Feb88 <- read.ascii.grid("comp_runoff_hd_198802.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb88 <- Feb88 %>% dplyr::na_if(-88)
Mar88 <- read.ascii.grid("comp_runoff_hd_198803.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar88 <- Mar88 %>% dplyr::na_if(-88)
Apr88 <- read.ascii.grid("comp_runoff_hd_198804.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr88 <- Apr88 %>% dplyr::na_if(-88)
May88 <- read.ascii.grid("comp_runoff_hd_198805.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May88 <- May88 %>% dplyr::na_if(-88)
Jun88 <- read.ascii.grid("comp_runoff_hd_198806.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun88 <- Jun88 %>% dplyr::na_if(-88)
Jul88 <- read.ascii.grid("comp_runoff_hd_198807.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul88 <- Jul88 %>% dplyr::na_if(-88)
Aug88 <- read.ascii.grid("comp_runoff_hd_198808.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug88 <- Aug88 %>% dplyr::na_if(-88)
Sep88 <- read.ascii.grid("comp_runoff_hd_198809.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep88 <- Sep88 %>% dplyr::na_if(-88)
Oct88 <- read.ascii.grid("comp_runoff_hd_198810.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct88 <- Oct88 %>% dplyr::na_if(-88)
Nov88 <- read.ascii.grid("comp_runoff_hd_198811.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov88 <- Nov88 %>% dplyr::na_if(-88)
Dec88 <- read.ascii.grid("comp_runoff_hd_198812.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec88 <- Dec88 %>% dplyr::na_if(-88)

Jan89 <- read.ascii.grid("comp_runoff_hd_198901.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan89 <- Jan89 %>% dplyr::na_if(-88)
Feb89 <- read.ascii.grid("comp_runoff_hd_198902.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb89 <- Feb89 %>% dplyr::na_if(-88)
Mar89 <- read.ascii.grid("comp_runoff_hd_198903.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar89 <- Mar89 %>% dplyr::na_if(-88)
Apr89 <- read.ascii.grid("comp_runoff_hd_198904.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr89 <- Apr89 %>% dplyr::na_if(-88)
May89 <- read.ascii.grid("comp_runoff_hd_198905.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May89 <- May89 %>% dplyr::na_if(-88)
Jun89 <- read.ascii.grid("comp_runoff_hd_198906.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun89 <- Jun89 %>% dplyr::na_if(-88)
Jul89 <- read.ascii.grid("comp_runoff_hd_198907.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul89 <- Jul89 %>% dplyr::na_if(-88)
Aug89 <- read.ascii.grid("comp_runoff_hd_198908.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug89 <- Aug89 %>% dplyr::na_if(-88)
Sep89 <- read.ascii.grid("comp_runoff_hd_198909.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep89 <- Sep89 %>% dplyr::na_if(-88)
Oct89 <- read.ascii.grid("comp_runoff_hd_198910.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct89 <- Oct89 %>% dplyr::na_if(-88)
Nov89 <- read.ascii.grid("comp_runoff_hd_198911.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov89 <- Nov89 %>% dplyr::na_if(-88)
Dec89 <- read.ascii.grid("comp_runoff_hd_198912.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec89 <- Dec89 %>% dplyr::na_if(-88)

Jan90 <- read.ascii.grid("comp_runoff_hd_199001.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan90 <- Jan90 %>% dplyr::na_if(-88)
Feb90 <- read.ascii.grid("comp_runoff_hd_199002.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb90 <- Feb90 %>% dplyr::na_if(-88)
Mar90 <- read.ascii.grid("comp_runoff_hd_199003.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar90 <- Mar90 %>% dplyr::na_if(-88)
Apr90 <- read.ascii.grid("comp_runoff_hd_199004.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr90 <- Apr90 %>% dplyr::na_if(-88)
May90 <- read.ascii.grid("comp_runoff_hd_199005.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May90 <- May90 %>% dplyr::na_if(-88)
Jun90 <- read.ascii.grid("comp_runoff_hd_199006.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun90 <- Jun90 %>% dplyr::na_if(-88)
Jul90 <- read.ascii.grid("comp_runoff_hd_199007.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul90 <- Jul90 %>% dplyr::na_if(-88)
Aug90 <- read.ascii.grid("comp_runoff_hd_199008.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug90 <- Aug90 %>% dplyr::na_if(-88)
Sep90 <- read.ascii.grid("comp_runoff_hd_199009.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep90 <- Sep90 %>% dplyr::na_if(-88)
Oct90 <- read.ascii.grid("comp_runoff_hd_199010.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct90 <- Oct90 %>% dplyr::na_if(-88)
Nov90 <- read.ascii.grid("comp_runoff_hd_199011.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov90 <- Nov90 %>% dplyr::na_if(-88)
Dec90 <- read.ascii.grid("comp_runoff_hd_199012.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec90 <- Dec90 %>% dplyr::na_if(-88)

Jan91 <- read.ascii.grid("comp_runoff_hd_199101.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan91 <- Jan91 %>% dplyr::na_if(-88)
Feb91 <- read.ascii.grid("comp_runoff_hd_199102.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb91 <- Feb91 %>% dplyr::na_if(-88)
Mar91 <- read.ascii.grid("comp_runoff_hd_199103.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar91 <- Mar91 %>% dplyr::na_if(-88)
Apr91 <- read.ascii.grid("comp_runoff_hd_199104.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr91 <- Apr91 %>% dplyr::na_if(-88)
May91 <- read.ascii.grid("comp_runoff_hd_199105.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May91 <- May91 %>% dplyr::na_if(-88)
Jun91 <- read.ascii.grid("comp_runoff_hd_199106.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun91 <- Jun91 %>% dplyr::na_if(-88)
Jul91 <- read.ascii.grid("comp_runoff_hd_199107.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul91 <- Jul91 %>% dplyr::na_if(-88)
Aug91 <- read.ascii.grid("comp_runoff_hd_199108.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug91 <- Aug91 %>% dplyr::na_if(-88)
Sep91 <- read.ascii.grid("comp_runoff_hd_199109.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep91 <- Sep91 %>% dplyr::na_if(-88)
Oct91 <- read.ascii.grid("comp_runoff_hd_199110.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct91 <- Oct91 %>% dplyr::na_if(-88)
Nov91 <- read.ascii.grid("comp_runoff_hd_199111.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov91 <- Nov91 %>% dplyr::na_if(-88)
Dec91 <- read.ascii.grid("comp_runoff_hd_199112.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec91 <- Dec91 %>% dplyr::na_if(-88)

Jan92 <- read.ascii.grid("comp_runoff_hd_199201.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan92 <- Jan92 %>% dplyr::na_if(-88)
Feb92 <- read.ascii.grid("comp_runoff_hd_199202.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb92 <- Feb92 %>% dplyr::na_if(-88)
Mar92 <- read.ascii.grid("comp_runoff_hd_199203.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar92 <- Mar92 %>% dplyr::na_if(-88)
Apr92 <- read.ascii.grid("comp_runoff_hd_199204.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr92 <- Apr92 %>% dplyr::na_if(-88)
May92 <- read.ascii.grid("comp_runoff_hd_199205.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May92 <- May92 %>% dplyr::na_if(-88)
Jun92 <- read.ascii.grid("comp_runoff_hd_199206.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun92 <- Jun92 %>% dplyr::na_if(-88)
Jul92 <- read.ascii.grid("comp_runoff_hd_199207.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul92 <- Jul92 %>% dplyr::na_if(-88)
Aug92 <- read.ascii.grid("comp_runoff_hd_199208.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug92 <- Aug92 %>% dplyr::na_if(-88)
Sep92 <- read.ascii.grid("comp_runoff_hd_199209.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep92 <- Sep92 %>% dplyr::na_if(-88)
Oct92 <- read.ascii.grid("comp_runoff_hd_199210.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct92 <- Oct92 %>% dplyr::na_if(-88)
Nov92 <- read.ascii.grid("comp_runoff_hd_199211.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov92 <- Nov92 %>% dplyr::na_if(-88)
Dec92 <- read.ascii.grid("comp_runoff_hd_199212.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec92 <- Dec92 %>% dplyr::na_if(-88)

Jan93 <- read.ascii.grid("comp_runoff_hd_199301.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan93 <- Jan93 %>% dplyr::na_if(-88)
Feb93 <- read.ascii.grid("comp_runoff_hd_199302.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb93 <- Feb93 %>% dplyr::na_if(-88)
Mar93 <- read.ascii.grid("comp_runoff_hd_199303.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar93 <- Mar93 %>% dplyr::na_if(-88)
Apr93 <- read.ascii.grid("comp_runoff_hd_199304.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr93 <- Apr93 %>% dplyr::na_if(-88)
May93 <- read.ascii.grid("comp_runoff_hd_199305.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May93 <- May93 %>% dplyr::na_if(-88)
Jun93 <- read.ascii.grid("comp_runoff_hd_199306.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun93 <- Jun93 %>% dplyr::na_if(-88)
Jul93 <- read.ascii.grid("comp_runoff_hd_199307.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul93 <- Jul93 %>% dplyr::na_if(-88)
Aug93 <- read.ascii.grid("comp_runoff_hd_199308.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug93 <- Aug93 %>% dplyr::na_if(-88)
Sep93 <- read.ascii.grid("comp_runoff_hd_199309.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep93 <- Sep93 %>% dplyr::na_if(-88)
Oct93 <- read.ascii.grid("comp_runoff_hd_199310.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct93 <- Oct93 %>% dplyr::na_if(-88)
Nov93 <- read.ascii.grid("comp_runoff_hd_199311.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov93 <- Nov93 %>% dplyr::na_if(-88)
Dec93 <- read.ascii.grid("comp_runoff_hd_199312.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec93 <- Dec93 %>% dplyr::na_if(-88)

Jan94 <- read.ascii.grid("comp_runoff_hd_199401.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan94 <- Jan94 %>% dplyr::na_if(-88)
Feb94 <- read.ascii.grid("comp_runoff_hd_199402.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb94 <- Feb94 %>% dplyr::na_if(-88)
Mar94 <- read.ascii.grid("comp_runoff_hd_199403.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar94 <- Mar94 %>% dplyr::na_if(-88)
Apr94 <- read.ascii.grid("comp_runoff_hd_199404.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr94 <- Apr94 %>% dplyr::na_if(-88)
May94 <- read.ascii.grid("comp_runoff_hd_199405.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May94 <- May94 %>% dplyr::na_if(-88)
Jun94 <- read.ascii.grid("comp_runoff_hd_199406.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun94 <- Jun94 %>% dplyr::na_if(-88)
Jul94 <- read.ascii.grid("comp_runoff_hd_199407.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul94 <- Jul94 %>% dplyr::na_if(-88)
Aug94 <- read.ascii.grid("comp_runoff_hd_199408.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug94 <- Aug94 %>% dplyr::na_if(-88)
Sep94 <- read.ascii.grid("comp_runoff_hd_199409.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep94 <- Sep94 %>% dplyr::na_if(-88)
Oct94 <- read.ascii.grid("comp_runoff_hd_199410.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct94 <- Oct94 %>% dplyr::na_if(-88)
Nov94 <- read.ascii.grid("comp_runoff_hd_199411.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov94 <- Nov94 %>% dplyr::na_if(-88)
Dec94 <- read.ascii.grid("comp_runoff_hd_199412.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec94 <- Dec94 %>% dplyr::na_if(-88)

Jan95 <- read.ascii.grid("comp_runoff_hd_199501.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jan95 <- Jan95 %>% dplyr::na_if(-88)
Feb95 <- read.ascii.grid("comp_runoff_hd_199502.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Feb95 <- Feb95 %>% dplyr::na_if(-88)
Mar95 <- read.ascii.grid("comp_runoff_hd_199503.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Mar95 <- Mar95 %>% dplyr::na_if(-88)
Apr95 <- read.ascii.grid("comp_runoff_hd_199504.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Apr95 <- Apr95 %>% dplyr::na_if(-88)
May95 <- read.ascii.grid("comp_runoff_hd_199505.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
May95 <- May95 %>% dplyr::na_if(-88)
Jun95 <- read.ascii.grid("comp_runoff_hd_199506.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jun95 <- Jun95 %>% dplyr::na_if(-88)
Jul95 <- read.ascii.grid("comp_runoff_hd_199507.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Jul95 <- Jul95 %>% dplyr::na_if(-88)
Aug95 <- read.ascii.grid("comp_runoff_hd_199508.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Aug95 <- Aug95 %>% dplyr::na_if(-88)
Sep95 <- read.ascii.grid("comp_runoff_hd_199509.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Sep95 <- Sep95 %>% dplyr::na_if(-88)
Oct95 <- read.ascii.grid("comp_runoff_hd_199510.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Oct95 <- Oct95 %>% dplyr::na_if(-88)
Nov95 <- read.ascii.grid("comp_runoff_hd_199511.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Nov95 <- Nov95 %>% dplyr::na_if(-88)
Dec95 <- read.ascii.grid("comp_runoff_hd_199512.asc", return.header=FALSE, print = 0, 
                         nodata.values = c(), at.once = TRUE, na.strings = "NA")
Dec95 <- Dec95 %>% dplyr::na_if(-88)
############################## Pull CESM Files ###################################
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

############################## Lat Lon Calculation ###############################
### GRDC Lat & Lon ###
#lon
GRDClon <- seq(-179.75, 179.75, 0.5)
GRDClon2D <- kronecker(matrix(1, 1, 360), GRDClon)

#lat
GRDClat <- seq(-89.75, 89.75, 0.5)
GRDClat <- data.frame(GRDClat)
GRDClat <- t(GRDClat)
GRDClat2D <- kronecker(matrix(1, 720, 1), GRDClat)

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

############################## JANUARY 1986 Aggregation #############################
total_runoff_vector <- as.vector(CJan86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan86 <- t(Jan86)
Jan86 <- Jan86[,order(ncol(Jan86):1)]
GRDCJan86<-Jan86
GRDCJan86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan86_agg[i]<-mean(GRDCJan86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan86_agg)
GRDCJan86_agg[GRDCflag]<-NA
write.csv(GRDCJan86_agg, "GRDC Jan86 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb86 <- t(Feb86)
Feb86 <- Feb86[,order(ncol(Feb86):1)]
GRDCFeb86<-Feb86
GRDCFeb86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb86_agg[i]<-mean(GRDCFeb86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb86_agg)
GRDCFeb86_agg[GRDCflag]<-NA
write.csv(GRDCFeb86_agg, "GRDC Feb86 Aggregation.csv", row.names = FALSE)

############################## MARCH 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CMar86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar86 <- t(Mar86)
Mar86 <- Mar86[,order(ncol(Mar86):1)]
GRDCMar86<-Mar86
GRDCMar86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar86_agg[i]<-mean(GRDCMar86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar86_agg)
GRDCMar86_agg[GRDCflag]<-NA
write.csv(GRDCMar86_agg, "GRDC Mar86 Aggregation.csv", row.names = FALSE)


############################## APRIL 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CApr86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr86 <- t(Apr86)
Apr86 <- Apr86[,order(ncol(Apr86):1)]
GRDCApr86<-Apr86
GRDCApr86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr86_agg[i]<-mean(GRDCApr86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr86_agg)
GRDCApr86_agg[GRDCflag]<-NA
write.csv(GRDCApr86_agg, "GRDC Apr86 Aggregation.csv", row.names = FALSE)

############################## MAY 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CMay86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May86 <- t(May86)
May86 <- May86[,order(ncol(May86):1)]
GRDCMay86<-May86
GRDCMay86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay86_agg[i]<-mean(GRDCMay86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay86_agg)
GRDCMay86_agg[GRDCflag]<-NA
write.csv(GRDCMay86_agg, "GRDC May86 Aggregation.csv", row.names = FALSE)


############################## JUNE 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CJun86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun86 <- t(Jun86)
Jun86 <- Jun86[,order(ncol(Jun86):1)]
GRDCJun86<-Jun86
GRDCJun86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun86_agg[i]<-mean(GRDCJun86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun86_agg)
GRDCJun86_agg[GRDCflag]<-NA
write.csv(GRDCJun86_agg, "GRDC Jun86 Aggregation.csv", row.names = FALSE)

############################## JULY 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CJul86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul86 <- t(Jul86)
Jul86 <- Jul86[,order(ncol(Jul86):1)]
GRDCJul86<-Jul86
GRDCJul86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul86_agg[i]<-mean(GRDCJul86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul86_agg)
GRDCJul86_agg[GRDCflag]<-NA
write.csv(GRDCJul86_agg, "GRDC Jul86 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CAug86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug86 <- t(Aug86)
Aug86 <- Aug86[,order(ncol(Aug86):1)]
GRDCAug86<-Aug86
GRDCAug86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug86_agg[i]<-mean(GRDCAug86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug86_agg)
GRDCAug86_agg[GRDCflag]<-NA
write.csv(GRDCAug86_agg, "GRDC Aug86 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CSep86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep86 <- t(Sep86)
Sep86 <- Sep86[,order(ncol(Sep86):1)]
GRDCSep86<-Sep86
GRDCSep86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep86_agg[i]<-mean(GRDCSep86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep86_agg)
GRDCSep86_agg[GRDCflag]<-NA
write.csv(GRDCSep86_agg, "GRDC Sep86 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1986 Aggregation ##############################
total_runoff_vector <- as.vector(COct86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct86 <- t(Oct86)
Oct86 <- Oct86[,order(ncol(Oct86):1)]
GRDCOct86<-Oct86
GRDCOct86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct86_agg[i]<-mean(GRDCOct86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct86_agg)
GRDCOct86_agg[GRDCflag]<-NA
write.csv(GRDCOct86_agg, "GRDC Oct86 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CNov86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov86 <- t(Nov86)
Nov86 <- Nov86[,order(ncol(Nov86):1)]
GRDCNov86<-Nov86
GRDCNov86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov86_agg[i]<-mean(GRDCNov86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov86_agg)
GRDCNov86_agg[GRDCflag]<-NA
write.csv(GRDCNov86_agg, "GRDC Nov86 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1986 Aggregation ##############################
total_runoff_vector <- as.vector(CDec86)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec86)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec86 <- t(Dec86)
Dec86 <- Dec86[,order(ncol(Dec86):1)]
GRDCDec86<-Dec86
GRDCDec86_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec86_agg[i]<-mean(GRDCDec86[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec86_agg)
GRDCDec86_agg[GRDCflag]<-NA
write.csv(GRDCDec86_agg, "GRDC Dec86 Aggregation.csv", row.names = FALSE)


############################## JANUARY 1988 Aggregation #############################
total_runoff_vector <- as.vector(CJan88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan88 <- t(Jan88)
Jan88 <- Jan88[,order(ncol(Jan88):1)]
GRDCJan88<-Jan88
GRDCJan88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan88_agg[i]<-mean(GRDCJan88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan88_agg)
GRDCJan88_agg[GRDCflag]<-NA
write.csv(GRDCJan88_agg, "GRDC Jan88 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb88 <- t(Feb88)
Feb88 <- Feb88[,order(ncol(Feb88):1)]
GRDCFeb88<-Feb88
GRDCFeb88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb88_agg[i]<-mean(GRDCFeb88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb88_agg)
GRDCFeb88_agg[GRDCflag]<-NA
write.csv(GRDCFeb88_agg, "GRDC Feb86 Aggregation.csv", row.names = FALSE)

############################## MARCH 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CMar88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar88 <- t(Mar88)
Mar88 <- Mar88[,order(ncol(Mar88):1)]
GRDCMar88<-Mar88
GRDCMar88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar88_agg[i]<-mean(GRDCMar88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar88_agg)
GRDCMar88_agg[GRDCflag]<-NA
write.csv(GRDCMar88_agg, "GRDC Mar88 Aggregation.csv", row.names = FALSE)


############################## APRIL 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CApr88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr88 <- t(Apr88)
Apr88 <- Apr86[,order(ncol(Apr88):1)]
GRDCApr88<-Apr88
GRDCApr88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr88_agg[i]<-mean(GRDCApr88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr88_agg)
GRDCApr88_agg[GRDCflag]<-NA
write.csv(GRDCApr88_agg, "GRDC Apr88 Aggregation.csv", row.names = FALSE)

############################## MAY 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CMay88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May88 <- t(May88)
May88 <- May88[,order(ncol(May88):1)]
GRDCMay88<-May88
GRDCMay88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay88_agg[i]<-mean(GRDCMay88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay88_agg)
GRDCMay88_agg[GRDCflag]<-NA
write.csv(GRDCMay88_agg, "GRDC May88 Aggregation.csv", row.names = FALSE)


############################## JUNE 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CJun88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun88 <- t(Jun88)
Jun88 <- Jun88[,order(ncol(Jun88):1)]
GRDCJun88<-Jun88
GRDCJun88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun88_agg[i]<-mean(GRDCJun88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun88_agg)
GRDCJun88_agg[GRDCflag]<-NA
write.csv(GRDCJun88_agg, "GRDC Jun88 Aggregation.csv", row.names = FALSE)

############################## JULY 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CJul88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul88 <- t(Jul88)
Jul88 <- Jul88[,order(ncol(Jul88):1)]
GRDCJul88<-Jul88
GRDCJul88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul88_agg[i]<-mean(GRDCJul88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul88_agg)
GRDCJul88_agg[GRDCflag]<-NA
write.csv(GRDCJul88_agg, "GRDC Jul88 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CAug88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug88 <- t(Aug88)
Aug88 <- Aug88[,order(ncol(Aug88):1)]
GRDCAug88<-Aug88
GRDCAug88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug88_agg[i]<-mean(GRDCAug88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug88_agg)
GRDCAug88_agg[GRDCflag]<-NA
write.csv(GRDCAug88_agg, "GRDC Aug88 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CSep88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep88 <- t(Sep88)
Sep88 <- Sep88[,order(ncol(Sep88):1)]
GRDCSep88<-Sep88
GRDCSep88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep88_agg[i]<-mean(GRDCSep88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep88_agg)
GRDCSep88_agg[GRDCflag]<-NA
write.csv(GRDCSep88_agg, "GRDC Sep88 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1988 Aggregation ##############################
total_runoff_vector <- as.vector(COct88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct88 <- t(Oct88)
Oct88 <- Oct88[,order(ncol(Oct88):1)]
GRDCOct88<-Oct88
GRDCOct88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct88_agg[i]<-mean(GRDCOct88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct88_agg)
GRDCOct88_agg[GRDCflag]<-NA
write.csv(GRDCOct88_agg, "GRDC Oct88 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CNov88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov88 <- t(Nov88)
Nov88 <- Nov88[,order(ncol(Nov88):1)]
GRDCNov88<-Nov88
GRDCNov88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov88_agg[i]<-mean(GRDCNov88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov88_agg)
GRDCNov88_agg[GRDCflag]<-NA
write.csv(GRDCNov88_agg, "GRDC Nov88 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1988 Aggregation ##############################
total_runoff_vector <- as.vector(CDec88)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec88)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec88 <- t(Dec88)
Dec88 <- Dec88[,order(ncol(Dec88):1)]
GRDCDec88<-Dec88
GRDCDec88_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec88_agg[i]<-mean(GRDCDec88[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec88_agg)
GRDCDec88_agg[GRDCflag]<-NA
write.csv(GRDCDec88_agg, "GRDC Dec88 Aggregation.csv", row.names = FALSE)


############################## JANUARY 1989 Aggregation #############################
total_runoff_vector <- as.vector(CJan89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan89 <- t(Jan89)
Jan89 <- Jan89[,order(ncol(Jan89):1)]
GRDCJan89<-Jan89
GRDCJan89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan89_agg[i]<-mean(GRDCJan89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan89_agg)
GRDCJan89_agg[GRDCflag]<-NA
write.csv(GRDCJan89_agg, "GRDC Jan89 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb89 <- t(Feb89)
Feb89 <- Feb89[,order(ncol(Feb89):1)]
GRDCFeb89<-Feb89
GRDCFeb89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb89_agg[i]<-mean(GRDCFeb89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb89_agg)
GRDCFeb89_agg[GRDCflag]<-NA
write.csv(GRDCFeb89_agg, "GRDC Feb89 Aggregation.csv", row.names = FALSE)

############################## MARCH 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CMar89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar89 <- t(Mar89)
Mar89 <- Mar89[,order(ncol(Mar89):1)]
GRDCMar89<-Mar89
GRDCMar89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar89_agg[i]<-mean(GRDCMar89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar89_agg)
GRDCMar89_agg[GRDCflag]<-NA
write.csv(GRDCMar89_agg, "GRDC Mar89 Aggregation.csv", row.names = FALSE)


############################## APRIL 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CApr89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr89 <- t(Apr89)
Apr89 <- Apr89[,order(ncol(Apr89):1)]
GRDCApr89<-Apr89
GRDCApr89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr89_agg[i]<-mean(GRDCApr89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr89_agg)
GRDCApr89_agg[GRDCflag]<-NA
write.csv(GRDCApr89_agg, "GRDC Apr89 Aggregation.csv", row.names = FALSE)

############################## MAY 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CMay89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May89 <- t(May89)
May89 <- May89[,order(ncol(May89):1)]
GRDCMay89<-May89
GRDCMay89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay89_agg[i]<-mean(GRDCMay89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay89_agg)
GRDCMay89_agg[GRDCflag]<-NA
write.csv(GRDCMay89_agg, "GRDC May89 Aggregation.csv", row.names = FALSE)


############################## JUNE 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CJun89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun89 <- t(Jun89)
Jun89 <- Jun89[,order(ncol(Jun89):1)]
GRDCJun89<-Jun89
GRDCJun89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun89_agg[i]<-mean(GRDCJun89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun89_agg)
GRDCJun89_agg[GRDCflag]<-NA
write.csv(GRDCJun89_agg, "GRDC Jun89 Aggregation.csv", row.names = FALSE)

############################## JULY 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CJul89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul89 <- t(Jul89)
Jul89 <- Jul89[,order(ncol(Jul89):1)]
GRDCJul89<-Jul89
GRDCJul89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul89_agg[i]<-mean(GRDCJul89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul89_agg)
GRDCJul89_agg[GRDCflag]<-NA
write.csv(GRDCJul89_agg, "GRDC Jul89 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CAug89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug89 <- t(Aug89)
Aug89 <- Aug89[,order(ncol(Aug89):1)]
GRDCAug89<-Aug89
GRDCAug89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug89_agg[i]<-mean(GRDCAug89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug89_agg)
GRDCAug89_agg[GRDCflag]<-NA
write.csv(GRDCAug89_agg, "GRDC Aug89 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CSep89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep89 <- t(Sep89)
Sep89 <- Sep89[,order(ncol(Sep89):1)]
GRDCSep89<-Sep89
GRDCSep89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep89_agg[i]<-mean(GRDCSep89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep89_agg)
GRDCSep89_agg[GRDCflag]<-NA
write.csv(GRDCSep89_agg, "GRDC Sep89 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1989 Aggregation ##############################
total_runoff_vector <- as.vector(COct89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct89 <- t(Oct89)
Oct89 <- Oct89[,order(ncol(Oct89):1)]
GRDCOct89<-Oct89
GRDCOct89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct89_agg[i]<-mean(GRDCOct89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct89_agg)
GRDCOct89_agg[GRDCflag]<-NA
write.csv(GRDCOct89_agg, "GRDC Oct89 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CNov89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov89 <- t(Nov89)
Nov89 <- Nov89[,order(ncol(Nov89):1)]
GRDCNov89<-Nov89
GRDCNov89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov89_agg[i]<-mean(GRDCNov89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov89_agg)
GRDCNov89_agg[GRDCflag]<-NA
write.csv(GRDCNov89_agg, "GRDC Nov89 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1989 Aggregation ##############################
total_runoff_vector <- as.vector(CDec89)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec89)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec89 <- t(Dec89)
Dec89 <- Dec89[,order(ncol(Dec89):1)]
GRDCDec89<-Dec89
GRDCDec89_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec89_agg[i]<-mean(GRDCDec89[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec89_agg)
GRDCDec89_agg[GRDCflag]<-NA
write.csv(GRDCDec89_agg, "GRDC Dec89 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1990 Aggregation #############################
total_runoff_vector <- as.vector(CJan90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan90 <- t(Jan90)
Jan90 <- Jan90[,order(ncol(Jan90):1)]
GRDCJan90<-Jan90
GRDCJan90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan90_agg[i]<-mean(GRDCJan90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan90_agg)
GRDCJan90_agg[GRDCflag]<-NA
write.csv(GRDCJan90_agg, "GRDC Jan90 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb90 <- t(Feb90)
Feb90 <- Feb90[,order(ncol(Feb90):1)]
GRDCFeb90<-Feb90
GRDCFeb90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb90_agg[i]<-mean(GRDCFeb90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb90_agg)
GRDCFeb90_agg[GRDCflag]<-NA
write.csv(GRDCFeb90_agg, "GRDC Feb90 Aggregation.csv", row.names = FALSE)

############################## MARCH 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CMar90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar90 <- t(Mar90)
Mar90 <- Mar90[,order(ncol(Mar90):1)]
GRDCMar90<-Mar90
GRDCMar90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar90_agg[i]<-mean(GRDCMar90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar90_agg)
GRDCMar90_agg[GRDCflag]<-NA
write.csv(GRDCMar90_agg, "GRDC Mar90 Aggregation.csv", row.names = FALSE)


############################## APRIL 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CApr90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr90 <- t(Apr90)
Apr90 <- Apr90[,order(ncol(Apr90):1)]
GRDCApr90<-Apr90
GRDCApr90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr90_agg[i]<-mean(GRDCApr90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr90_agg)
GRDCApr90_agg[GRDCflag]<-NA
write.csv(GRDCApr90_agg, "GRDC Apr90 Aggregation.csv", row.names = FALSE)

############################## MAY 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CMay90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May90 <- t(May90)
May90 <- May90[,order(ncol(May90):1)]
GRDCMay90<-May90
GRDCMay90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay90_agg[i]<-mean(GRDCMay90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay90_agg)
GRDCMay90_agg[GRDCflag]<-NA
write.csv(GRDCMay90_agg, "GRDC May90 Aggregation.csv", row.names = FALSE)


############################## JUNE 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CJun90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun90 <- t(Jun90)
Jun90 <- Jun90[,order(ncol(Jun90):1)]
GRDCJun90<-Jun90
GRDCJun90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun90_agg[i]<-mean(GRDCJun90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun90_agg)
GRDCJun90_agg[GRDCflag]<-NA
write.csv(GRDCJun90_agg, "GRDC Jun90 Aggregation.csv", row.names = FALSE)

############################## JULY 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CJul90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul90 <- t(Jul90)
Jul90 <- Jul90[,order(ncol(Jul90):1)]
GRDCJul90<-Jul90
GRDCJul90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul90_agg[i]<-mean(GRDCJul90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul90_agg)
GRDCJul90_agg[GRDCflag]<-NA
write.csv(GRDCJul90_agg, "GRDC Jul90 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CAug90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug90 <- t(Aug90)
Aug90 <- Aug90[,order(ncol(Aug90):1)]
GRDCAug90<-Aug90
GRDCAug90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug90_agg[i]<-mean(GRDCAug90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug90_agg)
GRDCAug90_agg[GRDCflag]<-NA
write.csv(GRDCAug90_agg, "GRDC Aug90 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CSep90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep90 <- t(Sep90)
Sep90 <- Sep90[,order(ncol(Sep90):1)]
GRDCSep90<-Sep90
GRDCSep90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep90_agg[i]<-mean(GRDCSep90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep90_agg)
GRDCSep90_agg[GRDCflag]<-NA
write.csv(GRDCSep90_agg, "GRDC Sep90 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1990 Aggregation ##############################
total_runoff_vector <- as.vector(COct90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct90 <- t(Oct90)
Oct90 <- Oct90[,order(ncol(Oct90):1)]
GRDCOct90<-Oct90
GRDCOct90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct90_agg[i]<-mean(GRDCOct90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct90_agg)
GRDCOct90_agg[GRDCflag]<-NA
write.csv(GRDCOct90_agg, "GRDC Oct90 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CNov90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov90 <- t(Nov90)
Nov90 <- Nov90[,order(ncol(Nov90):1)]
GRDCNov90<-Nov90
GRDCNov90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov90_agg[i]<-mean(GRDCNov90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov90_agg)
GRDCNov90_agg[GRDCflag]<-NA
write.csv(GRDCNov90_agg, "GRDC Nov90 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1990 Aggregation ##############################
total_runoff_vector <- as.vector(CDec90)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec90)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec90 <- t(Dec90)
Dec90 <- Dec90[,order(ncol(Dec90):1)]
GRDCDec90<-Dec90
GRDCDec90_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec90_agg[i]<-mean(GRDCDec90[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec90_agg)
GRDCDec90_agg[GRDCflag]<-NA
write.csv(GRDCDec90_agg, "GRDC Dec90 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1991 Aggregation #############################
total_runoff_vector <- as.vector(CJan91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan91 <- t(Jan91)
Jan91 <- Jan91[,order(ncol(Jan91):1)]
GRDCJan91<-Jan91
GRDCJan91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan91_agg[i]<-mean(GRDCJan91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan91_agg)
GRDCJan91_agg[GRDCflag]<-NA
write.csv(GRDCJan91_agg, "GRDC Jan91 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb91 <- t(Feb91)
Feb91 <- Feb91[,order(ncol(Feb91):1)]
GRDCFeb91<-Feb91
GRDCFeb91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb91_agg[i]<-mean(GRDCFeb91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb91_agg)
GRDCFeb91_agg[GRDCflag]<-NA
write.csv(GRDCFeb91_agg, "GRDC Feb91 Aggregation.csv", row.names = FALSE)

############################## MARCH 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CMar91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar91 <- t(Mar91)
Mar91 <- Mar91[,order(ncol(Mar91):1)]
GRDCMar91<-Mar91
GRDCMar91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar91_agg[i]<-mean(GRDCMar91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar91_agg)
GRDCMar91_agg[GRDCflag]<-NA
write.csv(GRDCMar91_agg, "GRDC Mar91 Aggregation.csv", row.names = FALSE)


############################## APRIL 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CApr91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr91 <- t(Apr91)
Apr91 <- Apr91[,order(ncol(Apr91):1)]
GRDCApr91<-Apr91
GRDCApr91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr91_agg[i]<-mean(GRDCApr91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr91_agg)
GRDCApr91_agg[GRDCflag]<-NA
write.csv(GRDCApr91_agg, "GRDC Apr91 Aggregation.csv", row.names = FALSE)

############################## MAY 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CMay91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May91 <- t(May91)
May91 <- May91[,order(ncol(May91):1)]
GRDCMay91<-May91
GRDCMay91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay91_agg[i]<-mean(GRDCMay91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay91_agg)
GRDCMay91_agg[GRDCflag]<-NA
write.csv(GRDCMay91_agg, "GRDC May91 Aggregation.csv", row.names = FALSE)


############################## JUNE 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CJun91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun91 <- t(Jun91)
Jun91 <- Jun91[,order(ncol(Jun91):1)]
GRDCJun91<-Jun91
GRDCJun91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun91_agg[i]<-mean(GRDCJun91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun91_agg)
GRDCJun91_agg[GRDCflag]<-NA
write.csv(GRDCJun91_agg, "GRDC Jun91 Aggregation.csv", row.names = FALSE)

############################## JULY 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CJul91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul91 <- t(Jul91)
Jul91 <- Jul91[,order(ncol(Jul91):1)]
GRDCJul91<-Jul91
GRDCJul91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul91_agg[i]<-mean(GRDCJul91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul91_agg)
GRDCJul91_agg[GRDCflag]<-NA
write.csv(GRDCJul91_agg, "GRDC Jul91 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CAug91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug91 <- t(Aug91)
Aug91 <- Aug91[,order(ncol(Aug91):1)]
GRDCAug91<-Aug91
GRDCAug91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug91_agg[i]<-mean(GRDCAug91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug91_agg)
GRDCAug91_agg[GRDCflag]<-NA
write.csv(GRDCAug91_agg, "GRDC Aug91 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CSep91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep91 <- t(Sep91)
Sep91 <- Sep91[,order(ncol(Sep91):1)]
GRDCSep91<-Sep91
GRDCSep91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep91_agg[i]<-mean(GRDCSep91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep91_agg)
GRDCSep91_agg[GRDCflag]<-NA
write.csv(GRDCSep91_agg, "GRDC Sep91 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1991 Aggregation ##############################
total_runoff_vector <- as.vector(COct91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct91 <- t(Oct91)
Oct91 <- Oct91[,order(ncol(Oct91):1)]
GRDCOct91<-Oct91
GRDCOct91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct91_agg[i]<-mean(GRDCOct91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct91_agg)
GRDCOct91_agg[GRDCflag]<-NA
write.csv(GRDCOct91_agg, "GRDC Oct91 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CNov91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov91 <- t(Nov91)
Nov91 <- Nov91[,order(ncol(Nov91):1)]
GRDCNov91<-Nov91
GRDCNov91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov91_agg[i]<-mean(GRDCNov91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov91_agg)
GRDCNov91_agg[GRDCflag]<-NA
write.csv(GRDCNov91_agg, "GRDC Nov91 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1991 Aggregation ##############################
total_runoff_vector <- as.vector(CDec91)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec91 <- t(Dec91)
Dec91 <- Dec91[,order(ncol(Dec91):1)]
GRDCDec91<-Dec91
GRDCDec91_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec91_agg[i]<-mean(GRDCDec91[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec91_agg)
GRDCDec91_agg[GRDCflag]<-NA
write.csv(GRDCDec91_agg, "GRDC Dec91 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1992 Aggregation #############################
total_runoff_vector <- as.vector(CJan92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan92 <- t(Jan92)
Jan92 <- Jan92[,order(ncol(Jan92):1)]
GRDCJan92<-Jan92
GRDCJan92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan92_agg[i]<-mean(GRDCJan92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan92_agg)
GRDCJan92_agg[GRDCflag]<-NA
write.csv(GRDCJan92_agg, "GRDC Jan92 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb92 <- t(Feb92)
Feb92 <- Feb92[,order(ncol(Feb92):1)]
GRDCFeb92<-Feb92
GRDCFeb92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb92_agg[i]<-mean(GRDCFeb92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb92_agg)
GRDCFeb92_agg[GRDCflag]<-NA
write.csv(GRDCFeb92_agg, "GRDC Feb92 Aggregation.csv", row.names = FALSE)

############################## MARCH 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CMar92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar91)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar92 <- t(Mar92)
Mar92 <- Mar92[,order(ncol(Mar92):1)]
GRDCMar92<-Mar92
GRDCMar92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar92_agg[i]<-mean(GRDCMar92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar92_agg)
GRDCMar92_agg[GRDCflag]<-NA
write.csv(GRDCMar92_agg, "GRDC Mar92 Aggregation.csv", row.names = FALSE)


############################## APRIL 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CApr92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr92 <- t(Apr92)
Apr92 <- Apr92[,order(ncol(Apr92):1)]
GRDCApr92<-Apr92
GRDCApr92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr92_agg[i]<-mean(GRDCApr92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr92_agg)
GRDCApr92_agg[GRDCflag]<-NA
write.csv(GRDCApr92_agg, "GRDC Apr92 Aggregation.csv", row.names = FALSE)

############################## MAY 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CMay92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May92 <- t(May92)
May92 <- May92[,order(ncol(May92):1)]
GRDCMay92<-May92
GRDCMay92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay92_agg[i]<-mean(GRDCMay92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay92_agg)
GRDCMay92_agg[GRDCflag]<-NA
write.csv(GRDCMay92_agg, "GRDC May92 Aggregation.csv", row.names = FALSE)


############################## JUNE 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CJun92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun92 <- t(Jun92)
Jun92 <- Jun92[,order(ncol(Jun92):1)]
GRDCJun92<-Jun92
GRDCJun92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun92_agg[i]<-mean(GRDCJun92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun92_agg)
GRDCJun92_agg[GRDCflag]<-NA
write.csv(GRDCJun92_agg, "GRDC Jun92 Aggregation.csv", row.names = FALSE)

############################## JULY 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CJul92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul92 <- t(Jul92)
Jul92 <- Jul92[,order(ncol(Jul92):1)]
GRDCJul92<-Jul92
GRDCJul92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul92_agg[i]<-mean(GRDCJul92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul92_agg)
GRDCJul92_agg[GRDCflag]<-NA
write.csv(GRDCJul92_agg, "GRDC Jul92 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CAug92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug92 <- t(Aug92)
Aug92 <- Aug92[,order(ncol(Aug92):1)]
GRDCAug92<-Aug92
GRDCAug92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug92_agg[i]<-mean(GRDCAug92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug92_agg)
GRDCAug92_agg[GRDCflag]<-NA
write.csv(GRDCAug92_agg, "GRDC Aug92 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CSep92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep92 <- t(Sep92)
Sep92 <- Sep92[,order(ncol(Sep92):1)]
GRDCSep92<-Sep92
GRDCSep92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep92_agg[i]<-mean(GRDCSep92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep92_agg)
GRDCSep92_agg[GRDCflag]<-NA
write.csv(GRDCSep92_agg, "GRDC Sep92 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1992 Aggregation ##############################
total_runoff_vector <- as.vector(COct92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct92 <- t(Oct92)
Oct92 <- Oct92[,order(ncol(Oct92):1)]
GRDCOct92<-Oct92
GRDCOct92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct92_agg[i]<-mean(GRDCOct92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct92_agg)
GRDCOct92_agg[GRDCflag]<-NA
write.csv(GRDCOct92_agg, "GRDC Oct92 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CNov92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov92 <- t(Nov92)
Nov92 <- Nov92[,order(ncol(Nov92):1)]
GRDCNov92<-Nov92
GRDCNov92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov92_agg[i]<-mean(GRDCNov92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov92_agg)
GRDCNov92_agg[GRDCflag]<-NA
write.csv(GRDCNov92_agg, "GRDC Nov92 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1992 Aggregation ##############################
total_runoff_vector <- as.vector(CDec92)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec92)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec92 <- t(Dec92)
Dec92 <- Dec92[,order(ncol(Dec92):1)]
GRDCDec92<-Dec92
GRDCDec92_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec92_agg[i]<-mean(GRDCDec92[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec92_agg)
GRDCDec92_agg[GRDCflag]<-NA
write.csv(GRDCDec92_agg, "GRDC Dec92 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1993 Aggregation #############################
total_runoff_vector <- as.vector(CJan93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan93 <- t(Jan93)
Jan93 <- Jan93[,order(ncol(Jan93):1)]
GRDCJan93<-Jan93
GRDCJan93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan93_agg[i]<-mean(GRDCJan93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan93_agg)
GRDCJan93_agg[GRDCflag]<-NA
write.csv(GRDCJan93_agg, "GRDC Jan93 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb93 <- t(Feb93)
Feb93 <- Feb93[,order(ncol(Feb93):1)]
GRDCFeb93<-Feb93
GRDCFeb93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb93_agg[i]<-mean(GRDCFeb93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb93_agg)
GRDCFeb93_agg[GRDCflag]<-NA
write.csv(GRDCFeb93_agg, "GRDC Feb93 Aggregation.csv", row.names = FALSE)

############################## MARCH 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CMar93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar93 <- t(Mar93)
Mar93 <- Mar93[,order(ncol(Mar93):1)]
GRDCMar93<-Mar93
GRDCMar93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar93_agg[i]<-mean(GRDCMar93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar93_agg)
GRDCMar93_agg[GRDCflag]<-NA
write.csv(GRDCMar93_agg, "GRDC Mar93 Aggregation.csv", row.names = FALSE)


############################## APRIL 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CApr93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr93 <- t(Apr93)
Apr93 <- Apr93[,order(ncol(Apr93):1)]
GRDCApr93<-Apr93
GRDCApr93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr93_agg[i]<-mean(GRDCApr93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr93_agg)
GRDCApr93_agg[GRDCflag]<-NA
write.csv(GRDCApr93_agg, "GRDC Apr93 Aggregation.csv", row.names = FALSE)

############################## MAY 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CMay93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May93 <- t(May93)
May93 <- May93[,order(ncol(May93):1)]
GRDCMay93<-May93
GRDCMay93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay93_agg[i]<-mean(GRDCMay93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay93_agg)
GRDCMay93_agg[GRDCflag]<-NA
write.csv(GRDCMay93_agg, "GRDC May93 Aggregation.csv", row.names = FALSE)


############################## JUNE 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CJun93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun93 <- t(Jun93)
Jun93 <- Jun93[,order(ncol(Jun93):1)]
GRDCJun93<-Jun93
GRDCJun93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun93_agg[i]<-mean(GRDCJun93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun93_agg)
GRDCJun93_agg[GRDCflag]<-NA
write.csv(GRDCJun93_agg, "GRDC Jun93 Aggregation.csv", row.names = FALSE)

############################## JULY 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CJul93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul93 <- t(Jul93)
Jul93 <- Jul93[,order(ncol(Jul93):1)]
GRDCJul93<-Jul93
GRDCJul93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul93_agg[i]<-mean(GRDCJul93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul93_agg)
GRDCJul93_agg[GRDCflag]<-NA
write.csv(GRDCJul93_agg, "GRDC Jul93 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CAug93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug93 <- t(Aug93)
Aug93 <- Aug93[,order(ncol(Aug93):1)]
GRDCAug93<-Aug93
GRDCAug93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug93_agg[i]<-mean(GRDCAug93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug93_agg)
GRDCAug93_agg[GRDCflag]<-NA
write.csv(GRDCAug93_agg, "GRDC Aug93 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CSep93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep93 <- t(Sep93)
Sep93 <- Sep93[,order(ncol(Sep93):1)]
GRDCSep93<-Sep93
GRDCSep93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep93_agg[i]<-mean(GRDCSep93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep93_agg)
GRDCSep93_agg[GRDCflag]<-NA
write.csv(GRDCSep93_agg, "GRDC Sep93 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1993 Aggregation ##############################
total_runoff_vector <- as.vector(COct93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct93 <- t(Oct93)
Oct93 <- Oct93[,order(ncol(Oct93):1)]
GRDCOct93<-Oct93
GRDCOct93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct93_agg[i]<-mean(GRDCOct93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct93_agg)
GRDCOct93_agg[GRDCflag]<-NA
write.csv(GRDCOct93_agg, "GRDC Oct93 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CNov93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov93 <- t(Nov93)
Nov93 <- Nov93[,order(ncol(Nov93):1)]
GRDCNov93<-Nov93
GRDCNov93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov93_agg[i]<-mean(GRDCNov93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov93_agg)
GRDCNov93_agg[GRDCflag]<-NA
write.csv(GRDCNov93_agg, "GRDC Nov93 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1993 Aggregation ##############################
total_runoff_vector <- as.vector(CDec93)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec93)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec93 <- t(Dec93)
Dec93 <- Dec93[,order(ncol(Dec93):1)]
GRDCDec93<-Dec93
GRDCDec93_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec93_agg[i]<-mean(GRDCDec93[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec93_agg)
GRDCDec93_agg[GRDCflag]<-NA
write.csv(GRDCDec93_agg, "GRDC Dec93 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1994 Aggregation #############################
total_runoff_vector <- as.vector(CJan94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan94 <- t(Jan94)
Jan94 <- Jan94[,order(ncol(Jan94):1)]
GRDCJan94<-Jan94
GRDCJan94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan94_agg[i]<-mean(GRDCJan94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan94_agg)
GRDCJan94_agg[GRDCflag]<-NA
write.csv(GRDCJan94_agg, "GRDC Jan94 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb94 <- t(Feb94)
Feb94 <- Feb94[,order(ncol(Feb94):1)]
GRDCFeb94<-Feb94
GRDCFeb94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb94_agg[i]<-mean(GRDCFeb94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb94_agg)
GRDCFeb94_agg[GRDCflag]<-NA
write.csv(GRDCFeb94_agg, "GRDC Feb94 Aggregation.csv", row.names = FALSE)

############################## MARCH 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CMar94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar94 <- t(Mar94)
Mar94 <- Mar94[,order(ncol(Mar94):1)]
GRDCMar94<-Mar94
GRDCMar94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar94_agg[i]<-mean(GRDCMar94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar94_agg)
GRDCMar94_agg[GRDCflag]<-NA
write.csv(GRDCMar94_agg, "GRDC Mar94 Aggregation.csv", row.names = FALSE)


############################## APRIL 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CApr94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr94 <- t(Apr94)
Apr94 <- Apr94[,order(ncol(Apr94):1)]
GRDCApr94<-Apr94
GRDCApr94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr94_agg[i]<-mean(GRDCApr94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr94_agg)
GRDCApr94_agg[GRDCflag]<-NA
write.csv(GRDCApr94_agg, "GRDC Apr94 Aggregation.csv", row.names = FALSE)

############################## MAY 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CMay94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May94 <- t(May94)
May94 <- May94[,order(ncol(May94):1)]
GRDCMay94<-May94
GRDCMay94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay94_agg[i]<-mean(GRDCMay94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay94_agg)
GRDCMay94_agg[GRDCflag]<-NA
write.csv(GRDCMay94_agg, "GRDC May94 Aggregation.csv", row.names = FALSE)


############################## JUNE 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CJun94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun94 <- t(Jun94)
Jun94 <- Jun94[,order(ncol(Jun94):1)]
GRDCJun94<-Jun94
GRDCJun94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun94_agg[i]<-mean(GRDCJun94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun94_agg)
GRDCJun94_agg[GRDCflag]<-NA
write.csv(GRDCJun94_agg, "GRDC Jun94 Aggregation.csv", row.names = FALSE)

############################## JULY 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CJul94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul94 <- t(Jul94)
Jul94 <- Jul94[,order(ncol(Jul94):1)]
GRDCJul94<-Jul94
GRDCJul94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul94_agg[i]<-mean(GRDCJul94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul94_agg)
GRDCJul94_agg[GRDCflag]<-NA
write.csv(GRDCJul94_agg, "GRDC Jul94 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CAug94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug94 <- t(Aug94)
Aug94 <- Aug94[,order(ncol(Aug94):1)]
GRDCAug94<-Aug94
GRDCAug94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  #cat(paste("********* ",i,"*******"),sep='\n')
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug94_agg[i]<-mean(GRDCAug94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug94_agg)
GRDCAug94_agg[GRDCflag]<-NA
write.csv(GRDCAug94_agg, "GRDC Aug94 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CSep94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep94 <- t(Sep94)
Sep94 <- Sep94[,order(ncol(Sep94):1)]
GRDCSep94<-Sep94
GRDCSep94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep94_agg[i]<-mean(GRDCSep94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep94_agg)
GRDCSep94_agg[GRDCflag]<-NA
write.csv(GRDCSep94_agg, "GRDC Sep94 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1994 Aggregation ##############################
total_runoff_vector <- as.vector(COct94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct94 <- t(Oct94)
Oct94 <- Oct94[,order(ncol(Oct94):1)]
GRDCOct94<-Oct94
GRDCOct94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct94_agg[i]<-mean(GRDCOct94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct94_agg)
GRDCOct94_agg[GRDCflag]<-NA
write.csv(GRDCOct94_agg, "GRDC Oct94 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CNov94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov94 <- t(Nov94)
Nov94 <- Nov94[,order(ncol(Nov94):1)]
GRDCNov94<-Nov94
GRDCNov94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov94_agg[i]<-mean(GRDCNov94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov94_agg)
GRDCNov94_agg[GRDCflag]<-NA
write.csv(GRDCNov94_agg, "GRDC Nov94 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1994 Aggregation ##############################
total_runoff_vector <- as.vector(CDec94)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec94)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec94 <- t(Dec94)
Dec94 <- Dec94[,order(ncol(Dec94):1)]
GRDCDec94<-Dec94
GRDCDec94_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec94_agg[i]<-mean(GRDCDec94[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec94_agg)
GRDCDec94_agg[GRDCflag]<-NA
write.csv(GRDCDec94_agg, "GRDC Dec94 Aggregation.csv", row.names = FALSE)

############################## JANUARY 1995 Aggregation #############################
total_runoff_vector <- as.vector(CJan95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jan95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jan95 <- t(Jan95)
Jan95 <- Jan95[,order(ncol(Jan95):1)]
GRDCJan95<-Jan95
GRDCJan95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJan95_agg[i]<-mean(GRDCJan95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJan95_agg)
GRDCJan95_agg[GRDCflag]<-NA
write.csv(GRDCJan95_agg, "GRDC Jan95 Aggregation.csv", row.names = FALSE)

############################## FEBRUARY 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CFeb95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Feb95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Feb95 <- t(Feb95)
Feb95 <- Feb95[,order(ncol(Feb95):1)]
GRDCFeb95<-Feb95
GRDCFeb95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCFeb95_agg[i]<-mean(GRDCFeb95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCFeb95_agg)
GRDCFeb95_agg[GRDCflag]<-NA
write.csv(GRDCFeb95_agg, "GRDC Feb95 Aggregation.csv", row.names = FALSE)

############################## MARCH 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CMar95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Mar95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Mar95 <- t(Mar95)
Mar95 <- Mar95[,order(ncol(Mar95):1)]
GRDCMar95<-Mar95
GRDCMar95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMar95_agg[i]<-mean(GRDCMar95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMar95_agg)
GRDCMar95_agg[GRDCflag]<-NA
write.csv(GRDCMar95_agg, "GRDC Mar95 Aggregation.csv", row.names = FALSE)


############################## APRIL 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CApr95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Apr95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Apr95 <- t(Apr95)
Apr95 <- Apr95[,order(ncol(Apr95):1)]
GRDCApr95<-Apr95
GRDCApr95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCApr95_agg[i]<-mean(GRDCApr95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCApr95_agg)
GRDCApr95_agg[GRDCflag]<-NA
write.csv(GRDCApr95_agg, "GRDC Apr95 Aggregation.csv", row.names = FALSE)

############################## MAY 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CMay95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(May95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

May95 <- t(May95)
May95 <- May95[,order(ncol(May95):1)]
GRDCMay95<-May95
GRDCMay95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCMay95_agg[i]<-mean(GRDCMay95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCMay95_agg)
GRDCMay95_agg[GRDCflag]<-NA
write.csv(GRDCMay95_agg, "GRDC May95 Aggregation.csv", row.names = FALSE)


############################## JUNE 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CJun95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jun95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jun95 <- t(Jun95)
Jun95 <- Jun95[,order(ncol(Jun95):1)]
GRDCJun95<-Jun95
GRDCJun95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJun95_agg[i]<-mean(GRDCJun95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJun95_agg)
GRDCJun95_agg[GRDCflag]<-NA
write.csv(GRDCJun95_agg, "GRDC Jun95 Aggregation.csv", row.names = FALSE)

############################## JULY 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CJul95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Jul95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Jul95 <- t(Jul95)
Jul95 <- Jul95[,order(ncol(Jul95):1)]
GRDCJul95<-Jul95
GRDCJul95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCJul95_agg[i]<-mean(GRDCJul95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCJul95_agg)
GRDCJul95_agg[GRDCflag]<-NA
write.csv(GRDCJul95_agg, "GRDC Jul95 Aggregation.csv", row.names = FALSE)

############################## AUGUST 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CAug95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Aug95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Aug95 <- t(Aug95)
Aug95 <- Aug95[,order(ncol(Aug95):1)]
GRDCAug95<-Aug95
GRDCAug95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCAug95_agg[i]<-mean(GRDCAug95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCAug95_agg)
GRDCAug95_agg[GRDCflag]<-NA
write.csv(GRDCAug95_agg, "GRDC Aug95 Aggregation.csv", row.names = FALSE)

############################## SEPTEMBER 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CSep95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Sep95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Sep95 <- t(Sep95)
Sep95 <- Sep95[,order(ncol(Sep95):1)]
GRDCSep95<-Sep95
GRDCSep95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCSep95_agg[i]<-mean(GRDCSep95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCSep95_agg)
GRDCSep95_agg[GRDCflag]<-NA
write.csv(GRDCSep95_agg, "GRDC Sep95 Aggregation.csv", row.names = FALSE)

############################## OCTOBER 1995 Aggregation ##############################
total_runoff_vector <- as.vector(COct95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Oct95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Oct95 <- t(Oct95)
Oct95 <- Oct95[,order(ncol(Oct95):1)]
GRDCOct95<-Oct95
GRDCOct95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCOct95_agg[i]<-mean(GRDCOct95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCOct95_agg)
GRDCOct95_agg[GRDCflag]<-NA
write.csv(GRDCOct95_agg, "GRDC Oct95 Aggregation.csv", row.names = FALSE)

############################## NOVEMBER 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CNov95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Nov95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Nov95 <- t(Nov95)
Nov95 <- Nov95[,order(ncol(Nov95):1)]
GRDCNov95<-Nov95
GRDCNov95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCNov95_agg[i]<-mean(GRDCNov95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCNov95_agg)
GRDCNov95_agg[GRDCflag]<-NA
write.csv(GRDCNov95_agg, "GRDC Nov95 Aggregation.csv", row.names = FALSE)

############################## DECEMBER 1995 Aggregation ##############################
total_runoff_vector <- as.vector(CDec95)
flag_na <- is.na(total_runoff_vector)
CESM_lat <- as.vector(lat2D)
CESM_lat[flag_na] <- NA
CESM_lon <- as.vector(lon2D)
CESM_lon[flag_na] <- NA

urban_runoff_vector <- as.vector(Dec95)
flag_na <- is.na(urban_runoff_vector)
urban_lat <- as.vector(GRDClat2D)
urban_lat[flag_na] <- NA
urban_lon <- as.vector(GRDClon2D)
urban_lon[flag_na] <- NA

Dec95 <- t(Dec95)
Dec95 <- Dec95[,order(ncol(Dec95):1)]
GRDCDec95<-Dec95
GRDCDec95_agg<-array(NA,55296)
dLatCESM<-0.9424; dLonCESM<-1.25;
for (i in 1:55296){
  edgeLat<-c(CESM_lat[i]-dLatCESM/2,CESM_lat[i]+dLatCESM/2)
  edgeLon<-c(CESM_lon[i]-dLonCESM/2,CESM_lon[i]+dLonCESM/2)
  isIn <- (urban_lat>edgeLat[1] & urban_lat<edgeLat[2] & urban_lon>edgeLon[1] & urban_lon<edgeLon[2])
  GRDCDec95_agg[i]<-mean(GRDCDec95[isIn], na.rm = T)
}
GRDCflag<-is.na(GRDCDec95_agg)
GRDCDec95_agg[GRDCflag]<-NA
write.csv(GRDCDec95_agg, "GRDC Dec95 Aggregation.csv", row.names = FALSE)


######################## Pulling 1987 Files & Prepping Full Dataframes ##############################
setwd("/Users/lauragray")
GRDCJan87_agg <- read.csv("GRDC Jan87 Aggregation.csv", header = TRUE)
GRDCJan87_agg <- data.frame(GRDCJan87_agg$Value)
GRDCJan87_agg <- data.matrix(GRDCJan87_agg)
GRDCJan87_agg <- as.vector(GRDCJan87_agg)
GRDCFeb87_agg <- read.csv("GRDC Feb87 Aggregation.csv", header = TRUE)
GRDCFeb87_agg <- data.frame(GRDCFeb87_agg$Value)
GRDCFeb87_agg <- data.matrix(GRDCFeb87_agg)
GRDCFeb87_agg <- as.vector(GRDCFeb87_agg)
GRDCMar87_agg <- read.csv("GRDC Mar87 Aggregation.csv", header = TRUE)
GRDCMar87_agg <- data.frame(GRDCMar87_agg$Value)
GRDCMar87_agg <- data.matrix(GRDCMar87_agg)
GRDCMar87_agg <- as.vector(GRDCMar87_agg)
GRDCApr87_agg <- read.csv("GRDC Apr87 Aggregation.csv", header = TRUE)
GRDCApr87_agg <- data.frame(GRDCApr87_agg$Value)
GRDCApr87_agg <- data.matrix(GRDCApr87_agg)
GRDCApr87_agg <- as.vector(GRDCApr87_agg)
GRDCMay87_agg <- read.csv("GRDC May87 Aggregation.csv", header = TRUE)
GRDCMay87_agg <- data.frame(GRDCMay87_agg$Value)
GRDCMay87_agg <- data.matrix(GRDCMay87_agg)
GRDCMay87_agg <- as.vector(GRDCMay87_agg)
GRDCJun87_agg <- read.csv("GRDC Jun87 Aggregation.csv", header = TRUE)
GRDCJun87_agg <- data.frame(GRDCJun87_agg$Value)
GRDCJun87_agg <- data.matrix(GRDCJun87_agg)
GRDCJun87_agg <- as.vector(GRDCJun87_agg)
GRDCJul87_agg <- read.csv("GRDC Jul87 Aggregation.csv", header = TRUE)
GRDCJul87_agg <- data.frame(GRDCJul87_agg$Value)
GRDCJul87_agg <- data.matrix(GRDCJul87_agg)
GRDCJul87_agg <- as.vector(GRDCJul87_agg)
GRDCAug87_agg <- read.csv("GRDC Aug87 Aggregation.csv", header = TRUE)
GRDCAug87_agg <- data.frame(GRDCAug87_agg$Value)
GRDCAug87_agg <- data.matrix(GRDCAug87_agg)
GRDCAug87_agg <- as.vector(GRDCAug87_agg)
GRDCSep87_agg <- read.csv("GRDC Sep87 Aggregation.csv", header = TRUE)
GRDCSep87_agg <- data.frame(GRDCSep87_agg$Value)
GRDCSep87_agg <- data.matrix(GRDCSep87_agg)
GRDCSep87_agg <- as.vector(GRDCSep87_agg)
GRDCOct87_agg <- read.csv("GRDC Oct87 Aggregation.csv", header = TRUE)
GRDCOct87_agg <- data.frame(GRDCOct87_agg$Value)
GRDCOct87_agg <- data.matrix(GRDCOct87_agg)
GRDCOct87_agg <- as.vector(GRDCOct87_agg)
GRDCNov87_agg <- read.csv("GRDC Nov87 Aggregation.csv", header = TRUE)
GRDCNov87_agg <- data.frame(GRDCNov87_agg$Value)
GRDCNov87_agg <- data.matrix(GRDCNov87_agg)
GRDCNov87_agg <- as.vector(GRDCNov87_agg)
GRDCDec87_agg <- read.csv("GRDC Dec87 Aggregation.csv", header = TRUE)
GRDCDec87_agg <- data.frame(GRDCDec87_agg$Value)
GRDCDec87_agg <- data.matrix(GRDCDec87_agg)
GRDCDec87_agg <- as.vector(GRDCDec87_agg)

Array1987 <- array(c(GRDCJan87_agg, GRDCFeb87_agg, GRDCMar87_agg, GRDCApr87_agg, GRDCMay87_agg,
                     GRDCJun87_agg, GRDCJul87_agg, GRDCAug87_agg, GRDCSep87_agg, GRDCOct87_agg,
                     GRDCNov87_agg, GRDCDec87_agg), dim = c(1, 55296, 12))

mydata <- data.frame(seq(1,55296))
GRDCAgg <- data.frame(GRDCJan86_agg, GRDCFeb86_agg, GRDCMar86_agg, GRDCApr86_agg, GRDCMay86_agg,
                    GRDCJun86_agg, GRDCJul86_agg, GRDCAug86_agg, GRDCSep86_agg, GRDCOct86_agg,
                   GRDCNov86_agg, GRDCDec86_agg, GRDCJan87_agg, GRDCFeb87_agg, GRDCMar87_agg, 
                   GRDCApr87_agg, GRDCMay87_agg, GRDCJun87_agg, GRDCJul87_agg, GRDCAug87_agg, 
                   GRDCSep87_agg, GRDCOct87_agg, GRDCNov87_agg, GRDCDec87_agg, GRDCJan88_agg, 
                   GRDCFeb88_agg, GRDCMar88_agg, GRDCApr88_agg, GRDCMay88_agg, GRDCJun88_agg, 
                   GRDCJul88_agg, GRDCAug88_agg, GRDCSep88_agg, GRDCOct88_agg, GRDCNov88_agg, 
                   GRDCDec88_agg, GRDCJan89_agg, GRDCFeb89_agg, GRDCMar89_agg, GRDCApr89_agg, 
                   GRDCMay89_agg, GRDCJun89_agg, GRDCJul89_agg, GRDCAug89_agg, GRDCSep89_agg, 
                   GRDCOct89_agg, GRDCNov89_agg, GRDCDec89_agg, GRDCJan90_agg, GRDCFeb90_agg, 
                   GRDCMar90_agg, GRDCApr90_agg, GRDCMay90_agg, GRDCJun90_agg, GRDCJul90_agg, 
                   GRDCAug90_agg, GRDCSep90_agg, GRDCOct90_agg, GRDCNov90_agg, GRDCDec90_agg,
                   GRDCJan91_agg, GRDCFeb91_agg, GRDCMar91_agg, GRDCApr91_agg, GRDCMay91_agg, 
                   GRDCJun91_agg, GRDCJul91_agg, GRDCAug91_agg, GRDCSep91_agg, GRDCOct91_agg, 
                   GRDCNov91_agg, GRDCDec91_agg, GRDCJan92_agg, GRDCFeb92_agg, GRDCMar92_agg, 
                   GRDCApr92_agg, GRDCMay92_agg, GRDCJun92_agg, GRDCJul92_agg, GRDCAug92_agg, 
                   GRDCSep92_agg, GRDCOct92_agg, GRDCNov92_agg, GRDCDec92_agg, GRDCJan93_agg, 
                   GRDCFeb93_agg, GRDCMar93_agg, GRDCApr93_agg, GRDCMay93_agg, GRDCJun93_agg, 
                   GRDCJul93_agg, GRDCAug93_agg, GRDCSep93_agg, GRDCOct93_agg, GRDCNov93_agg, 
                   GRDCDec93_agg, GRDCJan94_agg, GRDCFeb94_agg, GRDCMar94_agg, GRDCApr94_agg, 
                   GRDCMay94_agg, GRDCJun94_agg, GRDCJul94_agg, GRDCAug94_agg, GRDCSep94_agg, 
                   GRDCOct94_agg, GRDCNov94_agg, GRDCDec94_agg, GRDCJan95_agg, GRDCFeb95_agg, 
                   GRDCMar95_agg, GRDCApr95_agg, GRDCMay95_agg, GRDCJun95_agg, GRDCJul95_agg, 
                   GRDCAug95_agg, GRDCSep95_agg, GRDCOct95_agg, GRDCNov95_agg, GRDCDec94_agg)
#GRDCAgg <- as.vector(GRDCAgg)
FullCESM <- data.frame(as.vector(CJan86), as.vector(CFeb86), as.vector(CMar86), as.vector(CApr86), 
                   as.vector(CMay86), as.vector(CJun86), as.vector(CJul86), as.vector(CAug86), 
                   as.vector(CSep86), as.vector(COct86), as.vector(CNov86), as.vector(CDec86), 
                   as.vector(CJan87), as.vector(CFeb87), as.vector(CMar87), as.vector(CApr87), 
                   as.vector(CMay87), as.vector(CJun87), as.vector(CJul87), as.vector(CAug87), 
                   as.vector(CSep87), as.vector(COct87), as.vector(CNov87), as.vector(CDec87), 
                   as.vector(CJan88), as.vector(CFeb88), as.vector(CMar88), as.vector(CApr88), 
                   as.vector(CMay88), as.vector(CJun88), as.vector(CJul88), as.vector(CAug88), 
                   as.vector(CSep88), as.vector(COct88), as.vector(CNov88), as.vector(CDec88),
                   as.vector(CJan89), as.vector(CFeb89), as.vector(CMar89), as.vector(CApr89), 
                   as.vector(CMay89), as.vector(CJun89), as.vector(CJul89), as.vector(CAug89), 
                   as.vector(CSep89), as.vector(COct89), as.vector(CNov89), as.vector(CDec89), 
                   as.vector(CJan90), as.vector(CFeb90), as.vector(CMar90), as.vector(CApr90), 
                   as.vector(CMay90), as.vector(CJun90), as.vector(CJul90), as.vector(CAug90), 
                   as.vector(CSep90), as.vector(COct90), as.vector(CNov90), as.vector(CDec90), 
                   as.vector(CJan91), as.vector(CFeb91), as.vector(CMar91), as.vector(CApr91), 
                   as.vector(CMay91), as.vector(CJun91), as.vector(CJul91), as.vector(CAug91), 
                   as.vector(CSep91), as.vector(COct91), as.vector(CNov91), as.vector(CDec91), 
                   as.vector(CJan92), as.vector(CFeb92), as.vector(CMar92), as.vector(CApr92), 
                   as.vector(CMay92), as.vector(CJun92), as.vector(CJul92), as.vector(CAug92), 
                   as.vector(CSep92), as.vector(COct92), as.vector(CNov92), as.vector(CDec92), 
                   as.vector(CJan93), as.vector(CFeb93), as.vector(CMar93), as.vector(CApr93), 
                   as.vector(CMay93), as.vector(CJun93), as.vector(CJul93), as.vector(CAug93), 
                   as.vector(CSep93), as.vector(COct93), as.vector(CNov93), as.vector(CDec93), 
                   as.vector(CJan94), as.vector(CFeb94), as.vector(CMar94), as.vector(CApr94), 
                   as.vector(CMay94), as.vector(CJun94), as.vector(CJul94), as.vector(CAug94), 
                   as.vector(CSep94), as.vector(COct94), as.vector(CNov94), as.vector(CDec94), 
                   as.vector(CJan95), as.vector(CFeb95), as.vector(CMar95), as.vector(CApr95), 
                   as.vector(CMay95), as.vector(CJun95), as.vector(CJul95), as.vector(CAug95), 
                   as.vector(CSep95), as.vector(COct95), as.vector(CNov95), as.vector(CDec95))
#FullCESM <- as.vector(FullCESM)
###################### Calculating Correlation Coefficient ###########################
rho_runoff <- array(NA, 55296)
for (i in 1:55296) {
   rho_runoff[i] <- cor(GRDCAgg[i,], FullCESM[i,], use = "pairwise.complete.obs")
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

map.world <- map_data(map = "world")
p<-ggplot(map.world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgrey", colour = "gray") +
  theme(text= element_text(size = 16), legend.position="bottom") +
  xlab(expression(paste("Longitude ("^"o",")"))) +
  ylab(expression(paste("Latitude ("^"o",")"))) +
  geom_point(data = as.data.frame(rho_runoff), aes(x = urban_lon, y = urban_lat, colour = rho_runoff), size = 0.5) +
  coord_fixed(ratio = 1.25) +
  scale_color_distiller(name = expression(paste("Correlation Coefficient",sep="")),
                        palette = "Spectral")
                        #limits = limits,
                        #labels = labels,
                        #breaks = breaks)
p <- p + theme(legend.title = element_text(size = 13), 
               legend.text = element_text(size = 7))
show(p)



