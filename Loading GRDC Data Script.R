rm(list = ls(all=TRUE))
library(data.table)
workdir <- "/Users/lauragray/Downloads/Research/GRDC Data"
setwd(workdir)

mydata <- read.table("4103710_Q_Month.txt", sep = ";")
mydata <- mydata[-c(2,3,5)]
mydata <- mydata[-c(1), ]
mydata = data.frame(Date = mydata$V1, Value = mydata$V4)
setDT(mydata)
mydata[Date >= "2000-01-01", ]
