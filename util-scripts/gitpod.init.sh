gcloud auth login
# new project?
gcloud projects list
read -p "Enter an existing project ID or 'new' to create a fresh one: " GCLOUD_PROJECT_ID
if [[ $GCLOUD_PROJECT_ID != 'new' ]]
then
    gcloud config set project $GCLOUD_PROJECT_ID
    # check if there's a cluster and load the kubeconfig
    clustername=`gcloud container clusters list | sed -n 2p | cut -d' ' -f1`
    if [[ ${#clustername} > 0 ]]
    then
        echo "Setting up kubeconfig for existing cluster ${clustername}"
        gcloud container clusters get-credentials ${clustername}
    fi
else
    read -p "Enter a name for the new project: " GCLOUD_PROJECT_NAME
    # todo: validate name. must -star with letter -be 6-30 alphanumeric
    gcloud projects create --name=$GCLOUD_PROJECT_NAME --set-as-default --quiet
    # export GCLOUD_PROJECT_ID=`gcloud config get-value core/project`
fi

export GCLOUD_PROJECT_ID=`gcloud config get-value core/project`
gcloud config set compute/region europe-west2
gcloud config set compute/zone europe-west2-a 

echo "GCloud SDK configured with"
gcloud config list
printf "\n\nThe above configuration can be updated with\n\`gcloud config set [section]/[property] [new value]\`\n"
printf "\nUse \`gcloud compute (zones|regions) list\` to see available compute zones.\n"
echo "Please open the GCP console and link your project to a billing account if it isn't already."
