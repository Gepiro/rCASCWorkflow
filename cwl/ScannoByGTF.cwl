#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.mtxCount)
        writable: true
      - entry: $(inputs.gtf)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxCount.basename)
  - position: 3
    valueFrom: $(inputs.gtf.basename)
inputs:
  fileRScanno:
    type: File
    inputBinding:
      position: 1
  mtxCount:
    type: File
  gtf:
    type: File
outputs:
  mtxScanno:
    type: File
    outputBinding:
      glob: annotated_$(inputs.mtxCount.nameroot).csv
