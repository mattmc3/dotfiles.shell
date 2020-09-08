# execute 'ZPROF_ENABLE=1 zsh' and run 'zprof' to get profiler details
alias zprofile='ZPROF_ENABLE=1 zsh'
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'
if [[ $ZPROF_ENABLE -gt 0 ]] ; then
  zmodload zsh/zprof
  echo 'run `zprof` to profile...'
fi

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

# use antibody as our plugin manager
export ANTIBODY_HOME=$ZDOTDIR/.antibody
export ZSH_CUSTOM=$ZDOTDIR/custom

# # dynamic plugins
# source <(antibody init)
# #antibody bundle < $ZDOTDIR/.zsh_plugins
# envsubst < $ZDOTDIR/zsh_plugins.conf | antibody bundle

# static plugins
if [[ ! -f "$ZDOTDIR/.zsh_plugins.zsh" ]]; then
  envsubst < $ZDOTDIR/.zsh_plugins | antibody bundle > $ZDOTDIR/.zsh_plugins.zsh
  sed -i '' "s|$HOME|\$HOME|g" $ZDOTDIR/.zsh_plugins.zsh
fi
source $ZDOTDIR/.zsh_plugins.zsh

# change any plugin settings after loading
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
PURE_PROMPT_SYMBOL="%%"
