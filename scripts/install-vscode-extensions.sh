#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

VSCODE_EXTENSIONS_JSON_PATH="$(dirname "$0")/../.vscode/extensions.json"
VSCODE_CMD="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

if [[ ! -f "$VSCODE_EXTENSIONS_JSON_PATH" ]]; then
  echo "Error: $VSCODE_EXTENSIONS_JSON_PATH file not found."
  exit 1
fi

VSCODE_EXTENSIONS=$(node --input-type=module --eval "
  import { readFileSync } from 'node:fs';

  const data = readFileSync('$VSCODE_EXTENSIONS_JSON_PATH', 'utf8');
  const json = JSON.parse(data);

  if (!Array.isArray(json.recommendations)) {
    throw new Error('\'recommendations\' is not an array.');
  }

  console.log(json.recommendations.join(' '));
")

if [[ -z "$VSCODE_EXTENSIONS" ]]; then
  echo "No recommendations found in $VSCODE_EXTENSIONS_JSON_PATH."
  exit 0
fi

INSTALL_FLAGS=()

for EXTENSION in $VSCODE_EXTENSIONS; do
  INSTALL_FLAGS+=(--install-extension "$EXTENSION")
done

"$VSCODE_CMD" "${INSTALL_FLAGS[@]}"
