#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRPermutationPgriph: File
  skeletonPermutationP: File
  index_array: string[]
  mtxProva: File
  nCluster1: File
outputs: 
  mtxKilledCell1:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxKilledCell
  mtxPermutationP1:
    type: 
      type: array
      items: File
    outputSource: permutationP1/mtxPermutationP

steps:
  permutationP1:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationPgriph
      mtxTopX: mtxProva
      skeleton: skeletonPermutationP
      index: index_array
      nCluster: nCluster1
    out: [mtxKilledCell, mtxPermutationP]  

