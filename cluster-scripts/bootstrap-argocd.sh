if ! `kubectl get ns argocd > /dev/null 2>&1`
then
    kubectl create namespace argocd
    kubectl apply -n argocd -R -f ./cluster-scripts/bootstrap-argocd
fi

git clone -b ${MANIFEST_BRANCH} ${MANIFEST_REPO} /workspace/argo_manifests
kubectl apply -n argocd -R -f /workspace/argo_manifests/argocd

# wait until ingress is ready. IE: kubectl get svc -n argocd argocd-server -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' gets an IP address from GCP
while [[ `kubectl get svc -n argocd argocd-server -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'` = '' ]]
do
    echo 'Waiting for ingress to be ready'
    sleep 10
done
# validate with:
# curl -k https://`kubectl get svc -n argocd argocd-server -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'`:80
echo "Your ArgoCD server is at https://`kubectl get svc -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' argocd-server`:80"
echo "Your default admin password is `kubectl get pod -o name -l app.kubernetes.io/name=argocd-server -n argocd | sed s#pod/##`"

#TODO: figure out TLS certs
