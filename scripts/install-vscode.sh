#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuo pipefail

VSCODE_DOWNLOAD_URL="https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
FILE_TEMP_OUTPUT_PATH="./vscode.zip"

curl $VSCODE_DOWNLOAD_URL \
  --output $FILE_TEMP_OUTPUT_PATH \
  --fail \
  --compressed \
  --location

unzip -ao $FILE_TEMP_OUTPUT_PATH

mv -f -v "./Visual Studio Code.app" "/Applications/Visual Studio Code.app"

rm -rf $FILE_TEMP_OUTPUT_PATH
