# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module environment

# general
export TZ="America/New_York"
export LPASS_AGENT_TIMEOUT=0
export EDITOR="vim"
export VISUAL="code"

# path
path=(
  $HOME/bin
  /usr/local/{sbin,bin}
  /usr/{sbin,bin}
  /{sbin,bin}
  /usr/local/share/npm/bin
  .
  $path
)
typeset -gxU path

# dotfiles
[[ -d "$HOME/.config/dotfiles" ]] && export DOTFILES="$HOME/.config/dotfiles"
