#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -eo pipefail

INSTALL_STARSHIP_SCRIPT_TEMP_PATH="./install-starship.sh"

# download Starship prompt installation script
# - fail silently on server error and return error 22
# - request a compressed response
# - redirect automatically if server sends Location header
curl https://starship.rs/install.sh \
  --output $INSTALL_STARSHIP_SCRIPT_TEMP_PATH \
  --fail \
  --compressed \
  --location

# make Starship prompt installation script executable
chmod +x ./install-starship.sh

# install Starship prompt
./install-starship.sh --yes

# delete Starship prompt installation script
rm -f ./install-starship.sh
