function cleanupgcloud {
    gcloud projects delete $GCLOUD_PROJECT_ID
}

function gcommit {
    git add * .??*;git commit -m "${1}";git push
}

function getingresses {
   kubectl get svc --all-namespaces -o custom-columns=Namespace:.metadata.namespace,Name:.metadata.name,Type:.spec.type,ExternalIp:.status.loadBalancer.ingress[0].ip | grep LoadBalancer
}
