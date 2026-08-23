#!/usr/bin/env bash

set -e

export IMAGE="$1"

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 060822012241.dkr.ecr.us-east-1.amazonaws.com

docker-compose pull

docker-compose up -d

echo "Deployment successful: $IMAGE"
