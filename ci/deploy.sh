#!/bin/bash

set -e

function docker_tag_exists() {
  local token=$(curl -s -H "Content-Type: application/json" -X POST \
    -d '{"username": "'${DOCKER_USER}'", "password": "'${DOCKER_PASS}'"}' \
    https://hub.docker.com/v2/users/login/ | jq -r .token)
  local found=$(curl -s -H "Authorization: JWT ${token}" \
    https://hub.docker.com/v2/repositories/$1/tags/?page_size=10000 | \
    jq -r "[.results | .[] | .name == \"$2\"] | any")
  test $found = true
}

VERSION="$(docker run -it --rm ${DOCKER_REPO}:pre --version)"
VERSION=$(tr -dc '[[:print:]]' <<< "$VERSION") # Clean up.

if docker_tag_exists ${DOCKER_REPO} "${VERSION}"; then
  echo "${DOCKER_REPO}:${VERSION} exists in Docker Hub"
else
  docker tag "${DOCKER_REPO}:pre" "${DOCKER_REPO}:${VERSION}"
  docker tag "${DOCKER_REPO}:pre" "${DOCKER_REPO}:latest"
  docker login -u $DOCKER_USER -p $DOCKER_PASS
  docker push "${DOCKER_REPO}:${VERSION}"
  docker push "${DOCKER_REPO}:latest"
fi
