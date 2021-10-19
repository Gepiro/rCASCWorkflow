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
      - entry: $(inputs.nCluster)
        writable: true
      - entry: $(inputs.fileRPermutationP)
        writable: true
arguments:
  - position: 2
    valueFrom: $(inputs.mtxTopX.basename)
  - position: 4
    valueFrom: $(inputs.nCluster.basename)
inputs:
  fileRPermutationP:
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
  nCluster:
    type: File
outputs:
  mtxPermutationP:
    type: File
    outputBinding:
      glob: Permutation/$(inputs.index)/clusterB_$(inputs.index)$(inputs.mtxTopX.nameext)
  mtxKilledCell:
    type: File
    outputBinding:
      glob: Permutation/$(inputs.index)/killC_$(inputs.index)$(inputs.mtxTopX.nameext)

