#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuo pipefail

install_fira_code() {
  ZIP_DOWNLOAD_URI=$(curl "https://github.com/tonsky/FiraCode/releases" --fail --compressed --location --silent | grep --extended-regexp --only-matching '\/.+\/download\/.+\.zip' | head -1)
  ZIP_DOWNLOAD_URL="https://github.com$ZIP_DOWNLOAD_URI"
  ZIP_TMP_FOLDER_PATH="./fira-code"
  ZIP_TEMP_OUTPUT_PATH="$ZIP_TMP_FOLDER_PATH/font.zip"

  mkdir -p $ZIP_TMP_FOLDER_PATH

  curl "$ZIP_DOWNLOAD_URL" \
    --output $ZIP_TEMP_OUTPUT_PATH \
    --fail \
    --compressed \
    --location

  unzip -ao -d $ZIP_TMP_FOLDER_PATH $ZIP_TEMP_OUTPUT_PATH

  cp -v "$ZIP_TMP_FOLDER_PATH/variable_ttf/FiraCode-VF.ttf" ~/Library/Fonts
  rm -rf $ZIP_TMP_FOLDER_PATH
}

install_fira_code
