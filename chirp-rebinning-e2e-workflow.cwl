#!/usr/bin/env cwl-runner
cwlVersion: v1.1
class: Workflow
label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

$namespaces:
  cwltool: http://commonwl.org/cwltool#

requirements:
  SubworkflowFeatureRequirement: {}
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  MultipleInputFeatureRequirement: {}


## Inputs to the e2e rebinning, not to each applicaiton within the workflow
inputs:

  # Generic inputs
  input_processing_labels: string[]

  # For CMR Search Step
  input_cmr_collection_name: string
  input_cmr_search_start_time: string
  input_cmr_search_stop_time: string

  #for chirp rebinning step
  # none -

  # For unity data upload step, unity catalog
  output_collection_id: string
  output_data_bucket: string

  # For DAAC CNM step
  input_daac_collection_shortname: string
  input_daac_collection_sns: string


outputs: 
  results: 
    type: File
    outputSource: data-catalog/results

steps:
  cmr-step:
    run: http://awslbdockstorestack-lb-1429770210.us-west-2.elb.amazonaws.com:9998/api/ga4gh/trs/v2/tools/%23workflow%2Fdockstore.org%2Fmike-gangl%2Fcmr-trial/versions/1/PLAIN-CWL/descriptor/%2FDockstore.cwl
    in:
      cmr_collection : input_cmr_collection_name
      cmr_start_time: input_cmr_search_start_time
      cmr_stop_time: input_cmr_search_stop_time
      # # Need to understand the best way of inputting this credential, nullables
      # cmr_edl_user: "null"
      # cmr_edl_pass: "null"
    out: [results]
  chirp-rebinning:
    # run: https://raw.githubusercontent.com/unity-sds/sounder-sips-application/main/cwl/l1b_workflow.cwl
    run: http://awslbdockstorestack-lb-1429770210.us-west-2.elb.amazonaws.com:9998/api/ga4gh/trs/v2/tools/%23workflow%2Fdockstore.org%2Fmcduffie%2Fchirp-rebinning-app-package/versions/1/PLAIN-CWL/descriptor/%2Fworkflow.cwl
    in:
      stage_in:
        source: [cmr-step/results]
        valueFrom: |
          ${
              return {
                download_type: 'DAAC',
                stac_json: self,
              };
          }
      parameters:
        source: [output_collection_id]
        valueFrom: |
          ${
              return {
                output_collection: self
              };
          }
      stage_out:
        source: [output_data_bucket, output_collection_id ]
        valueFrom: |
          ${
              return {
                s3_url: self[0] + "/" + self[1]
              };
          }
    out: [results]
  data-catalog:
    run: http://awslbdockstorestack-lb-1429770210.us-west-2.elb.amazonaws.com:9998/api/ga4gh/trs/v2/tools/%23workflow%2Fdockstore.org%2Fmike-gangl%2Fcatalog-trial/versions/1/PLAIN-CWL/descriptor/%2FDockstore.cwl
    in:
      unity_username:
        valueFrom: "base64encodedusername"
      unity_password:
        valueFrom: "base64encodedpassword"
      unity_client_id:
        valueFrom: "71g0c73jl77gsqhtlfg2ht388c"
      unity_dapa_api:
        valueFrom: "https://1gp9st60gd.execute-api.us-west-2.amazonaws.com/dev/"
      uploaded_files_json: chirp-rebinning/results
    out: [results]

