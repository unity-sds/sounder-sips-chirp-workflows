#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
cwlVersion: v1.2
$graph:
  - class: Workflow
    id: main
    inputs:
      parameters:
        type:
          fields:
            output_collection:
            - 'null'
            - string
          type: record
      stage_in:
        type:
          fields:
            download_type: string
            edl_password:
            - string
            - 'null'
            edl_username:
            - string
            - 'null'
            stac_json: File
            edl_password_type: string
          type: record
      stage_out:
        type:
          fields:
            aws_access_key_id:
            - string
            - 'null'
            aws_region:
            - string
            - 'null'
            aws_secret_access_key:
            - string
            - 'null'
            aws_session_token:
            - string
            - 'null'
            collection_id:
            - string
            - 'null'
            staging_bucket:
            - string
            - 'null'
          type: record
    outputs:
      stage_out_results:
        type: File
        outputSource: stage_out/stage_out_results

    requirements:
      InlineJavascriptRequirement: {}
      NetworkAccess:
        networkAccess: true
      StepInputExpressionRequirement: {}
      SubworkflowFeatureRequirement: {}
    steps:
      process:
        in:
          download_dir: stage_in/stage_in_download_dir
          output_collection:
            source: parameters
            valueFrom: $(self.output_collection)
        out:
        - process_output_dir
        - process_output_nb
        run: "#process"
      stage_in:
        in:
          download_type:
            source: stage_in
            valueFrom: $(self.download_type)
          edl_password:
            source: stage_in
            valueFrom: $(self.edl_password)
          edl_username:
            source: stage_in
            valueFrom: $(self.edl_username)
          stac_json:
            source: stage_in
            valueFrom: $(self.stac_json)
        out:
        - stage_in_collection_file
        - stage_in_download_dir
        run: "#stage-in"
      stage_out:
        in:
          aws_access_key_id:
            source: stage_out
            valueFrom: $(self.aws_access_key_id)
          aws_secret_access_key:
            source: stage_out
            valueFrom: $(self.aws_secret_access_key)
          aws_session_token:
            source: stage_out
            valueFrom: $(self.aws_session_token)
          collection_id:
            source: stage_out
            valueFrom: $(self.collection_id)
          output_dir: process/process_output_dir
          staging_bucket:
            source: stage_out
            valueFrom: $(self.staging_bucket)
        out:
        - stage_out_results
        run: "#stage-out"

  #!/usr/bin/env cwl-runner
  - class: CommandLineTool
    id: stage-out
    baseCommand:
      - UPLOAD
    inputs:
      aws_access_key_id:
        default: ''
        type: string
      aws_region:
        default: us-west-2
        type: string
      aws_secret_access_key:
        default: ''
        type: string
      aws_session_token:
        default: ''
        type: string
      collection_id:
        default: ''
        type: string
      output_dir:
        type: Directory
      staging_bucket:
        default: ''
        type: string
    outputs:
      stage_out_results:
        outputBinding:
          glob: $(runtime.outdir)/stage-out-results.json
        type: File
    requirements:
      DockerRequirement:
        dockerPull: ghcr.io/unity-sds/unity-data-services:5.2.2
      EnvVarRequirement:
        envDef:
          AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
          AWS_REGION: $(inputs.aws_region)
          AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
          AWS_SESSION_TOKEN: $(inputs.aws_session_token)
          CATALOG_FILE: /tmp/outputs/catalog.json
          COLLECTION_ID: $(inputs.collection_id)
          OUTPUT_FILE: $(runtime.outdir)/stage-out-results.json
          STAGING_BUCKET: $(inputs.staging_bucket)
      InitialWorkDirRequirement:
        listing:
          - entry: $(inputs.output_dir)
            entryname: /tmp/outputs
    stdout: stage-out-results.json

  - class: CommandLineTool
    id: stage-in
    baseCommand:
    - DOWNLOAD
    inputs:
      download_type:
        type: string
      edl_password:
        type: string
      edl_username:
        type: string
      stac_json:
        type: File
      edl_password_type:
        default: PARAM_STORE 
        type: string
    outputs:
      stage_in_collection_file:
        outputBinding:
          glob: stage-in-results.json
        type: File
      stage_in_download_dir:
        outputBinding:
          glob: .
        type: Directory
    requirements:
      DockerRequirement:
        dockerPull: ghcr.io/unity-sds/unity-data-services:5.2.0
      EnvVarRequirement:
        envDef:
          DOWNLOAD_DIR: $(runtime.outdir)
          DOWNLOAD_RETRY_TIMES: '5'
          DOWNLOAD_RETRY_WAIT_TIME: '10'
          EDL_BASE_URL: https://urs.earthdata.nasa.gov/
          EDL_PASSWORD: $(inputs.edl_password)
          EDL_PASSWORD_TYPE: $(inputs.edl_password_type)
          EDL_USERNAME: $(inputs.edl_username)
          GRANULES_DOWNLOAD_TYPE: $(inputs.download_type)
          LOG_LEVEL: '10'
          OUTPUT_FILE: $(runtime.outdir)/stage-in-results.json
          PARALLEL_COUNT: '1'
          STAC_JSON: $(inputs.stac_json.path)

  #!/usr/bin/env cwl-runner
  - class: CommandLineTool
    id: process
    arguments:
    - -p
    - input_path
    - $(inputs.download_dir.path)/stage-in-results.json
    - -p
    - output_path
    - $(runtime.outdir)/process_output
    baseCommand:
    - papermill
    - /home/jovyan/process.ipynb
    - --cwd
    - /home/jovyan
    - process_output/output_nb.ipynb
    - -f
    - /tmp/inputs.json
    inputs:
      download_dir: Directory
      output_collection:
        default: SNDR13CHRP1AQCal_rebin
        type: string
    outputs:
      process_output_dir:
        outputBinding:
          glob: $(runtime.outdir)/process_output
        type: Directory
      process_output_nb:
        outputBinding:
          glob: $(runtime.outdir)/process_output/output_nb.ipynb
        type: File
    requirements:
      DockerRequirement:
        dockerPull: gangl/chirp-rebinning-app-package:cdd06646
      InitialWorkDirRequirement:
        listing:
        - entry: $(inputs)
          entryname: /tmp/inputs.json
        - entry: '$({class: ''Directory'', listing: []})'
          entryname: process_output
          writable: true
      InlineJavascriptRequirement: {}
      InplaceUpdateRequirement:
        inplaceUpdate: true
      NetworkAccess:
        networkAccess: true
      ShellCommandRequirement: {}
    stdout: stdout.txt
