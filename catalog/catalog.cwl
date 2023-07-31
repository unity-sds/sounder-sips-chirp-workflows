#!/usr/bin/env cwl-runner
cwlVersion: v1.2
$namespaces:
      cwltool: http://commonwl.org/cwltool#
$graph:
  - class: Workflow
    id: main
    label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

    requirements:
      SubworkflowFeatureRequirement: {}
      NetworkAccess:
        networkAccess: true

    inputs:
      unity_username: string
      unity_password: string
      unity_client_id: string
      unity_dapa_api: string
      uploaded_files_json: File


    # Outputs are the catalog STAC or url to the dapa search that returns the files just uploaded
    outputs:
      results:
        type: File
        outputSource: catalog/catalog_results

    steps:
        catalog:
          run: "#catalog-tool"
          in:
            unity_username: unity_username
            unity_password: unity_password
            unity_client_id: unity_client_id
            unity_dapa_api: unity_dapa_api
            uploaded_files_json: uploaded_files_json
          out: [catalog_results]

  - class: CommandLineTool
    id: catalog-tool
    baseCommand: ["CATALOG"]
    stdout: catalog-results.json

    requirements:
      DockerRequirement:
        dockerPull: ghcr.io/unity-sds/unity-data-services:5.2.1
      EnvVarRequirement:
        envDef:
          USERNAME: $(inputs.unity_username)
          PASSWORD: $(inputs.unity_password)
          PASSWORD_TYPE: 'BASE64'

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
