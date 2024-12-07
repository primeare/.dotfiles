#!/usr/bin/env bash

# exit immediately if a pipeline exits with a non-zero status
set -Eeuxo pipefail

# Install FNM (https://github.com/Schniz/fnm)
curl -fsSL https://fnm.vercel.app/install | bash -s -- --force-no-brew --install-dir "$HOME/.fnm" --skip-shell

# Setup Fish shell for FNM
mkdir -p ~/.config/fish/conf.d
cat << 'EOF' > "$HOME/.config/fish/conf.d/fnm.fish"
fish_add_path "$HOME/.fnm"
fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell fish | source
EOF

# Setup Fish FNM completions
fnm completions --shell=fish > ~/.config/fish/completions/fnm.fish

# Install latest Node.js version
fnm install --latest
