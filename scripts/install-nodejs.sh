#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

LATEST_NODEJS_VERSION=$(curl "https://nodejs.org/dist/latest/" --fail --compressed --location --silent | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')
PKG_DOWNLOAD_URL="https://nodejs.org/dist/latest/node-$LATEST_NODEJS_VERSION.pkg"
PKG_OUTPUT_PATH="./node-latest.pkg"
NPM_GLOBAL_PACKAGE_DIR_PATH="$HOME/.npm-packages/bin"
NODEJS_SHIMS_DIR_PATH="$HOME/.node-shims"

curl "$PKG_DOWNLOAD_URL" \
    --output $PKG_OUTPUT_PATH \
    --fail \
    --compressed \
    --location

sudo installer -store -pkg $PKG_OUTPUT_PATH -target "/" -verbose

rm -f $PKG_OUTPUT_PATH

# create NPM global package directory if it does not exist
mkdir -p -v "$NPM_GLOBAL_PACKAGE_DIR_PATH"
mkdir -p -v "$NODEJS_SHIMS_DIR_PATH"

# enable third-party package managers and install their shims
corepack enable --install-directory "$NODEJS_SHIMS_DIR_PATH"
