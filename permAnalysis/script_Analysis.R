array <- commandArgs(trailingOnly = TRUE)
source("skeleton_permAnalysis.R")
library(rCASC)
file=paste(getwd(),array[1],sep="/")
clusteringOutput=paste(getwd(),array[2],sep="/")
clusterP=paste(getwd(),array[3],sep="/")
kill=paste(getwd(),array[4],sep="/")
nCluster=read.delim(paste(getwd(),array[5],sep="/"), header=FALSE)
nCluster=substring(nCluster, 1)
permAnalysisGriphSW(group="docker",scratch.folder=getwd(),file=file,nCluster=nCluster, 
                          clustering.output=clusteringOutput, 
                          clusterP=clusterP,
                          kill=kill, sep=",",sp=0.8)
