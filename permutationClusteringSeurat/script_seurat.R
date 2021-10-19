array <- commandArgs(trailingOnly = TRUE)
file=paste(getwd(),array[1],sep="/")
index=array[2]
source("skeleton_seuratPermutation.R")
library(rCASC)
seuratPermutationSW(group=c("docker"), scratch.folder=getwd(), file=file,percent=10, separator="\t", logTen=0,pcaDimensions=6,seed=111, index=index)
