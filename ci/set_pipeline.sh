#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ALIAS=${1:-emerald-squad}
PARAMS=${2:-$DIR/params.yml}
PIPELINE_NAME=${3:-sonar-scanner}

fly -t "${ALIAS}" sp -p "${PIPELINE_NAME}" -c $DIR/pipeline.yml -l "${PARAMS}" --non-interactive 

