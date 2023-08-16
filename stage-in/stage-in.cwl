cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["DOWNLOAD"]

requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:5.3.1
  EnvVarRequirement:
    envDef:
      DOWNLOAD_DIR: $(runtime.outdir)/$(inputs.download_dir)
      STAC_JSON: $(inputs.stac_json.path)
      GRANULES_DOWNLOAD_TYPE: $(inputs.download_type)
      EDL_BASE_URL: 'https://urs.earthdata.nasa.gov/'
      EDL_USERNAME: $(inputs.edl_username)
      EDL_PASSWORD: $(inputs.edl_password)
      EDL_PASSWORD_TYPE: 'BASE64'
      LOG_LEVEL: '10'
      OUTPUT_FILE: '$(runtime.outdir)/$(inputs.download_dir)/stage-in-results.json'
      PARALLEL_COUNT: '-1'
      DOWNLOAD_RETRY_WAIT_TIME: '30'
      DOWNLOAD_RETRY_TIMES: '5'

inputs:
  download_dir:
    type: string
  download_type:
    type: string
  stac_json:
    type: File
  edl_username:
    type: string
  edl_password:
    type: string

outputs:
  stage_in_results:
    type: File
    outputBinding:
      glob: "$(runtime.outdir)/$(inputs.download_dir)/stage-in-results.json"
  download_dir:
    type: Directory
    outputBinding:
      glob: "$(inputs.download_dir)"
