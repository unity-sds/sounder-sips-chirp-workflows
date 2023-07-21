cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["UPLOAD"]

stdout: stage-out-results.json

requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:5.2.2
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.sample_output_data)
      entryname: /tmp/outputs
  EnvVarRequirement:
    envDef:
      AWS_REGION: $(inputs.aws_region)
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
      AWS_SESSION_TOKEN: $(inputs.aws_session_token)

      COLLECTION_ID: $(inputs.collection_id)
      STAGING_BUCKET: $(inputs.staging_bucket)
      CATALOG_FILE: $(inputs.catalog_file.path)
      OUTPUT_FILE: '$(runtime.outdir)/stage-out-results.json'

inputs:
  aws_region:
    type: string
    default: us-west-2
  aws_access_key_id:
    type: string
  aws_secret_access_key:
    type: string
  aws_session_token:
    type: string
  collection_id:
    type: string
  staging_bucket:
    type: string
  catalog_file:
    type: File
  sample_output_data:
    type: Directory

outputs:
  stage_out_results:
    type: File
    outputBinding:
      glob: "$(runtime.outdir)/stage-out-results.json"
