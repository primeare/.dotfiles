#!/usr/bin/env sh

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

curl --show-error --silent https://starship.rs/install.sh | sh -s -- --yes
