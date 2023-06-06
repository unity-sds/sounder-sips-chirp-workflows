#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow
label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

$namespaces:
  cwltool: http://commonwl.org/cwltool#

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
      run: "catalog-tool.cwl"
      in:
        unity_username: unity_username
        unity_password: unity_password
        unity_client_id: unity_client_id
        unity_dapa_api: unity_dapa_api
        uploaded_files_json: uploaded_files_json
      out: [catalog_results]
