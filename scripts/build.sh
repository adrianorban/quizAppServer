#!/bin/sh

echo "********************"
echo "** BUILDING IMAGE **"
echo "********************"

# Create images
echo "Creating the image"
docker image build --build-arg build_number=$BUILD_NUMBER -t only-gamers-api ./server/

echo "Adding tags to image: latest and $BUILD_NUMBER"
docker tag only-gamers-api claudiualbulete/only-gamers-api:latest
docker tag only-gamers-api claudiualbulete/only-gamers-api:build-$BUILD_NUMBER
