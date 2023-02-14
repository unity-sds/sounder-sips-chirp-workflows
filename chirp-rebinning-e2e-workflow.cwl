#!/usr/bin/env cwl-runner
cwlVersion: v1.0
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

outputs:
# none?

steps:
  cmr-step:
    run: cmr-tool-wrapper.cwl
    in:
      cmr_collection : input_cmr_collection_name
      cmr_start_time: input_cmr_search_start_time
      cmr_stop_time: input_cmr_search_stop_time
      # Need to understand the best way of inputting this credential, nullables
      cmr_edl_user: ${ssm.edl_username}
      cmr_edl_pass: ${ssm.edl_password}
    out:
    - stac_search_results

  chirp-rebinning:
    # run: https://raw.githubusercontent.com/unity-sds/sounder-sips-application/main/cwl/l1b_workflow.cwl
    run: rebinning.cwl
    in:
      granules: cmr-step/stac_search_results
    out:
    - output_files

  unity-data-upload:
    run: unity_upload.cwl
    in:
      files: chirp-rebinning/output_files
      collection: output_collection_id
      bucket: output_data_bucket
    out:
      output-stac

  data-catalog:
    run: dapa_catalog.cwl
    in:
      collection: output_collection_id
      bucket: output_data_bucket
      data: unity-data-upload/output-stac
      labels: input_processing_labels
    out:
    - stdout_file
    - stderr_file

  daac-notification:
    run: daac_notify.cwl
    in:
      daac_collection: input_daac_collection_shortname
      daac_sns:input_daac_collection_sns
      data: unity-data-upload/output-stac
