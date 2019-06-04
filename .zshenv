# # ~/.zshenv sources this file. It should only contain the following lines:
#
# export ZDOTDIR=~/.zsh
# [[ -f $ZDOTDIR/.zshenv ]] source $ZDOTDIR/.zshenv
#

# Make sure XDG dirs are set
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.xdg}"