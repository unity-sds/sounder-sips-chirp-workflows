# Test

Run the following command with a CWL runner.

`cwltool chirp-rebinning-e2e-workflow.cwl chirp-rebinning-e2e-workflow_input_sample_job_1.yml`

For development these flags are helpful:

```
mkdir cache
cwltool --debug --no-read-only --cachedir cache chirp-rebinning-e2e-workflow.cwl chirp-rebinning-e2e-workflow_input_sample_job_1.yml
```
