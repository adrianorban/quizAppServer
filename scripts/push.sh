#!/bin/sh

echo "*******************"
echo "** PUSHING IMAGE **"
echo "*******************"

# Login to DigitalOcean registry
echo "Login to docker hub"
docker login --username claudiualbulete --password $DOCKER_TOKEN

# Push the images intro registry
echo "Push the images"
docker push claudiualbulete/only-gamers-api:latest
docker push claudiualbulete/only-gamers-api:build-$BUILD_NUMBER
