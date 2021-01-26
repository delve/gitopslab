if ! `kubectl get ns argocd > /dev/null 2>&1`
then
    kubectl create namespace argocd
    kubectl apply -n argocd -R -f ./manifests/argocd
fi

#TODO: loop until ingress is ready. validate with:
# curl -k https://`kubectl get svc -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' argocd-server`:80
echo "Your ArgoCD server is at https://`kubectl get svc -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' argocd-server`:80"
echo "Your default admin password is `kubectl get pod -o name -l app.kubernetes.io/name=argocd-server -n argocd | sed s#pod/##`"

#TODO: figure out TLS certs
