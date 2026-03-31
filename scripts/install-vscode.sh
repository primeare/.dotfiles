#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

if command -v code &> /dev/null; then
  echo "Visual Studio Code is already installed"
  exit 0
fi

VSCODE_DOWNLOAD_URL="https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal-dmg"
DMG_OUTPUT_PATH="./vscode.dmg"

curl "$VSCODE_DOWNLOAD_URL" \
  --output $DMG_OUTPUT_PATH \
  --fail \
  --compressed \
  --location

sudo hdiutil attach $DMG_OUTPUT_PATH
cp -r -v "/Volumes/VS Code/Visual Studio Code.app/" "/Applications/Visual Studio Code.app"
sudo hdiutil detach "/Volumes/VS Code"

rm -rf $DMG_OUTPUT_PATH
