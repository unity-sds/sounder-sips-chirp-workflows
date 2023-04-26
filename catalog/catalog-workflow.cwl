#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
label: Workflow that executes the Sounder SIPS end-to-end chirp rebinngin workflow

$namespaces:
  cwltool: http://commonwl.org/cwltool#

requirements:
  SubworkflowFeatureRequirement: {}

## Inputs to the e2e rebinning, not to each applicaiton within the workflow
inputs:
  # the UDS colleciton to which the files are going to be cataloged
  uds_collection : string
  # The stac outputs that defines the files that are to be cataloged
  stac: File


# Outputs are the catalog STAC or url to the dapa search that returns the files just uploaded
outputs:
  results:
    type: File
    outputSource: catalog/results

steps:
    catalog:
      run: "catalog-tool.cwl"
      in:
        uds_collection: uds_collection
        files: stac
      # this is a stac catalog pointing to the CMR STAC as an item
      out: [results]
