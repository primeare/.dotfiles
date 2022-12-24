#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

if command -v code &> /dev/null; then
  echo "Visual Studio Code is already installed"
  exit 0
fi

VSCODE_DOWNLOAD_URL="https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
FILE_TEMP_OUTPUT_PATH="./vscode.zip"

curl "$VSCODE_DOWNLOAD_URL" \
  --output $FILE_TEMP_OUTPUT_PATH \
  --fail \
  --compressed \
  --location

unzip -ao $FILE_TEMP_OUTPUT_PATH

mv -f -v "./Visual Studio Code.app" "/Applications/Visual Studio Code.app"

rm -rf $FILE_TEMP_OUTPUT_PATH
