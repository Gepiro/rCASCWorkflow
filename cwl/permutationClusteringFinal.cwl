#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.mtxTopX)
        writable: true
      - entry: $(inputs.skeleton)
        writable: true
      - entry: $(inputs.permutationFolder)
      - entry: $(inputs.nCluster)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxTopX.basename)
  - position: 4
    valueFrom: $(inputs.nCluster.basename)
inputs:
  fileRPermutationFinal:
    type: File
    inputBinding:
      position: 1
  mtxTopX:
    type: File
  skeleton:
    type: File
  permutationFolder:
    type: Directory  
    inputBinding:
      position: 3
  stopFiles:
    type: 
      type: array
      items: File
  nCluster:
    type: File
outputs:
  mtxPermutationFinalP:
    type: File
    outputBinding:
      glob: $(inputs.mtxTopX.nameroot)_final_clusterP.csv
  mtxPermutationFinalK:
    type: File
    outputBinding:
      glob: $(inputs.mtxTopX.nameroot)_final_killedCell.csv
