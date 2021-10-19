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
      - entry: $(inputs.fileRClusteringSharp)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxTopX.basename)
inputs:
  fileRClusteringSharp:
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
outputs:
  mtxSharpP:
    type: File
    outputBinding:
      glob: Results/$(inputs.mtxTopX.nameroot)/$(inputs.index)/Permutation/clusterB_$(inputs.index)$(inputs.mtxTopX.nameext)
  mtxSharpK:
    type: File
    outputBinding:
      glob: Results/$(inputs.mtxTopX.nameroot)/$(inputs.index)/Permutation/killC_$(inputs.index)$(inputs.mtxTopX.nameext)

