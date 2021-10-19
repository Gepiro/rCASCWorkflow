array <- commandArgs(trailingOnly = TRUE)
source("permutationClusteringSWP.R") 
library(rCASC)
file=paste(getwd(),array[1],sep="/")
index=array[2]
nCluster=read.delim(paste(getwd(),array[3],sep="/"), header=FALSE)
nCluster=substring(nCluster, 1)
permutationClusteringSWP(group="docker", scratch.folder=getwd(), file=file, percent=10, nCluster=nCluster, separator="\t", logTen=0, clustering="tSne", perplexity=10 , seed=1111, rK=0, index=index)
#cambia \t
