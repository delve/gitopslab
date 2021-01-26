[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/delve/gitopslab)
# gitopslab

## Pre-reqs
You'll need a GCP account. It probably needs billing enabled.

You'll need to allow [GitPod](https://gitpod.io/) access to your github.

The GitPod contains all the binaries required for operation.

## Running
Open a GitPod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/...)

The container will step through authorizing the gcloud SDK and selecting or creating a project space.

----------
**Caution**: Beyond this point you will create billable resources. To clean 
those up you can delete the project with the `cleanupgcloud` function defined 
in the container or by deleting the project or resources manually via gcloud CLI 
or the web console. Or you can disable billing on the project https://cloud.google.com/billing/docs/how-to/modify-project#disable_billing_for_a_project

----------

After project initialization is complete execute the standup-cluster.sh script. This  
will prepare the project to host the cluster and applications by turning on required services then 
create the GKE cluster and configure your `kubectl` to connect.
