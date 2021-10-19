array <- commandArgs(trailingOnly = TRUE)
directory = array[1]
fastqs = array[2]
library(rCASC)
cellrangerCount(group="docker",  transcriptome.folder=directory,  fastq.folder=fastqs, expect.cells=100, nosecondary=TRUE, scratch.folder=getwd())
