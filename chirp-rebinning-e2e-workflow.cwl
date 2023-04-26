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


outputs: []
# none?

steps:
  cmr-step:
    run: cmr/cmr-workflow.cwl
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
    run: rebinning-app-package-proxy/rebinning-workflow.cwl
    in:
      parameters:
        source: [cmr-step/results]
        valueFrom: |
          ${
              return {
                input_filename: {s3_url: self['location']},
                line_offset: 0,
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
    run: catalog/catalog-workflow.cwl
    in:
      uds_collection: output_collection_id
      stac: chirp-rebinning/results
    out: [results]
  #
  # daac-notification:
  #   run: daac_notify.cwl
  #   in:
  #     daac_collection: input_daac_collection_shortname
  #     daac_sns: input_daac_collection_sns
  #     data: unity-data-upload/output-stac
  #   out: []
