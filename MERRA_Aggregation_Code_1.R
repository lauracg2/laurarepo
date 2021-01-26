############################## Background Code ###############################################
library(RSAGA)
library(maps)
library(ggplot2)
library(dplyr)
library(ncdf4)

workdir <- "/glade/scratch/lgray/MERRA Data"
setwd(workdir)

Jan86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198601.SUB.nc")
Jan86 <- ncvar_get(Jan86, "RUNOFF")
Jan86 <- Jan86*3600*24*31
Feb86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198602.SUB.nc")
Feb86 <- ncvar_get(Feb86, "RUNOFF")
Feb86 <- Feb86*3600*24*28
Mar86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198603.SUB.nc")
Mar86 <- ncvar_get(Mar86, "RUNOFF")
Mar86 <- Mar86*3600*24*31
Apr86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198604.SUB.nc")
Apr86 <- ncvar_get(Apr86, "RUNOFF")
Apr86 <- Apr86*3600*24*30
May86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198605.SUB.nc")
May86 <- ncvar_get(May86, "RUNOFF")
May86 <- May86*3600*24*31
Jun86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198606.SUB.nc")
Jun86 <- ncvar_get(Jun86, "RUNOFF")
Jun86 <- Jun86*3600*24*30
Jul86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198607.SUB.nc")
Jul86 <- ncvar_get(Jul86, "RUNOFF")
Jul86 <- Jul86*3600*24*31
Aug86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198608.SUB.nc")
Aug86 <- ncvar_get(Aug86, "RUNOFF")
Aug86 <- Aug86*3600*24*31
Sep86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198609.SUB.nc")
Sep86 <- ncvar_get(Sep86, "RUNOFF")
Sep86 <- Sep86*3600*24*30
Oct86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198610.SUB.nc")
Oct86 <- ncvar_get(Oct86, "RUNOFF")
Oct86 <- Oct86*3600*24*31
Nov86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198611.SUB.nc")
Nov86 <- ncvar_get(Nov86, "RUNOFF")
Nov86 <- Nov86*3600*24*30
Dec86 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198612.SUB.nc")
Dec86 <- ncvar_get(Dec86, "RUNOFF")
Dec86 <- Dec86*3600*24*31
Jan87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198701.SUB.nc")
Jan87 <- ncvar_get(Jan87, "RUNOFF")
Jan87 <- Jan87*3600*24*31
Feb87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198702.SUB.nc")
Feb87 <- ncvar_get(Feb87, "RUNOFF")
Feb87 <- Feb87*3600*24*28
Mar87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198703.SUB.nc")
Mar87 <- ncvar_get(Mar87, "RUNOFF")
Mar87 <- Mar87*3600*24*31
Apr87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198704.SUB.nc")
Apr87 <- ncvar_get(Apr87, "RUNOFF")
Apr87 <- Apr87*3600*24*30
May87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198705.SUB.nc")
May87 <- ncvar_get(May87, "RUNOFF")
May87 <- May87*3600*24*31
Jun87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198706.SUB.nc")
Jun87 <- ncvar_get(Jun87, "RUNOFF")
Jun87 <- Jun87*3600*24*30
Jul87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198707.SUB.nc")
Jul87 <- ncvar_get(Jul87, "RUNOFF")
Jul87 <- Jul87*3600*24*31
Aug87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198708.SUB.nc")
Aug87 <- ncvar_get(Aug87, "RUNOFF")
Aug87 <- Aug87*3600*24*31
Sep87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198709.SUB.nc")
Sep87 <- ncvar_get(Sep87, "RUNOFF")
Sep87 <- Sep87*3600*24*30
Oct87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198710.SUB.nc")
Oct87 <- ncvar_get(Oct87, "RUNOFF")
Oct87 <- Oct87*3600*24*31
Nov87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198711.SUB.nc")
Nov87 <- ncvar_get(Nov87, "RUNOFF")
Nov87 <- Nov87*3600*24*30
Dec87 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198712.SUB.nc")
Dec87 <- ncvar_get(Dec87, "RUNOFF")
Dec87 <- Dec87*3600*24*31
Jan88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198801.SUB.nc")
Jan88 <- ncvar_get(Jan88, "RUNOFF")
Jan88 <- Jan88*3600*24*31
Feb88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198802.SUB.nc")
Feb88 <- ncvar_get(Feb88, "RUNOFF")
Feb88 <- Feb88*3600*24*29
Mar88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198803.SUB.nc")
Mar88 <- ncvar_get(Mar88, "RUNOFF")
Mar88 <- Mar88*3600*24*31
Apr88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198804.SUB.nc")
Apr88 <- ncvar_get(Apr88, "RUNOFF")
Apr88 <- Apr88*3600*24*30
May88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198805.SUB.nc")
May88 <- ncvar_get(May88, "RUNOFF")
May88 <- May88*3600*24*31
Jun88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198806.SUB.nc")
Jun88 <- ncvar_get(Jun88, "RUNOFF")
Jun88 <- Jun88*3600*24*30
Jul88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198807.SUB.nc")
Jul88 <- ncvar_get(Jul88, "RUNOFF")
Jul88 <- Jul88*3600*24*31
Aug88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198808.SUB.nc")
Aug88 <- ncvar_get(Aug88, "RUNOFF")
Aug88 <- Aug88*3600*24*31
Sep88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198809.SUB.nc")
Sep88 <- ncvar_get(Sep88, "RUNOFF")
Sep88 <- Sep88*3600*24*30
Oct88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198810.SUB.nc")
Oct88 <- ncvar_get(Oct88, "RUNOFF")
Oct88 <- Oct88*3600*24*31
Nov88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198811.SUB.nc")
Nov88 <- ncvar_get(Nov88, "RUNOFF")
Nov88 <- Nov88*3600*24*30
Dec88 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198812.SUB.nc")
Dec88 <- ncvar_get(Dec88, "RUNOFF")
Dec88 <- Dec88*3600*24*31
Jan89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198901.SUB.nc")
Jan89 <- ncvar_get(Jan89, "RUNOFF")
Jan89 <- Jan89*3600*24*31
Feb89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198902.SUB.nc")
Feb89 <- ncvar_get(Feb89, "RUNOFF")
Feb89 <- Feb89*3600*24*28
Mar89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198903.SUB.nc")
Mar89 <- ncvar_get(Mar89, "RUNOFF")
Mar89 <- Mar89*3600*24*31
Apr89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198904.SUB.nc")
Apr89 <- ncvar_get(Apr89, "RUNOFF")
Apr89 <- Apr89*3600*24*30
May89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198905.SUB.nc")
May89 <- ncvar_get(May89, "RUNOFF")
May89 <- May89*3600*24*31
Jun89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198906.SUB.nc")
Jun89 <- ncvar_get(Jun89, "RUNOFF")
Jun89 <- Jun89*3600*24*30
Jul89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198907.SUB.nc")
Jul89 <- ncvar_get(Jul89, "RUNOFF")
Jul89 <- Jul89*3600*24*31
Aug89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198908.SUB.nc")
Aug89 <- ncvar_get(Aug89, "RUNOFF")
Aug89 <- Aug89*3600*24*31
Sep89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198909.SUB.nc")
Sep89 <- ncvar_get(Sep89, "RUNOFF")
Sep89 <- Sep89*3600*24*30
Oct89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198910.SUB.nc")
Oct89 <- ncvar_get(Oct89, "RUNOFF")
Oct89 <- Oct89*3600*24*31
Nov89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198911.SUB.nc")
Nov89 <- ncvar_get(Nov89, "RUNOFF")
Nov89 <- Nov89*3600*24*30
Dec89 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198912.SUB.nc")
Dec89 <- ncvar_get(Dec89, "RUNOFF")
Dec89 <- Dec89*3600*24*31
Jan90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199001.SUB.nc")
Jan90 <- ncvar_get(Jan90, "RUNOFF")
Jan90 <- Jan90*3600*24*31
Feb90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199002.SUB.nc")
Feb90 <- ncvar_get(Feb90, "RUNOFF")
Feb90 <- Feb90*3600*24*28
Mar90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199003.SUB.nc")
Mar90 <- ncvar_get(Mar90, "RUNOFF")
Mar90 <- Mar90*3600*24*31
Apr90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199004.SUB.nc")
Apr90 <- ncvar_get(Apr90, "RUNOFF")
Apr90 <- Apr90*3600*24*30
May90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199005.SUB.nc")
May90 <- ncvar_get(May90, "RUNOFF")
May90 <- May90*3600*24*31
Jun90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199006.SUB.nc")
Jun90 <- ncvar_get(Jun90, "RUNOFF")
Jun90 <- Jun90*3600*24*30
Jul90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199007.SUB.nc")
Jul90 <- ncvar_get(Jul90, "RUNOFF")
Jul90 <- Jul90*3600*24*31
Aug90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199008.SUB.nc")
Aug90 <- ncvar_get(Aug90, "RUNOFF")
Aug90 <- Aug90*3600*24*31
Sep90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199009.SUB.nc")
Sep90 <- ncvar_get(Sep90, "RUNOFF")
Sep90 <- Sep90*3600*24*30
Oct90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199010.SUB.nc")
Oct90 <- ncvar_get(Oct90, "RUNOFF")
Oct90 <- Oct90*3600*24*31
Nov90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199011.SUB.nc")
Nov90 <- ncvar_get(Nov90, "RUNOFF")
Nov90 <- Nov90*3600*24*30
Dec90 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199012.SUB.nc")
Dec90 <- ncvar_get(Dec90, "RUNOFF")
Dec90 <- Dec90*3600*24*31
Jan91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199101.SUB.nc")
Jan91 <- ncvar_get(Jan91, "RUNOFF")
Jan91 <- Jan91*3600*24*31
Feb91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199102.SUB.nc")
Feb91 <- ncvar_get(Feb91, "RUNOFF")
Feb91 <- Feb91*3600*24*28
Mar91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199103.SUB.nc")
Mar91 <- ncvar_get(Mar91, "RUNOFF")
Mar91 <- Mar91*3600*24*31
Apr91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199104.SUB.nc")
Apr91 <- ncvar_get(Apr91, "RUNOFF")
Apr91 <- Apr91*3600*24*30
May91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199105.SUB.nc")
May91 <- ncvar_get(May91, "RUNOFF")
May91 <- May91*3600*24*31
Jun91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199106.SUB.nc")
Jun91 <- ncvar_get(Jun91, "RUNOFF")
Jun91 <- Jun91*3600*24*30
Jul91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199107.SUB.nc")
Jul91 <- ncvar_get(Jul91, "RUNOFF")
Jul91 <- Jul91*3600*24*31
Aug91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199108.SUB.nc")
Aug91 <- ncvar_get(Aug91, "RUNOFF")
Aug91 <- Aug91*3600*24*31
Sep91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199109.SUB.nc")
Sep91 <- ncvar_get(Sep91, "RUNOFF")
Sep91 <- Sep91*3600*24*30
Oct91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199110.SUB.nc")
Oct91 <- ncvar_get(Oct91, "RUNOFF")
Oct91 <- Oct91*3600*24*31
Nov91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199111.SUB.nc")
Nov91 <- ncvar_get(Nov91, "RUNOFF")
Nov91 <- Nov91*3600*24*30
Dec91 <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.199112.SUB.nc")
Dec91 <- ncvar_get(Dec91, "RUNOFF")
Dec91 <- Dec91*3600*24*31
Jan92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199201.SUB.nc")
Jan92 <- ncvar_get(Jan92, "RUNOFF")
Jan92 <- Jan92*3600*24*31
Feb92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199202.SUB.nc")
Feb92 <- ncvar_get(Feb92, "RUNOFF")
Feb92 <- Feb92*3600*24*29
Mar92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199203.SUB.nc")
Mar92 <- ncvar_get(Mar92, "RUNOFF")
Mar92 <- Mar92*3600*24*31
Apr92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199204.SUB.nc")
Apr92 <- ncvar_get(Apr92, "RUNOFF")
Apr92 <- Apr92*3600*24*30
May92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199205.SUB.nc")
May92 <- ncvar_get(May92, "RUNOFF")
May92 <- May92*3600*24*31
Jun92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199206.SUB.nc")
Jun92 <- ncvar_get(Jun92, "RUNOFF")
Jun92 <- Jun92*3600*24*30
Jul92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199207.SUB.nc")
Jul92 <- ncvar_get(Jul92, "RUNOFF")
Jul92 <- Jul92*3600*24*31
Aug92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199208.SUB.nc")
Aug92 <- ncvar_get(Aug92, "RUNOFF")
Aug92 <- Aug92*3600*24*31
Sep92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199209.SUB.nc")
Sep92 <- ncvar_get(Sep92, "RUNOFF")
Sep92 <- Sep92*3600*24*30
Oct92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199210.SUB.nc")
Oct92 <- ncvar_get(Oct92, "RUNOFF")
Oct92 <- Oct92*3600*24*31
Nov92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199211.SUB.nc")
Nov92 <- ncvar_get(Nov92, "RUNOFF")
Nov92 <- Nov92*3600*24*30
Dec92 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199212.SUB.nc")
Dec92 <- ncvar_get(Dec92, "RUNOFF")
Dec92 <- Dec92*3600*24*31
Jan93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199301.SUB.nc")
Jan93 <- ncvar_get(Jan93, "RUNOFF")
Jan93 <- Jan93*3600*24*31
Feb93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199302.SUB.nc")
Feb93 <- ncvar_get(Feb93, "RUNOFF")
Feb93 <- Feb93*3600*24*28
Mar93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199303.SUB.nc")
Mar93 <- ncvar_get(Mar93, "RUNOFF")
Mar93 <- Mar93*3600*24*31
Apr93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199304.SUB.nc")
Apr93 <- ncvar_get(Apr93, "RUNOFF")
Apr93 <- Apr93*3600*24*30
May93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199305.SUB.nc")
May93 <- ncvar_get(May93, "RUNOFF")
May93 <- May93*3600*24*31
Jun93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199306.SUB.nc")
Jun93 <- ncvar_get(Jun93, "RUNOFF")
Jun93 <- Jun93*3600*24*30
Jul93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199307.SUB.nc")
Jul93 <- ncvar_get(Jul93, "RUNOFF")
Jul93 <- Jul93*3600*24*31
Aug93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199308.SUB.nc")
Aug93 <- ncvar_get(Aug93, "RUNOFF")
Aug93 <- Aug93*3600*24*31
Sep93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199309.SUB.nc")
Sep93 <- ncvar_get(Sep93, "RUNOFF")
Sep93 <- Sep93*3600*24*30
Oct93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199310.SUB.nc")
Oct93 <- ncvar_get(Oct93, "RUNOFF")
Oct93 <- Oct93*3600*24*31
Nov93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199311.SUB.nc")
Nov93 <- ncvar_get(Nov93, "RUNOFF")
Nov93 <- Nov93*3600*24*30
Dec93 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199312.SUB.nc")
Dec93 <- ncvar_get(Dec93, "RUNOFF")
Dec93 <- Dec93*3600*24*31
Jan94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199401.SUB.nc")
Jan94 <- ncvar_get(Jan94, "RUNOFF")
Jan94 <- Jan94*3600*24*31
Feb94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199402.SUB.nc")
Feb94 <- ncvar_get(Feb94, "RUNOFF")
Feb94 <- Feb94*3600*24*28
Mar94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199403.SUB.nc")
Mar94 <- ncvar_get(Mar94, "RUNOFF")
Mar94 <- Mar94*3600*24*31
Apr94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199404.SUB.nc")
Apr94 <- ncvar_get(Apr94, "RUNOFF")
Apr94 <- Apr94*3600*24*30
May94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199405.SUB.nc")
May94 <- ncvar_get(May94, "RUNOFF")
May94 <- May94*3600*24*31
Jun94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199406.SUB.nc")
Jun94 <- ncvar_get(Jun94, "RUNOFF")
Jun94 <- Jun94*3600*24*30
Jul94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199407.SUB.nc")
Jul94 <- ncvar_get(Jul94, "RUNOFF")
Jul94 <- Jul94*3600*24*31
Aug94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199408.SUB.nc")
Aug94 <- ncvar_get(Aug94, "RUNOFF")
Aug94 <- Aug94*3600*24*31
Sep94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199409.SUB.nc")
Sep94 <- ncvar_get(Sep94, "RUNOFF")
Sep94 <- Sep94*3600*24*30
Oct94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199410.SUB.nc")
Oct94 <- ncvar_get(Oct94, "RUNOFF")
Oct94 <- Oct94*3600*24*31
Nov94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199411.SUB.nc")
Nov94 <- ncvar_get(Nov94, "RUNOFF")
Nov94 <- Nov94*3600*24*30
Dec94 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199412.SUB.nc")
Dec94 <- ncvar_get(Dec94, "RUNOFF")
Dec94 <- Dec94*3600*24*31
Jan95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199501.SUB.nc")
Jan95 <- ncvar_get(Jan95, "RUNOFF")
Jan95 <- Jan95*3600*24*31
Feb95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199502.SUB.nc")
Feb95 <- ncvar_get(Feb95, "RUNOFF")
Feb95 <- Feb95*3600*24*28
Mar95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199503.SUB.nc")
Mar95 <- ncvar_get(Mar95, "RUNOFF")
Mar95 <- Mar95*3600*24*31
Apr95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199504.SUB.nc")
Apr95 <- ncvar_get(Apr95, "RUNOFF")
Apr95 <- Apr95*3600*24*30
May95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199505.SUB.nc")
May95 <- ncvar_get(May95, "RUNOFF")
May95 <- May95*3600*24*31
Jun95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199506.SUB.nc")
Jun95 <- ncvar_get(Jun95, "RUNOFF")
Jun95 <- Jun95*3600*24*30
Jul95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199507.SUB.nc")
Jul95 <- ncvar_get(Jul95, "RUNOFF")
Jul95 <- Jul95*3600*24*31
Aug95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199508.SUB.nc")
Aug95 <- ncvar_get(Aug95, "RUNOFF")
Aug95 <- Aug95*3600*24*31
Sep95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199509.SUB.nc")
Sep95 <- ncvar_get(Sep95, "RUNOFF")
Sep95 <- Sep95*3600*24*30
Oct95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199510.SUB.nc")
Oct95 <- ncvar_get(Oct95, "RUNOFF")
Oct95 <- Oct95*3600*24*31
Nov95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199511.SUB.nc")
Nov95 <- ncvar_get(Nov95, "RUNOFF")
Nov95 <- Nov95*3600*24*30
Dec95 <- nc_open("MERRA2_200.tavgM_2d_lnd_Nx.199512.SUB.nc")
Dec95 <- ncvar_get(Dec95, "RUNOFF")
Dec95 <- Dec95*3600*24*31

