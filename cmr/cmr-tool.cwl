cwlVersion: v1.2
class: CommandLineTool

# results in a STAC file called "cmr-results.json" being created with result of a CMR query
baseCommand: ["SEARCH"]

stdout: cmr-results.json

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:3.3.1
  EnvVarRequirement:
    envDef:
      GRANULES_SEARCH_DOMAIN: 'CMR'
      CMR_BASE_URL: 'https://cmr.earthdata.nasa.gov'
      COLLECTION_ID: $(inputs.cmr_collection)
      LIMITS: $(inputs.limits || '-1')
      DATE_FROM: $(inputs.cmr_start_time)
      DATE_TO: $(inputs.cmr_stop_time)
      FILTER_ONLY_ASSETS: 'TRUE'

inputs:
  cmr_collection:
    type: string
  cmr_start_time:
    type: string
  cmr_stop_time:
    type: string
  cmr_edl_user:
    type: string?
  cmr_edl_pass:
    type: string?
  limits:
    type: string?

#stac json catalog are the outputs
outputs:
  cmr_results:
    type: stdout
