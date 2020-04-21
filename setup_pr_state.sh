#!/bin/bash

# Create a variable group that has variables for managing Pull Request. 

usage() { echo "Usage: setup_pr_state.sh -o <organization> -p <project> -k" 1>&2; exit 1; }

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

az pipelines variable-group create --org ${organization} --project ${project} --name ${stateName}

