#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

function install_fira_code() {
  if [[ -f "$HOME/Library/Fonts/FiraCode-VF.ttf" ]]; then
    echo "Fira Code font is already installed"
    exit 0
  fi

  FIRA_CODE_LATEST_RELEASE=$(curl https://api.github.com/repos/tonsky/FiraCode/releases/latest --fail --compressed --location --silent)
  LATEST_FIRA_CODE_DOWNLOAD_URL=$(grep --extended-regexp --only-matching 'https:.+\.zip' <<< "$FIRA_CODE_LATEST_RELEASE")
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
