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
[[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]] || git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
[[ -d "${ZDOTDIR:-$HOME}/.oh-my-zsh" ]] || git clone --recursive https://github.com/ohmyzsh/ohmyzsh.git "${ZDOTDIR:-$HOME}/.oh-my-zsh"
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# corrections
# unsetopt CORRECT               # don't try to correct the spelling of commands
# unsetopt CORRECT_ALL           # don't try to correct the spelling of all arguments in a line

# # general
# export TZ="America/New_York"
# export LPASS_AGENT_TIMEOUT=0
# export EDITOR="vim"
# export VISUAL="code"

# # path
# path=(
#   $HOME/bin
#   /usr/local/{sbin,bin}
#   /usr/{sbin,bin}
#   /{sbin,bin}
#   /usr/local/share/npm/bin
#   .
#   $path
# )
# typeset -gxU path
