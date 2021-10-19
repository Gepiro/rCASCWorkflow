#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.mtxScanno)
        writable: true
      - entry: $(inputs.skeleton)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxScanno.basename)
inputs:
  fileRConvertMtxScannoBy:
    type: File
    inputBinding:
      position: 1
  mtxScanno:
    type: File
  skeleton:
    type: File
outputs:
  mtxConverted:
    type: File
    outputBinding:
      glob: output.csv
