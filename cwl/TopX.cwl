#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.mtxScanno)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxScanno.basename)
inputs:
  fileRTopX:
    type: File
    inputBinding:
      position: 1
  mtxScanno:
    type: File
outputs:
  mtxTopX:
    type: File
    outputBinding:
      glob: filtered_expression_$(inputs.mtxScanno.nameroot).csv
