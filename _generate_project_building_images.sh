#!/bin/bash

source ./_repo_vars.sh

if [[ ! "$(docker images -q ${BUILD_IMAGE_NAME_AND_TAG} 2> /dev/null)" == "" ]]; then
  if [[ "E${1}" != "Eforce" ]]; then
    echo "No need to generate"
    exit 0
  fi
fi

echo "DD"
docker pull ${PYTHON_IMAGE}

CUR_DIR=$(pwd)
cd ./build_image
docker build -t ${BUILD_IMAGE_NAME_AND_TAG} --build-arg PYTHON_IMAGE=${PYTHON_IMAGE} .
DOCKER_BUIlD_RES=$?
if [[ ${DOCKER_BUILD_RES} -ne 0 ]]; then
  echo "Failed to generate build image"
  exit ${DOCKER_BUILD_RES}
fi


cd ${CUR_DIR}

exit 0
