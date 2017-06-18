#!/bin/bash

set -e

WORKSPACE="${WORKSPACE:-$(git rev-parse --show-toplevel)}"
cd "${WORKSPACE}"

pushd "${WORKSPACE}/dockerfile"
  docker build -t "${DOCKER_REPO}:pre" .
  docker images
popd
