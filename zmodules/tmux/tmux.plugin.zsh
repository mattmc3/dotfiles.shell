# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module tmux

# tmux sucks at modern and uses -f instead of knowing about XDG
if [[ -n "$XDG_CONFIG_HOME" ]]; then
  export TMUX_CONFIG="$XDG_CONFIG_HOME"/tmux/tmux.conf
else
  export TMUX_CONFIG="$HOME"/.tmux.conf
fi
alias tmux='tmux -f "$TMUX_CONFIG"'
