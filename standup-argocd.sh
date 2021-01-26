kubectl create namespace argocd
kubectl apply -n argocd -R -f ./manifests/argocd

#TODO: loop until ingress is ready. validate with:
# curl -k https://`kubectl get svc -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' argocd-server`:80

#TODO: figure out TLS certs
