#!/usr/bin/env bash

GIT=$1
ASSETS_DIR=$2
GLOBAL_PATH=$(pwd)

TAG="DAWN-2018-05-16"

echo "Start provisioner assets download...";

if [[ ! -d ASSETS_DIR ]]; then

	echo "Submitted asset dir is invalid. Exiting...";
fi

cd $ASSETS_DIR

if ! git clone $GIT --branch master --depth 1
    then
        printf "\n Failed to clone provisioning assets.\\n"
        printf "\n Goodbye...\\n\\n"
        exit 1;
    fi