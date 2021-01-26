function cleanupgcloud {
    gcloud projects delete $GCLOUD_PROJECT_ID
}

function gcommit {
    git add * .??*;git commit -m "${1}";git push
}
