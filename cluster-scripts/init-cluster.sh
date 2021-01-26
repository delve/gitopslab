clustername=`gcloud container clusters list | sed -n 2p | cut -d' ' -f1`
if [[ ${#clustername} = 0 ]]
then
    gcloud container clusters create gitops --num-nodes=1
fi