MERRA_m <- array(c(Jan86, Feb86, Mar86, Apr86, May86, Jun86, Jul86, Aug86, Sep86, Oct86, Nov86, Dec86,
                    Jan87, Feb87, Mar87, Apr87, May87, Jun87, Jul87, Aug87, Sep87, Oct87, Nov87, Dec87,
                    Jan88, Feb88, Mar88, Apr88, May88, Jun88, Jul88, Aug88, Sep88, Oct88, Nov88, Dec88,
                    Jan89, Feb89, Mar89, Apr89, May89, Jun89, Jul89, Aug89, Sep89, Oct89, Nov89, Dec89,
                    Jan90, Feb90, Mar90, Apr90, May90, Jun90, Jul90, Aug90, Sep90, Oct90, Nov90, Dec90,
                    Jan91, Feb91, Mar91, Apr91, May91, Jun91, Jul91, Aug91, Sep91, Oct91, Nov91, Dec91,
                    Jan92, Feb92, Mar92, Apr92, May92, Jun92, Jul92, Aug92, Sep92, Oct92, Nov92, Dec92,
                    Jan93, Feb93, Mar93, Apr93, May93, Jun93, Jul93, Aug93, Sep93, Oct93, Nov93, Dec93,
                    Jan94, Feb94, Mar94, Apr94, May94, Jun94, Jul94, Aug94, Sep94, Oct94, Nov94, Dec94,
                    Jan95, Feb95, Mar95, Apr95, May95, Jun95, Jul95, Aug95, Sep95, Oct95, Nov95, Dec95), dim = c(576, 361, 120))

