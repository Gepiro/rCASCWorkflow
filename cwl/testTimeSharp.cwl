#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRClusteringSharp: File
  skeletonClusteringSharp: File
  index_array: string[]
  mtxProva: File
outputs: 
  mtxSharpK:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxSharpK
  mtxSharpP:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxSharpP

steps:
  permutationP1:
    run: permutationClusteringSharp.cwl
    scatter: index
    in:
      fileRClusteringSharp: fileRClusteringSharp
      mtxTopX: mtxProva
      skeleton: skeletonClusteringSharp
      index: index_array
    out: [mtxSharpK, mtxSharpP]  

