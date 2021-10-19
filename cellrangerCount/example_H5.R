file <- commandArgs(trailingOnly = TRUE)
library(rCASC)
h5tocsv(group="docker", file=paste(getwd(),file,sep="/"), type="h5")
