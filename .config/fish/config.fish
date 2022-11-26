# initialise Starship
starship init fish | source
enable_transience

# add global NPM package directory to PATH
fish_add_path "~/.npm-packages/bin"

# add Visual Studio Code (code) to PATH
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# set Visual Studio Code as a default text editor
set -gx EDITOR code --wait --new-window
set -gx VISUAL code --wait --new-window

# manual Visual Studio Code shell integration
string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)
