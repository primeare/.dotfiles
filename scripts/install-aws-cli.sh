#!/usr/bin/env bash

set -Eeuxo pipefail

PKG_DOWNLOAD_URL="https://awscli.amazonaws.com/AWSCLIV2.pkg"
PKG_OUTPUT_PATH="./AWS-CLI-V2.pkg"

curl "$PKG_DOWNLOAD_URL" \
    --output $PKG_OUTPUT_PATH \
    --fail \
    --compressed \
    --location

sudo installer -pkg $PKG_OUTPUT_PATH -target "/" -verbose

rm -f $PKG_OUTPUT_PATH

cat << 'EOF' > "$HOME/.config/fish/completions/aws.fish"
function __fish_complete_aws
  env COMP_LINE=(commandline --current-process --cut-at-cursor) aws_completer | tr -d ' '
end

complete --command aws --no-files --arguments "(__fish_complete_aws)"
EOF
