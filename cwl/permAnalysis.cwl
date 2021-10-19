#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.skeleton)
        writable: true
      - entry: $(inputs.mtxTopX)
        writable: true
      - entry: $(inputs.clusteringOutput)
        writable: true
      - entry: $(inputs.clusterP)
        writable: true
      - entry: $(inputs.kill)
        writable: true
      - entry: $(inputs.nCluster)
        writable: true
arguments:
  - valueFrom: $(inputs.mtxTopX.basename)
    position: 2
  - valueFrom: $(inputs.clusteringOutput.basename)
    position: 3
  - valueFrom: $(inputs.clusterP.basename)
    position: 4
  - valueFrom: $(inputs.kill.basename)
    position: 5
  - valueFrom: $(inputs.nCluster.basename)
    position: 6
inputs:
  fileRPermAnalysis:
    type: File
    inputBinding:
      position: 1
  mtxTopX:
    type: File
  clusteringOutput:
    type: File
  clusterP:
    type: File
  kill:
    type: File
  nCluster:
    type: File
  skeleton:
    type: File
outputs:
  mtxScore:
    type: File
    outputBinding:
      glob: Results/$(inputs.mtxTopX.nameroot)_score.csv
  mtxScoreSum:
    type: File
    outputBinding:
      glob: Results/$(inputs.mtxTopX.nameroot)_scoreSum.csv

