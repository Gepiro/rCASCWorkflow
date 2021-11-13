file <- commandArgs(trailingOnly = TRUE)
source("permutationClusteringSW.R") 
library(rCASC)
file=paste(getwd(),file,sep="/")
permutationClusteringSW(group="docker", scratch.folder=getwd(), file=file,nCluster=3, separator=",", logTen=0, clustering="SIMLR", perplexity=10 , seed=111, rK=0)

