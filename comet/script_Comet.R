array <- commandArgs(trailingOnly = TRUE)
source("skeleton_Comet.R")
library("rCASC")
cometsc(group="docker", file=paste(getwd(), array[1],sep="/"), 
            scratch.folder=getwd(),
            threads=1, counts="True", skipvis="False", nCluster=8, 
            separator=",", 
            clustering.output=paste(getwd(),array[2],sep="/")) 
