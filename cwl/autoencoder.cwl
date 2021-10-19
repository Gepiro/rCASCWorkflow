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
  fileRAutoencoder:
    type: File
    inputBinding:
      position: 1
  mtxTopX:
    type: File
  skeleton:
    type: File
  index:
    type: string
    inputBinding:
      position: 3
  projectName:
    type: string
    inputBinding:
      position: 4
outputs:
  mtxAutoencoder:
    type: File
    outputBinding:
      glob: Results/$(inputs.projectName)/permutation/$(inputs.index)denseSpace.csv
