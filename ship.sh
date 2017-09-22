#!/bin/bash
# ship.sh
# This script is our poor replacement for a continous deployment system.
#
# It builds your project's Dockerfile and pushes it to specified registry providing the following tags:
# * Current git revision, e.g. `1.0.0-133-g3ca213f`
# * Current branch name, e.g. `production`
#
# Place this file in your project root (sidelong with Dockerfile) , chmod +x ship.sh
# and update the NAME variable.
# Happy shipping!

NAME=rails

DOCKERFILE=Dockerfile

# Grab tag from source-project
TAG=$(git describe --tag)
BRANCHTAG=$(git rev-parse --abbrev-ref HEAD)

docker build \
  --label app_version=${TAG} \
  -t ${NAME}:${TAG} \
  -t ${NAME}:${BRANCHTAG} \
  -f $DOCKERFILE . && \
docker push ${NAME}:${TAG} && \
docker push ${NAME}:${BRANCHTAG} && \
echo "Version: ${TAG} successfully shipped"
