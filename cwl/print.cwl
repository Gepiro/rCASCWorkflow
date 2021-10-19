#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [echo]
inputs:
  file:
    type: File
    inputBinding:
      position: 1
outputs: []
