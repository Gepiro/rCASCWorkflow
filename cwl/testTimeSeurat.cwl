#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRClusteringSeurat: File
  skeletonClusteringSeurat: File
  index_array: string[]
  mtxProva: File
outputs: 
  mtxSeuratK:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxSeuratK
  mtxSeuratP:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxSeuratP

steps:
  permutationP1:
    run: permutationClusteringSeurat.cwl
    scatter: index
    in:
      fileRClusteringSeurat: fileRClusteringSeurat
      mtxTopX: mtxProva
      skeleton: skeletonClusteringSeurat
      index: index_array
    out: [mtxSeuratK, mtxSeuratP]  

