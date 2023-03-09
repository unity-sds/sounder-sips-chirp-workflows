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

  parameters:
      - 'null'
      - type: record
        name: parameters
        fields:
          input_filename:
            type:
            - fields:
                aws_access_key_id: string
                aws_secret_access_key: string
                aws_session_token: string?
                region_name: string?
                s3_url:
                  type:
                  - string
                  - string[]
              name: S3
              type: record
            - fields:
                password: string
                url:
                  type:
                  - string
                  - string[]
                username: string
              name: DAAC
              type: record
            - fields:
                collection_id: string
                granule_name: string
                maap_pgt: string
              name: MAAP
              type: record
            - fields:
                maap_pgt: string
                url:
                  type:
                  - string
                  - string[]
              name: MAAP_HTTP
              type: record
            - fields:
                role_arn: string
                source_profile: string
              name: Role
              type: record
            - fields:
                path:
                  type:
                  - File
                  - File[]
              name: Local
              type: record
            - fields:
                url:
                  type:
                  - string
                  - string[]
              name: HTTP
              type: record
            - fields:
                s3_url:
                  type:
                  - string
                  - string[]
              name: S3_unsigned
              type: record
          line_offset: float




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
    run: rebinning-app-package/rebinning-workflow.cwl
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
        source: [cmr-step/results]
        valueFrom: |
          ${
              return {
                s3_url: "blah"
              };
          }
    out: []
  #
  # unity-data-upload:
  #   run: unity_upload.cwl
  #   in:
  #     files: chirp-rebinning/output_files
  #     collection: output_collection_id
  #     bucket: output_data_bucket
  #   out:
  #     output-stac
  #
  # data-catalog:
  #   run: dapa_catalog.cwl
  #   in:
  #     collection: output_collection_id
  #     bucket: output_data_bucket
  #     data: unity-data-upload/output-stac
  #     labels: input_processing_labels
  #   out:
  #   - stdout_file
  #   - stderr_file
  #
  # daac-notification:
  #   run: daac_notify.cwl
  #   in:
  #     daac_collection: input_daac_collection_shortname
  #     daac_sns: input_daac_collection_sns
  #     data: unity-data-upload/output-stac
  #   out: []
