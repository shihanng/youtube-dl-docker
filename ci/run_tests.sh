#!/bin/bash

set -e

docker run -it --rm "${DOCKER_REPO}":pre --version
