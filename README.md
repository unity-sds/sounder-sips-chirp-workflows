# Test

Run the following command with a CWL runner.

`cwltool chirp-rebinning-e2e-workflow.cwl chirp-rebinning-e2e-workflow_input_sample_job_1.yml`

For development these flags are helpful:

```
mkdir cache
cwltool --debug --no-read-only --cachedir cache chirp-rebinning-e2e-workflow.cwl chirp-rebinning-e2e-workflow_input_sample_job_1.yml
```

## Running in the Unity Platform

The workflow is setup to run in the unity platform. It relies on access to the SSM Parameter Store and IAM access to the S3 buckets for reading and writing.

These values can be updated in the `chirp-rebinning-e2e-workflow.cwl` file:

### Updating the Stage-in credentials
```
edl_password: '/sps/processing/workflows/edl_password',
edl_username: '/sps/processing/workflows/edl_username',
edl_password_type: 'PARAM_STORE'
```
The password and username fields are parameter store entries to use for those values.


### updating the stage-out credentials
```
aws_access_key_id: '',
aws_region: 'us-west-2',
aws_secret_access_key: '',
aws_session_token: '',
collection_id: self[1],
staging_bucket: self[0]
```

With no access key, secret, and token, the code should use the IAM role provided in the Unity platform to ensure read/write access to the specified bucket.

### Updating the catalog credentials
```
  unity_username:
    valueFrom: "/sps/processing/workflows/unity_username"
  unity_password:
    valueFrom: "/sps/processing/workflows/unity_password"
  password_type:
    valueFrom: "PARAM_STORE"
```

The above username/password fields are SSM paramter store entries to use.

## Running in via command line (outside Unity, AWS)

Running outside of the Unity environment, one might not have access to SSM entries, in this case the entries must be updated.

### Updating the Stage-in credentials
```
edl_password: '/sps/processing/workflows/edl_password',
edl_username: '/sps/processing/workflows/edl_username',
edl_password_type: 'PARAM_STORE'
```
* Update the edl_password_type to 'BASE64'
* Replace the username and password fields with Base64 encoded values of your EDL username and password.


### updating the stage-out credentials
```
aws_access_key_id: '',
aws_region: 'us-west-2',
aws_secret_access_key: '',
aws_session_token: '',
collection_id: self[1],
staging_bucket: self[0]
```

* Replace the accesskey, secret, and session token fields to the values provided by AWS when creating a STS (short term session) token.

### Updating the catalog credentials
```
  unity_username:
    valueFrom: "/sps/processing/workflows/unity_username"
  unity_password:
    valueFrom: "/sps/processing/workflows/unity_password"
  password_type:
    valueFrom: "PARAM_STORE"
```

* Update the password_type to 'BASE64'
* Replace the username and password fields with Base64 encoded values of your Unity username and password.