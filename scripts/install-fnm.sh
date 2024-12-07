#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

FNM_PATH="$HOME/.fnm"

# Install FNM (https://github.com/Schniz/fnm)
curl -fsSL https://fnm.vercel.app/install | bash -s -- --force-no-brew --install-dir "$FNM_PATH" --skip-shell

# Setup Fish shell for FNM
mkdir -p ~/.config/fish/conf.d
cat << 'EOF' > "$HOME/.config/fish/conf.d/fnm.fish"
fish_add_path "$HOME/.fnm"
fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell fish | source
EOF

# Setup Fish FNM completions
"$FNM_PATH/fnm" completions --shell=fish > ~/.config/fish/completions/fnm.fish

# Install latest Node.js version
"$FNM_PATH/fnm" install --latest
