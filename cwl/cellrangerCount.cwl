#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.fastqFolder)
        writable: true
inputs:
  fileRCount:
    type: File
    inputBinding:
      position: 1
  directory-transcriptome:
    type: Directory
    inputBinding:
      position: 2
  fastqFolder:
    type: Directory
    inputBinding:
      position: 3
outputs:
  h5Count:
    type: File
    outputBinding:
      glob: $(inputs.fastqFolder.basename)/results_cellranger/outs/filtered_feature_bc_matrix.h5
