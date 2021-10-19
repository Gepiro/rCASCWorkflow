#!usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
inputs:
  fileRCount: File
  directory-transcriptome: Directory
  fastqFolder: Directory
  fileRH5: File
  fileRScanno: File
  gtf: File
  fileRConvertMtxScannoBy: File
  skeletonConvertMtxScannoBy: File
  fileRTopX: File
  fileRPermutationZero: File
  skeletonPermutationZero: File
  fileRPermutationP: File
  skeletonPermutationP: File
  index_array: string[]
  fileRPermutationFinal: File
  skeletonPermutationFinal: File
  permutationFolder: Directory
  fileRPermAnalysis: File
  skeletonPermAnalysis: File
  fileRAutoencoder: File
  skeletonAutoencoder: File
  index_array_autoencoder: string[]
  projectName: string
  fileRComet: File
  skeletonComet: File
outputs: 
  mtxScanno:
    type: File
    outputSource: scanno/mtxScanno
  mtxTopX:
    type: File
    outputSource: topx/mtxTopX
  mtxPermutationZero:
    type: File
    outputSource: permutationzero/mtxPermutationZero
  nCluster:
    type: File
    outputSource: permutationzero/nCluster
  mtxKilledCell:
    type: 
      type: array
      items: File
    outputSource: permutationP/mtxKilledCell
  mtxPermutationP:
    type: 
      type: array
      items: File
    outputSource: permutationP/mtxPermutationP
  mtxPermutationFinalP:
    type: File
    outputSource: permutationFinal/mtxPermutationFinalP
  mtxPermutationFinalK:
    type: File
    outputSource: permutationFinal/mtxPermutationFinalK
  data:
    type: Directory
    outputSource: comet/data
  vis:
    type: Directory
    outputSource: comet/vis
  pickles:
    type: Directory
    outputSource: comet/pickles
  mtxScore:
    type: File
    outputSource: permAnalysis/mtxScore
  mtxScoreSum:
    type: File
    outputSource: permAnalysis/mtxScoreSum
  mtxAutoencoder:
    type:
      type: array
      items: File
    outputSource: autoencoder/mtxAutoencoder


steps:
  count:
    run: cellrangerCount.cwl
    in:
      fileRCount: fileRCount
      directory-transcriptome: directory-transcriptome
      fastqFolder: fastqFolder
    out: [h5Count]
  h5:
    run: h5.cwl
    in:
      fileRH5: fileRH5
      h5Count: count/h5Count
    out: [mtxCount]
  scanno:
    run: ScannoByGTF.cwl
    in:
      fileRScanno: fileRScanno
      mtxCount: h5/mtxCount
      gtf: gtf
    out: [mtxScanno]
  convertmtxscanno:
    run: convertMtxScannoBy.cwl
    in:
      fileRConvertMtxScannoBy: fileRConvertMtxScannoBy
      mtxScanno: scanno/mtxScanno
      skeleton: skeletonConvertMtxScannoBy
    out: [mtxConverted]
  topx:
    run: TopX.cwl
    in:
      fileRTopX: fileRTopX
      mtxScanno: convertmtxscanno/mtxConverted
    out: [mtxTopX]
  permutationzero:
    run: permutationClusteringZero.cwl
    in:
      fileRPermutationZero: fileRPermutationZero
      mtxTopX: topx/mtxTopX
      skeleton: skeletonPermutationZero 
    out: [mtxPermutationZero, nCluster]
  permutationP:
    run: permutationClusteringP.cwl
    scatter: index
    in:
      fileRPermutationP: fileRPermutationP
      mtxTopX: topx/mtxTopX
      skeleton: skeletonPermutationP
      nCluster: permutationzero/nCluster
      index: index_array
    out: [mtxKilledCell, mtxPermutationP]
  permutationFinal:
    run: permutationClusteringFinal.cwl
    in:
      fileRPermutationFinal: fileRPermutationFinal
      mtxTopX: topx/mtxTopX
      skeleton: skeletonPermutationFinal
      permutationFolder: permutationFolder
      nCluster: permutationzero/nCluster
      stopFiles: permutationP/mtxKilledCell
    out: [mtxPermutationFinalP, mtxPermutationFinalK]
  permAnalysis:
    run: permAnalysis.cwl
    in:
      fileRPermAnalysis: fileRPermAnalysis
      mtxTopX: topx/mtxTopX
      clusteringOutput: permutationzero/mtxPermutationZero
      clusterP: permutationFinal/mtxPermutationFinalP
      kill: permutationFinal/mtxPermutationFinalK
      nCluster: permutationzero/nCluster
      skeleton: skeletonPermAnalysis
    out: [mtxScore, mtxScoreSum]
  comet:
    run: comet.cwl
    in:
      fileRComet: fileRComet
      file: topx/mtxTopX
      clusteringOutput: permutationzero/mtxPermutationZero
      skeleton: skeletonComet
    out: [data, vis, pickles]
  autoencoder:
    run: autoencoder.cwl
    scatter: index
    in:
      fileRAutoencoder: fileRAutoencoder
      mtxTopX: topx/mtxTopX
      skeleton: skeletonAutoencoder
      index: index_array_autoencoder
      projectName: projectName
    out: [mtxAutoencoder]
