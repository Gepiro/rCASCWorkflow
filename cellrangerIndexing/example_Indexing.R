file <- commandArgs(trailingOnly = TRUE)
library(rCASC)
gtfUrl = array[1]
fastaUrl = array[2]
cellrangerIndexing(group="docker", scratch.folder=getwd(), 
            gtf.url=gtfUrl,fasta.url=fastaUrl, genomeFolder = getwd(), bio.type="protein_coding", nThreads = 8)
