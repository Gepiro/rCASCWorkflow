#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRPermutationP: File
  skeletonPermutationP: File
  index_prova: string[]
  mtxProva: File
  nCluster1: File
  nCluster2: File
  nCluster3: File
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
  mtxKilledCell2:
    type:
      type: array
      items: File
    outputSource: permutationP2/mtxKilledCell
  mtxPermutationP2:
    type:
      type: array
      items: File
    outputSource: permutationP2/mtxPermutationP
  mtxKilledCell3:
    type:
      type: array
      items: File
    outputSource: permutationP3/mtxKilledCell
  mtxPermutationP3:
    type:
      type: array
      items: File
    outputSource: permutationP3/mtxPermutationP

steps:
  permutationP1:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationP
      mtxTopX: mtxProva
      skeleton: skeletonPermutationP
      index: index_prova
      nCluster: nCluster1
    out: [mtxKilledCell, mtxPermutationP]  
  permutationP2:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationP
      mtxTopX: mtxProva
      skeleton: skeletonPermutationP
      index: index_prova
      nCluster: nCluster2
    out: [mtxKilledCell, mtxPermutationP]
  permutationP3:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationP
      mtxTopX: mtxProva
      skeleton: skeletonPermutationP
      index: index_prova
      nCluster: nCluster3
    out: [mtxKilledCell, mtxPermutationP]
