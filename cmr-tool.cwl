cwlVersion: v1.2
class: CommandLineTool

# results in a STAC file called "cmr-results.json" being created with result of a CMR query
baseCommand: cmr.py

inputs:
  cmr_collection:
    type: string
    inputBinding: {}
  cmr_start_time:
    type: string
    inputBinding: {}
  cmr_stop_time:
    type: string
    inputBinding: {}
  cmr_edl_user:
    type: string
    inputBinding: {}
  cmr_edl_pass:
    type: string
    inputBinding: {}

#stac json catalog are the outputs
outputs:
  results:
      outputBinding:
        glob: "cmr-results.json"
      type: File
