#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRPermutationZero: File
  skeletonPermutationZero: File
  fileRPermutationP: File
  skeletonPermutationP: File
  index_array: string[]
  fileRPermutationFinal: File
  skeletonPermutationFinal: File
  permutationFolder: Directory
  prova: File
  nCluster: File
outputs: 
  mtxKilledCell:
    type: 
      type: array
      items: File
    outputSource: permutationP/mtxKilledCell
  mtxPermutationP:
    type: 
      type: array
      items: File
    outputSource: permutationP/mtxPermutationP

steps:
  permutationP:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationP
      mtxTopX: prova
      skeleton: skeletonPermutationP
      index: index_array
      nCluster: nCluster
    out: [mtxKilledCell, mtxPermutationP]  
