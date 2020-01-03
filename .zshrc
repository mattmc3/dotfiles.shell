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
## setup prezto

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Add additional directories to load prezto modules from
zstyle ':prezto:load' pmodule-dirs ${ZDOTDIR:-$HOME}/.zprezto-contrib

# which prezto modules do you want? order matters!
# remember to do syntax-highlighting before substring search
zstyle ':prezto:load' pmodule \
  'autosuggestions' \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt' \
  'osx' \
  'aliases' \
  'cd-ls' \
  'iwd' \
  'safe-rm' \
  'z' \
  'zfunctions' \
  'syntax-highlighting' \
  'history-substring-search'

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'emacs'

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

# Set the keyword used by `mand` to open man pages in Dash.app
zstyle ':prezto:module:osx:man' dash-keyword 'manpages'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'sorin'

# Set the working directory prompt display length.
# By default, it is set to 'short'. Set it to 'long' (without '~' expansion)
# for longer or 'full' (with '~' expansion) for even longer prompt display.
# zstyle ':prezto:module:prompt' pwd-length 'short'

# Set the prompt to display the return code along with an indicator for non-zero
# return codes. This is not supported by all prompts.
zstyle ':prezto:module:prompt' show-return-val 'yes'

# Enabled safe options. This aliases cp, ln, mv and rm so that they prompt
# before deleting or overwriting files. Set to 'no' to disable this safer
# behavior.
zstyle ':prezto:module:utility' safe-ops 'yes'


#####
## load prezto

[[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]] || git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
[[ -d "${ZDOTDIR:-$HOME}/.zprezto-contrib" ]] || git clone --recursive git@github.com:mattmc3/zprezto-contrib.git "${ZDOTDIR:-$HOME}/.zprezto-contrib"
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
