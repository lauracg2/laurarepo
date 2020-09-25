rm(list = ls(all=TRUE))

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

