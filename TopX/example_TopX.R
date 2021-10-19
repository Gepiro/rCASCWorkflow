file <- commandArgs(trailingOnly = TRUE)
library(rCASC)
topx(group="docker", file=paste(getwd(),file,sep="/"), threshold=100, logged=FALSE, type="expression", separator=",")
