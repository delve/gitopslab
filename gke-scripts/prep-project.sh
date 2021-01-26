set -e
#TODO: `gcloud billing` is currently anemic. the beta track has some functions that might be useful for automated connection, but it's nontrivial.
#      leaving it to the user to do manually for now.

GKEAPI='container.googleapis.com'
#if GKEAPI not enabled for project
if [[ `gcloud services list | grep ${GKEAPI}` = '' ]]
then
    echo "Enabling ${GKEAPI}"
    gcloud services enable ${GKEAPI}
fi

#TODO: determine minimum quotas. put relevant checks here
