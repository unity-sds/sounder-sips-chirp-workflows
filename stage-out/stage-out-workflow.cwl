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
  aws_access_key_id: string
  aws_secret_access_key: string
  aws_session_token: string
  unity_username: string
  unity_password: string
  unity_client_id: string
  unity_dapa_api: string
  collection_id: string
  staging_bucket: string
  catalog_file: File
  sample_output_data: Directory

outputs:
  stage_out_results:
    type: File
    outputSource: stage-out/stage_out_results

steps:
    stage-out:
      run: "stage-out.cwl"
      in:
        aws_access_key_id: aws_access_key_id
        aws_secret_access_key: aws_secret_access_key
        aws_session_token: aws_session_token
        unity_username: unity_username
        unity_password: unity_password
        unity_client_id: unity_client_id
        unity_dapa_api: unity_dapa_api
        collection_id: collection_id
        staging_bucket: staging_bucket
        catalog_file: catalog_file
        sample_output_data: sample_output_data
      out: [stage_out_results]
