#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

function install_fira_code() {
  if [[ -f "$HOME/Library/Fonts/FiraCode-VF.ttf" ]]; then
    echo "Fira Code font is already installed"
    exit 0
  fi

  LATEST_FIRA_CODE_DOWNLOAD_URL="https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
  ZIP_TMP_FOLDER_PATH="./fira-code"
  ZIP_TEMP_OUTPUT_PATH="$ZIP_TMP_FOLDER_PATH/font.zip"

  mkdir -p -v $ZIP_TMP_FOLDER_PATH

  curl "$LATEST_FIRA_CODE_DOWNLOAD_URL" \
    --output "$ZIP_TEMP_OUTPUT_PATH" \
    --show-error \
    --fail \
    --compressed \
    --location

  unzip -ao -d "$ZIP_TMP_FOLDER_PATH" "$ZIP_TEMP_OUTPUT_PATH"

  cp -v "$ZIP_TMP_FOLDER_PATH/variable_ttf/FiraCode-VF.ttf" "$HOME/Library/Fonts"
  rm -rf "$ZIP_TMP_FOLDER_PATH"
}

install_fira_code
