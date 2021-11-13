array <- commandArgs(trailingOnly = TRUE)
source("skeleton_finalClustering.R") 
library(rCASC)
file=paste(getwd(),array[1],sep="/")
nCluster=read.delim(paste(getwd(),array[3],sep="/"), header=FALSE)
nCluster=substring(nCluster, 1)
finalClustering(group="docker", permutation.folder=array[2], file=file, nCluster=nCluster, separator=",", clustering="SIMLR")

