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
arguments:
  - position: 2
    valueFrom: $(inputs.mtxTopX.basename)
inputs:
  fileRPermutationZero:
    type: File
    inputBinding:
      position: 1
  mtxTopX:
    type: File
  skeleton:
    type: File
outputs:
  mtxPermutationZero:
    type: File
    outputBinding:
      glob: Results/$(inputs.mtxTopX.nameroot)/$(inputs.mtxTopX.nameroot)_clustering.output.csv
  nCluster:
    type: File
    outputBinding:
      glob: nCluster.txt
