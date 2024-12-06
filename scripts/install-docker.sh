#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

if command -v docker &> /dev/null; then
  echo "Docker Desktop is already installed"
  exit 0
fi

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

# setup command completions
docker completion fish > ~/.config/fish/completions/docker.fish
