function cleanupgcloud {
    gcloud projects delete $GCLOUD_PROJECT_ID
}
