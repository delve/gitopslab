set -e
./gke-scripts/prep-project.sh
printf "\n\nCAUTION: You are about to create billable resources. CTRL-C now if you'd rather not.\n"
set +e
read -t 15 -p "Script will proceed in 15 seconds, or hit [Enter] to continue."
echo ""
set -e
./gke-scripts/init-cluster.sh
