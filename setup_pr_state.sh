#!/bin/bash

# Create a variable group that has variables for managing Pull Request. 
# e.g. setup_pr_state.sh -o https://dev.azure.com/yourorganization -p your_project_name
usage() { echo "Usage: setup_pr_state.sh -o <organization> -p <project>" 1>&2; exit 1; }

declare organization=""
declare project=""
declare stateName="pullrequest.state"

while getopts ":o:p:" arg; do
    case "${arg}" in
        o)
            organization=${OPTARG}
        ;;
        p)
            project=${OPTARG}
        ;;
    esac
done

Id=$(az pipelines variable-group create --authorize true --description "Store a Pipeline State for PullRequest" --org ${organization} --project "${project}" --name ${stateName} --variables "PullRequestNumber=0" | jq -r .id)
az pipelines variable-group variable create --group-id $Id --org ${organization} --project "${project}" --name "ExpireDate" --value "03/25/2010 14:40"
az pipelines variable-group variable create --group-id $Id --org ${organization} --project "${project}" --name "Status" --value "Completed"

