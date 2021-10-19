#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.file)
        writable: true
      - entry: $(inputs.clusteringOutput)
        writable: true
      - entry: $(inputs.skeleton)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.file.basename)
  - position: 3
    valueFrom: $(inputs.clusteringOutput.basename)
inputs:
  fileRComet:
    type: File
    inputBinding:
      position: 1
  file:
    type: File
  clusteringOutput:
    type: File
  skeleton:
    type: File
outputs:
  data:
    type: Directory
    outputBinding:
      glob: outputdata
  vis:
    type: Directory
    outputBinding:
      glob: outputvis
  pickles:
    type: Directory
    outputBinding:
      glob: output_pickles
