# add global NPM package directory to PATH
fish_add_path "$HOME/.npm-packages/bin"
fish_add_path "$HOME/.bin"

# add Visual Studio Code (code) to PATH
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# command aliases and shortcuts
alias c="clear"

# set Visual Studio Code as a default text editor
set --global --export EDITOR code --wait --new-window
set --global --export VISUAL code --wait --new-window

# initialise Starship
starship init fish | source

# enable transient prompt
enable_transience