### MERRA-2 Lat & Lon ###
fi <- nc_open("MERRA2_100.tavgM_2d_lnd_Nx.198601.SUB.nc")
#lon
lon <- ncvar_get(fi, "lon")
lon2D <- kronecker(matrix(1, 1, 361), lon)
#lat
lat <- ncvar_get(fi, "lat", verbose = F)
lat <- data.frame(lat)
lat <- t(lat)
lat2D <- kronecker(matrix(1, 576, 1), lat)

# mask out non--urban
flag_na <- is.na(as.vector(MERRA_m[,,1]))
MERRAlat2D <- as.vector(lat2D)
MERRAlat2D[flag_na] <- NA
MERRAlon2D <- as.vector(lon2D)
MERRAlon2D[flag_na] <- NA

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

MERRA_agg1 <- array(NA,c(288,192,120))
for (k in 1:60) {
  cat(paste("********* ",as.character(k)," *******"),sep='\n')
  dLatCESM<-0.9424; dLonCESM<-1.25;
  for (i in 1:288) {
    for (j in 1:192) {
      cat(paste("********* ",as.character(i), ",", as.character(j), " *******"),sep='\n')
      edgeLat<-c(lat2D[i,j]-dLatCESM/2,lat2D[i,j]+dLatCESM/2)
      edgeLon<-c(lon2D[i,j]-dLonCESM/2,lon2D[i,j]+dLonCESM/2)
      isIn <- (MERRAlat2D>edgeLat[1] & MERRAlat2D<edgeLat[2] & MERRAlon2D>edgeLon[1] & MERRAlon2D<edgeLon[2])
      sum(sum(isIn,na.rm = T))
      MERRA_agg1[i,j,k]<-mean(MERRA_m[,,k][isIn], na.rm = T)
    }
  }
}

save(list = c("MERRA_m", "MERRA_agg1"), file = "MERRA_Aggregation1.RData")
