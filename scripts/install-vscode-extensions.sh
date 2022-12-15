#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" \
  --install-extension aaron-bond.better-comments \
  --install-extension christian-kohler.npm-intellisense \
  --install-extension christian-kohler.path-intellisense \
  --install-extension cschlosser.doxdocgen \
  --install-extension dbaeumer.vscode-eslint \
  --install-extension dsznajder.es7-react-js-snippets \
  --install-extension eamodio.gitlens \
  --install-extension editorconfig.editorconfig \
  --install-extension github.github-vscode-theme \
  --install-extension meganrogge.template-string-converter \
  --install-extension mikestead.dotenv \
  --install-extension mongodb.mongodb-vscode \
  --install-extension ms-azuretools.vscode-docker \
  --install-extension ms-vscode.hexeditor \
  --install-extension ms-vscode.live-server \
  --install-extension ms-vscode.vscode-js-profile-flame \
  --install-extension prisma.prisma \
  --install-extension rangav.vscode-thunder-client \
  --install-extension redhat.vscode-commons \
  --install-extension redhat.vscode-xml \
  --install-extension redhat.vscode-yaml \
  --install-extension sonarsource.sonarlint-vscode \
  --install-extension streetsidesoftware.code-spell-checker \
  --install-extension tamasfe.even-better-toml \
  --install-extension timonwong.shellcheck \
  --install-extension visualstudioexptteam.intellicode-api-usage-examples \
  --install-extension visualstudioexptteam.vscodeintellicode \
  --install-extension vscode-icons-team.vscode-icons \
  --install-extension vsls-contrib.codetour
