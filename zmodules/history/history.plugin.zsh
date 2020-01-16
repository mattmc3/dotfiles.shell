# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module history

# history opts
setopt HIST_NO_STORE           # don't store history commands
setopt HIST_REDUCE_BLANKS      # remove superfluous blanks from each command line being added to the history list
setopt INC_APPEND_HISTORY      # write to the history file immediately, not when the shell exits
unsetopt SHARE_HISTORY         # don't share history between all sessions

# history vars
HISTFILE="$XDG_DATA_HOME/zsh/history"
[[ -d "$XDG_DATA_HOME/zsh" ]] || mkdir -p "$XDG_DATA_HOME/zsh"
[[ -f "${ZDOTDIR:-$HOME}/.zsh_history" ]] || ln -sf "$HISTFILE" "${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
