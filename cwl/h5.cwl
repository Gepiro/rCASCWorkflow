#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.h5Count)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.h5Count.basename)
inputs:
  fileRH5:
    type: File
    inputBinding:
      position: 1
  h5Count:
    type: File
outputs:
  mtxCount:
    type: File
    outputBinding:
      glob: $(inputs.h5Count.nameroot).csv
