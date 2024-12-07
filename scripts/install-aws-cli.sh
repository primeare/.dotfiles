#!/usr/bin/env bash

set -Eeuxo pipefail

PKG_DOWNLOAD_URL="https://awscli.amazonaws.com/AWSCLIV2.pkg"
PKG_OUTPUT_PATH="./AWS-CLI-V2.pkg"

curl "$PKG_DOWNLOAD_URL" \
    --output $PKG_OUTPUT_PATH \
    --fail \
    --compressed \
    --location

sudo installer -pkg $PKG_OUTPUT_PATH -target "/" -verbose

rm -f $PKG_OUTPUT_PATH
