#!/bin/bash

source ./_repo_vars.sh

if [[ ! "$(docker images -q ${BUILD_IMAGE_NAME_AND_TAG} 2> /dev/null)" == "" ]]; then
  if [[ "E${1}" != "Eforce" ]]; then
    exit 0
  fi
fi

CUR_DIR=$(pwd)
cd ./build_image
docker build -t ${BUILD_IMAGE_NAME_AND_TAG} --build-arg PYTHON_IMAGE=${PYTHON_IMAGE} .

cd ${CUR_DIR}

exit 1
