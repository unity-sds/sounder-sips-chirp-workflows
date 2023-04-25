#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

$namespaces:
  cwltool: http://commonwl.org/cwltool#

requirements:
  SubworkflowFeatureRequirement: {}
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  download_dir: string
  download_type: string
  edl_username: string
  edl_password: string
  stac_json: File

outputs:
  stage_in_results:
    type: File
    outputSource: stage-in/stage_in_results
  data:
    type: Directory
    outputSource: stage-in/download_dir

steps:
    stage-in:
      run: "stage-in.cwl"
      in:
        stac_json: stac_json
        download_dir: download_dir
        download_type: download_type
        edl_username: edl_username
        edl_password: edl_password
      out: [stage_in_results, download_dir]
