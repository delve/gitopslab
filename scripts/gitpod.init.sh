gcloud auth login
# new project?
gcloud projects list
read -p "Enter an existing project ID or 'new' to create a fresh one: " GCLOUD_PROJECT_ID
if [[ $GCLOUD_PROJECT_ID != 'new' ]]
then
    gcloud config set project $GCLOUD_PROJECT_ID
else
    read -p "Enter a name for the new project: " GCLOUD_PROJECT_NAME
    # todo: validate name. must -star with letter -be 6-30 alphanumeric
    gcloud projects create --name=$GCLOUD_PROJECT_NAME --set-as-default --quiet
    # export GCLOUD_PROJECT_ID=`gcloud config get-value core/project`
fi
export GCLOUD_PROJECT_ID=`gcloud config get-value core/project`
