#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
inputs:
  fileRIndexing:
    type: File
    inputBinding:
      position: 1
  gtfUrl:
    type: string
    inputBinding:
      position: 2
  fastaUrl:
    type: string
    inputBinding:
      position: 3
outputs:
  directory-transcriptome:
    type: Directory
    outputBinding:
      glob: 10XGenome
