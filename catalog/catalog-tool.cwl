cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["CATALOG"]

stdout: catalog-results.json

requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:5.2.1
  EnvVarRequirement:
    envDef:
      AWS_REGION: $(inputs.aws_region)
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
      AWS_SESSION_TOKEN: $(inputs.aws_session_token)

      USERNAME: $(inputs.unity_username)
      PASSWORD: $(inputs.unity_password)
      PASSWORD_TYPE: 'PARAM_STORE'

      CLIENT_ID: $(inputs.unity_client_id)
      COGNITO_URL: $(inputs.unity_cognito_url)
      DAPA_API: $(inputs.unity_dapa_api)

      PROVIDER_ID: 'SNPP'
      GRANULES_CATALOG_TYPE: 'UNITY'
      UPLOADED_FILES_JSON: $(inputs.uploaded_files_json.path)

inputs:
  unity_username:
    type: string
  unity_password:
    type: string
  unity_client_id:
    type: string
  unity_cognito_url:
    type: string
    default: https://cognito-idp.us-west-2.amazonaws.com
  unity_dapa_api:
    type: string
  uploaded_files_json:
    type: File

outputs:
  catalog_results:
    type: stdout
