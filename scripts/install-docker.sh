#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuo pipefail

OS_PLATFORM_ARCH=$(uname -m)
DMG_OUTPUT_PATH="./docker.dmg"

if [[ $OS_PLATFORM_ARCH == 'arm64' ]]; then
  DMG_DOWNLOAD_URL="https://desktop.docker.com/mac/main/arm64/Docker.dmg"
else
  DMG_DOWNLOAD_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg"
fi

curl $DMG_DOWNLOAD_URL \
  --output $DMG_OUTPUT_PATH \
  --fail \
  --compressed \
  --location

sudo hdiutil attach $DMG_OUTPUT_PATH
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license --user="$(whoami)"
sudo hdiutil unmount "/Volumes/Docker"

rm -rf $DMG_OUTPUT_PATH
