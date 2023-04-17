#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

$namespaces:
  cwltool: http://commonwl.org/cwltool#

requirements:
  SubworkflowFeatureRequirement: {}

## Inputs to the e2e rebinning, not to each applicaiton within the workflow
inputs:
  cmr_collection : string
  cmr_start_time: string
  cmr_stop_time: string
  limits: string?
  cmr_edl_user: string?
  cmr_edl_pass: string?

outputs:
  results:
    type: File
    outputSource: cmr-search/cmr_results

steps:
    cmr-search:
      run: "cmr-tool.cwl"
      in:
        cmr_collection: cmr_collection
        cmr_start_time: cmr_start_time
        cmr_stop_time: cmr_stop_time
        limits: limits
        cmr_edl_user: cmr_edl_user
        cmr_edl_pass: cmr_edl_user
      # this is a stac catalog pointing to the CMR STAC as an item
      out: [cmr_results]
