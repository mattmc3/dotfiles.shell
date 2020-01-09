#####
## zsh performance

# execute 'ZPROF_ENABLE=1 zsh' and run 'zprof' to get profiler details
alias zperf='ZPROF_ENABLE=1 zsh'
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'
if [[ $ZPROF_ENABLE -gt 0 ]] ; then
  zmodload zsh/zprof
  echo 'run `zprof` to profile...'
fi


#####
## prezto
ZSH_CUSTOM=$ZDOTDIR/.zsh_custom
#[[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]] || git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
[[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]] || git clone --recursive https://github.com/zshzoo/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
[[ -d "${ZDOTDIR:-$HOME}/.zsh_custom" ]] || git clone --recursive git@github.com:mattmc3/zsh_custom.git "$ZSH_CUSTOM"
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#####
## override prezto settings and do any other config

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

# corrections
unsetopt CORRECT               # don't try to correct the spelling of commands
unsetopt CORRECT_ALL           # don't try to correct the spelling of all arguments in a line

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

## local
# make sure that the dotfiles .zshrc.local exists
if [[ ! -f "${ZDOTDIR:-HOME}"/.zshrc.local ]] && [[ -f "${DOTFILES}"/local/zsh/zsh/zshrc.local.zsh ]]; then
  ln -s "${DOTFILES}"/local/zsh/zsh/zshrc.local.zsh "${ZDOTDIR:-HOME}"/.zshrc.local
fi
[[ -f "${ZDOTDIR:-HOME}"/.zshrc.local ]] && . "${ZDOTDIR:-HOME}"/.zshrc.local
