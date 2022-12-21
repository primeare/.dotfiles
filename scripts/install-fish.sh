#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

PKG_DOWNLOAD_URL=$(curl "https://fishshell.com" --fail --compressed --location --silent | grep --extended-regexp --only-matching 'https:\/\/.+\d+\.\d+\.\d+\.pkg' | head -1)
PKG_OUTPUT_PATH="./fish-latest.pkg"

curl "$PKG_DOWNLOAD_URL" \
    --output $PKG_OUTPUT_PATH \
    --fail \
    --compressed \
    --location

sudo installer -store -pkg $PKG_OUTPUT_PATH -target "/" -verbose

# change current user's shell to Fish
chsh -s /usr/local/bin/fish

rm -f $PKG_OUTPUT_PATH
