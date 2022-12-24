#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

if command -v starship &> /dev/null; then
  echo "Starship Prompt is already installed"
  exit 0
fi

curl --show-error --silent https://starship.rs/install.sh | sh -s -- --yes
